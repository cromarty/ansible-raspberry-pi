
# Roles

All roles in this directory are highly modular in design.

For example, all audio components needed for accessibility tools are
installed by a single role, 'sound', which is included by other roles
which install things which need audio components.

A good example of the degree of modularity is the use of the
speech-dispatcher role. Which needs audio, so it is included by the
'fenrir' console-mode screen reader and the desktop installation
roles, and the speech-dispatcher roleitself includes the sound role.

One of the things the sound role does is to check whether it is
r4unning on a 64-bit OS running on a Raspberry Pi.

The reason for this is because there is not currently any 'userland'
code available for queueing sound into the GPU on the Raspberry Pi.


## List of Roles

Here is the list of roles in here with a brief explanation of what
each does.

*brltty

Installs the console-mode Braille display driver.

* desktop

Will install any of the supported desktops.

* devtools

Installs development tools, typically the group known as 'base-devel'
on Arch, and 'build-essential' on Raspbian/Debian/Ubuntu.

* dm

Installs a desktop manager if one is selected.

* emacs

Installs emacs-nox (no X) for both Arch and Raspbian.

* emacspeak

Emacspeak is a speaking extension to emacs. It describes itself as
'the complete audio desktop'.

* extras

Installs extra packages not found in the development tools
collections. Things like useful utilities such as 'wget' (which is not
present by default on Arch, or dependencies of things installed
further down.

* fenrir

Console mode screen reader.

* git

Installs and configures git, including settings such as 'user.email'
etc.

* history

Truncates .bash_history files for selected users and root.

* i3

Installs the i3 desktop.

* kpartx

Installs a tool for creating loop device mount-points. Required by
rpi-image-tool, see further down.

* locale

Sets language, region, timezone and console keymap.


* mate

Installs the mate desktop.

* orca

Jewel in the crown of Linux a11y tools. Installs the Orca GUI screen
reader.

* rpi_image_tool

Installs my 'rpi-image-tool' thing from github.

* sound

The aforementioned sound role. Installs sound stuff and adds the
default user to the audio group.


* speakup

Installs the kernel-modules based console mode screen reader.

* speech_dispatcher

Installs the speech 'server' used by both Orca and Fenrir.

* test

Just installs a single little package, markdown I think, to test
Ansible connectivity to the Pi(s) being configured.

* xinit

Installs the GUI startup program.

* xkeyboard

Installs 'xkeyboard'

* yaourt

Installs the highly popular Arch User Repository package manager. And
includes package_query.




## Licenses

All of my code is licensed under GPL3.

There is code from other folks in here, notably stuff found in the 'library/' directories in some of the roles.

Some are under the Apache license, and some MIT.
