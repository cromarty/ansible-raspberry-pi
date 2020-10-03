#!/bin/bash

#cat ~/tests.dat | \
for TEST in $(ls ../roles)
do
  echo $TEST
  mkdir -p $TEST/group_vars/alarmpi
  mkdir -p $TEST/group_vars/raspbian
  mkdir -p $TEST/host_vars/alarmpi
  mkdir -p $TEST/host_vars/raspbian
  mkdir $TEST/inventory

  cat <<EOF > $TEST/group_vars/alarmpi/vars.yml
---

# generate_tests.sh written stuff

ansible_user: "{{ vault_ansible_user }}"
ansible_become_pass: "{{ vault_ansible_become_pass }}"

default_user: alarm
default_group: alarm

# manually entered stuff


EOF

  cat <<EOF > $TEST/group_vars/raspbian/vars.yml
---

# generate_tests.sh written stuff

ansible_user: "{{ vault_ansible_user }}"
ansible_become_pass: "{{ vault_ansible_become_pass }}"

default_user: pi
default_group: pi

# manually entered stuff


EOF
  
  touch $TEST/host_vars/alarmpi/main.yml
  touch $TEST/host_vars/raspbian/main.yml

  cat <<EOF > $TEST/alarmpi.yml
---

- hosts: alarmpi
  become: yes
  gather_facts: yes
  roles:
    - $TEST

EOF

  cat <<EOF > $TEST/raspbian.yml
---

- hosts: raspbian
  become: yes
  gather_facts: yes
  roles:
    - $TEST

EOF

  cat <<EOF > $TEST/inventory/hosts
[alarmpi]

alarmpi01 ansible_python_interpreter=python3 ansible_host=<ip address>

[raspbian]

raspbian01 ansible_python_interpreter=python3 ansible_host=<ip address>

EOF

  cat <<EOF > $TEST/ansible.cfg
[defaults]
roles_path = ../../roles
library = ../../libraries
inventory=inventory/
retry_files_enabled=false
host_key_checking = false

EOF

  cat <<EOF > $TEST/alarmpi.sh
#!/bin/bash

ansible-playbook --ask-vault-password alarmpi.yml


EOF


  cat <<EOF > $TEST/raspbian.sh
#!/bin/bash

ansible-playbook --ask-vault-password raspbian.yml


EOF

  chmod +x $TEST/*.sh

done

