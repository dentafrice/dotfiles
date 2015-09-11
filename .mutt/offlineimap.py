#!/usr/bin/python
import re, subprocess
import sys


def get_keychain_pass(account=None, server=None):
    if sys.platform == 'linux2':
        import gnomekeyring

        for item_id in gnomekeyring.list_item_ids_sync('email'):
            item = gnomekeyring.item_get_info_sync('email', item_id)

            if item.get_display_name() == 'work':
                return item.get_secret()
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
