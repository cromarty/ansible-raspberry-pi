
# Ansible Tags

There are not many tags in these roles.

What tags there are are for controlling the installation of configuration files:

* fenrir_conf
* emacs_init
* emacspeak_init

The fenrir_conf tag can be used to either just run the task in the fenrir role which installs the configuration templates, or to skip this step when installing fenrir:

```
ansible-playbook --ask-vault-pass --tags fenrir_conf playbook.yml
```

Will just run that task which installs the configuration files, or:

```
ansible-playbook --ask-vault-pass --skip-tags fenrir_conf playbook.yml
```

Will not install the config templates when fenrir is being installed. Hence the install will not overwrite the default config files.


## Important Note

There is one risk with this strategy at the moment.

If the emacspeak role is run with '--tags emacspeak_init' when emacspeak has not been installed but emacs has been installed, this will result in an emacs initialisation file which tries to load 'emacspeak-setup.el' when it will not be present.

The above is only true currently for Arch Linux, as on Debian emacspeak is installed from the package cache and not from source.



