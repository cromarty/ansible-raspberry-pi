#!/bin/bash

ansible-playbook --ask-vault-pass alarmpi.yml | tee alarmpi.res

