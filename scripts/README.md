
The file `installed.csv` is a list of all of those packages installed
on full Raspbian and which relate to X.

It was created by getting a list of all the packages contained in the
Debian meta-packages:

* xorg
* xorg-dev

And then running the script `xorg_installed` against these two lists.

Before running the script the lists were combined and sorted and
duplicate lines dropped.

So the final list `installed.csv` is those packages which returned `is
installed` when run on a full Raspbian image.
