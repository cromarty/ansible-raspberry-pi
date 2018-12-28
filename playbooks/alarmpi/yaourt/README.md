
# yaourt

Installs package-query and yaourt on Arch Linux Pi.

Before installing anything on a new [`Arch Linux`][arch] Linux
Raspberry Pi image, you need to initialize and populate the keyring:

```
pacman-key --init
pacman-key --populate
```


## Before Starting

Need to install Python and dmidecode.  gather_facts fails if dmidecode
is not installed.
