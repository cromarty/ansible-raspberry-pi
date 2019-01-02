
# ansible-raspberry-pi

All code in this repository is copyright(R), 2018, Mike Ray,
<mike.ray@btinternet.com>

Exceptions are some Ansible library code in `libraries`.

The libraries in there are licensed thusly:

* aur

MIT license.

https://github.com/pigmonkey/ansible-aur

* gsetting

Apache license.

https://github.com/jistr/ansible-gsetting

## Sub-directories

* roles

Ansible roles.

* playbooks

Playbooks using the roles.

* libraries

Libraries that are not part of Ansible, third-party libraries.

See links given above.

## Purpose

The use of the code in here is primarily to configure either Arch Linux or Raspbian on a Raspberry Pi.

There is an emphasis on accessibility, because I am totally blind.

The role and playbook combinations are capable of installing console mode screen readers, and the GTK Orca screen reader in any desktop that is supported herein.

Emacspeak, the 'complete audio desktop', is included.

## 'skip_*' Variables

Those roles which are not simply roles which call others, all have
'skip_*' variables defined in their defaults.

These skip variables are used by those roles which call them, in order
for the calling role to make it possible to select which of the roles
it calls actually gets run.

For example, the 'brltty' role contains a variable called
'skip_brltty'.

But the 'skip_brltty' variable is not used inside the task lists contained
in brltty, but is used in the console role to make it possible to
select or de-select brltty for installation.

Some of these skip variables are defaulted to false, some to true.

Again, using brltty as an example, the 'skip_brltty' variable defaults
to true, since not many people are lucky enough to own a refreshable
Braille display.

So, to install brltty when calling the console role, set skip_brltty
to false in the variables in the playbook calling that role.

## Tasks All Default Variables

No variables are left hanging, causing Ansible to fail if a variable
is not defined.

For example, if the locale role is called, and the user has not set a
list of locales to generate, it will default the list of roles to an
empty list and the task which calls 'local-gen' will be skipped.

Likewise, scalars should all be defaulted when they are missing. The
timezone is defaulted to 'UTC' if it is missing.

The same is true for boolean 'skip_*' varaibles discussed above.





