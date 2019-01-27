
# 'Skippiness' of Roles

There are two types of task entries in the roles in the roles
directory:

* Tasks which configure things
* Tasks which include other roles

In the tasks which perform configurations, there are no 'skip_'
prefixed variables in the 'defaults/main.yml' files.

But in the roles which include other roles, those includes are often
controlled by 'skip_' prefixed variables.

For example, in the 'console' role, there are skip variables which
conditionally control the inclusion of these roles:

* speakup
* fenrir
* emacspeak
* brltty

So in a 'playbook' which calls the 'console' role, the user can choose
which screen reader is installed and whether emacspeak and brltty are
installed, by setting these variables in the 'playbook' which calls
the 'console' role:

* skip_speakup
* skip_fenrir
* skip_emacspeak
* skip_brltty

All but skip_speakup are defaulted to 'true'.

