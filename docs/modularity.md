
# Modularity of this Ansible Code

This is an attempt to explain the modularity of the code in this
repository.

There are many roles which perform taks which should be
self-explanatory from their name.

Many roles call others by using the 'include_role' directive.

But all roles have been written so as to be independent of all others.

So, if a role such as emacspeak is run to install emacspeak, it should
work equally as well as if it was run from another role which first
called the sound role to instal sound related packages.

Of course, just because the diagram below shows a role being included
by another, does not mean it will run, or that all the tasks in the
included role will run. There are conditions which affect which roles
run and which tasks are skipped, such as 'skip_*' variables or tasks
which are skipped by the test for the 'ansible_distribution' failing.

The YAML-like syntax below tries to illustrate which roles are
'included' by others.

Currently (2019-01-26) the roles relating to GUI configuration are not included in this diagram.

```
---


brltty:


console:
  - speakup
  - fenrir
  - emacspeak
  - brltty

devtools:

emacs:


emacspeak:
  - sound
    - emacs
  - devtools


espeak:


espeakup:
  - espeak
  

extras:


fenrir:
  - sound
  - espeak

git:

history:

kpartx:
  - devtools
  
locale:

rpi_image_tool:
  - kpartx

sound:

speakup:
  - espeakup

speech_dispatcher:
  - sound
    - espeak

yaourt:

```

