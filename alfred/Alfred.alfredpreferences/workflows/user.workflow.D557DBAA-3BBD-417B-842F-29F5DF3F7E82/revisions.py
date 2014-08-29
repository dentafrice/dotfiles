import sys
import subprocess
import json

def format_item(revision):
    return """<item arg="%s" uid="%s">
        <title>D%s - %s</title>
        <subtitle>%s - %s</subtitle>
    </item>""" % (
        revision.get('uri'),
        revision.get('id'),
        revision.get('id'),
        revision.get('title'),
        revision.get('statusName'),
        revision.get('branch')
    )

json_data = {
    "status": "status-open"
}

try:
    rev_type = sys.argv[1]
except (IndexError):
    rev_type = 'authored'

if rev_type == 'authored':
    json_data["authors"] = ["PHID-USER-2q2q5ye7jyx7337cbgkj"]
elif rev_type == 'reviewer':
    json_data["reviewers"] = ["PHID-USER-2q2q5ye7jyx7337cbgkj"]
else:
    raise Exception('Wrong type: "%s"' % rev_type)

command = 'echo "%s" | /usr/local/bin/arc call-conduit --conduit-uri=https://code.uberinternal.com/ differential.query' % json.dumps(json_data).replace('"', '\\"')

p = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
data = p.stdout.read().split("\n")[1]

data = json.loads(data)

revisions = data.get('response', None)
items = "".join([format_item(revision) for revision in revisions])

print """
<?xml version='1.0'?>
<items>%s</items>
""" % items
