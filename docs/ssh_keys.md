# SSH Keys

To run the code in this repository against machines remote to the one
running the code, you will need to generate SSH keys on the local
machine and transfer them to the remote machine(s).

To generate SSH keys if you do not already hve them:

```
ssh-keygen
```

Don't enter a file into which to save the keys, and they will be saved in:

```
/home/<user>/.ssh/id_rsa
/home/<user>/.ssh/id_rsa.pub
```


It is *very* important to note at this point that the file *id_rsa* is
the *private* key part of this pair. This should under no
circumstances be shared with anybody. You might feel this is trivial
if your machine is a Pi, or some other gash old machine you are
hacking with, but security best practise is never a waste of time. Get
into good habits and you will never make the mistakes when things are
more critical.

Now you need to transfer your SSH public key to any machine against which you want to run this Ansible code.

To do this:

```
ssh-copy-id user@machine
```

For example, for a default Raspbian image:

```
ssh-copy-id pi@raspberrypi
```

Or replace 'raspberrypi' with the IP address if your router cannot resolve the name of the host.

You will be asked for the password.

Assuming the key is successfully transferred, it will now be possible to log in without needing to give a password:

```
ssh pi@raspberrypi
```

Test it to make sure.

And now, assuming you have the right password in your Ansible vaults, see the file 'ansible_vault.md' in this directory, you can run playbooks against that machine.

Note that any machine you instend to configure in this way will need 'dmidecode' installed on it, and a corrct version of Python.

Don't enter a password.
