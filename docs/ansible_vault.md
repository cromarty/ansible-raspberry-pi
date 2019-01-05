
# Ansible Vaults

In most, if not all, of the playbooks you will find in this
repository, the 'group_vars/' directory will contain two files,
usually under another directory which reflects the name of a group of
hosts.

For example, in:

```
group_vars/raspbian/
```

You will find:

```
vars.yml
vault.yml
```

The file 'vault.yml is encrypted by the program 'ansible-vault'.

You will need to re-create this file.

The contents of a typical 'vars.yml' looks like this:

```
---

ansible_user: "{{ vault_ansible_user }}"
ansible_become_pass: "{{ vault_ansible_become_pass }}"

```

The bits between doubled curly braces are Jinja2 template variables
which get replaced by values from 'vault.yml' in the same directory.

So the contents of an unencrypted 'vault.yml' looks like this:

```
---

vault_ansible_user: pi
vault_ansible_become_pass: raspberry

```

The above example contains the default user and password for a
Raspbian image from the Raspberry Pi Foundation downloads page.

You will now need to encrypt the 'vault.yml' file:

```
ansible-vault encrypt vault.yml
```

It will ask you for a password, twice.  Second time to verify it. You
need to get it the same both times.

If Ansible tells you it was successful, you now have an encrypted vault.yml.

When you run a playbook:

```
ansible-playbook --ask-vault-pass playbook.yml
```

The '--ask-vault-pass' switch will prompt you for the password you ued
to encrypt the vault.

The 'vault_ansible_become_pass' variable in the vault is the password
which will be used by Ansible to escalate privileges when a playbook
runs which contains:

```
become: true
```


See ssh_keys.md in this directory for details of how to create SSH
keys and transfer them to any machine you intend to run this Ansible
code against.




default_user: pi
default_group: pi


