#!/bin/bash

ansible-playbook --ask-vault-pass history.yml | tee history.res

