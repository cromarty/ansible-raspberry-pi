#!/bin/bash

ansible-playbook --ask-vault-pass raspbian.yml | tee raspbian.res

