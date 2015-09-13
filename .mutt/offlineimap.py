#!/usr/bin/python
import re, subprocess
import os
import sys


def get_keychain_pass(account=None, server=None):
    if sys.platform == 'linux2':
        path = '/home/mingle/private_dotfiles/mingle-smtp-password.gpg'

        args = [
            'gpg2',
            '--use-agent',
            '--quiet',
            '--batch',
            '-d',
            path,
        ]

        try:
            return subprocess.check_output(args).strip()
        except subprocess.CalledProcessError:
            return ''
    else:
        params = {
            'security': '/usr/bin/security',
            'command': 'find-internet-password',
            'account': account,
            'server': server,
            'keychain': '/Users/Mingle/Library/Keychains/login.keychain',
        }
        command = "sudo -u mingle %(security)s -v %(command)s -g -a %(account)s -s %(server)s %(keychain)s" % params
        output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
        outtext = [l for l in output.splitlines()
                   if l.startswith('password: ')][0]

        return re.match(r'password: "(.*)"', outtext).group(1)
