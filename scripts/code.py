#!/usr/bin/env python

import csv
import re

def tasks_yaml(distro='Debian'):
    with open('installed.csv','r') as fi:
        reader = csv.reader(fi)
        with open('tasks.yml','w') as fo:
            fo.write("---\n\n")
            fo.write("- name: {distro} update cache\n  apt:\n    update_cache: yes\n\n".format(distro=distro))
            for row in reader:
                pkg = row[0]
                pkg2 = re.sub("(-|\.)","_",pkg)
                task = """
- name: {distro} install {pkg}
  apt:
    name: {pkg}
    update_cache: no
  when:
    - ansible_distribution == "{distro}"
    - not skip_{pkg2}|default(no)

""".format(distro=distro,pkg=pkg,pkg2=pkg2)

                fo.write(task)



def defaults_yaml():
    with open('installed.csv','r') as fi:
        reader = csv.reader(fi)
        with open('defaults.yml','w') as fo:
            fo.write("---\n\n")
            for row in reader:
                pkg = row[0]
                pkg2 = re.sub("(-|\.)","_",pkg)
                deflt = "skip_{pkg2}: no".format(pkg2=pkg2)

                fo.write(deflt)
                fo.write("\n")





tasks_yaml('Debian')
defaults_yaml()

