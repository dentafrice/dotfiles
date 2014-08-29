import sys
import subprocess
import json

stuff = [0]

def format_item(task, r_type):
    stuff[0] += 1

    return """<item arg="%s" uid="%s%i">
        <title>%s - %s</title>
        <subtitle>%s - %s</subtitle>
    </item>""" % (
        task.get('uri'),
        r_type,
        stuff[0],
        task.get('objectName'),
        task.get('title'),
        task.get('statusName'),
        task.get('priority')
    )

json_data = {
    "status": "status-open",
    "order": "order-priority"
}

try:
    task_type = sys.argv[1]
except (IndexError):
    task_type = 'assigned'

if task_type == 'assigned':
    json_data["ownerPHIDs"] = ["PHID-USER-2q2q5ye7jyx7337cbgkj"]
elif task_type == 'authored':
    json_data["authorPHIDs"] = ["PHID-USER-2q2q5ye7jyx7337cbgkj"]
else:
    raise Exception('Wrong type: "%s"' % rev_type)

command = 'echo "%s" | /usr/local/bin/arc call-conduit --conduit-uri=https://code.uberinternal.com/ maniphest.query' % json.dumps(json_data).replace('"', '\\"')

p = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
data = p.stdout.read().split("\n")[1]

tasks = json.loads(data).get('response', {}).values()
tasks = sorted(tasks, key=lambda x: -int(x.get('dateModified')))
items = "".join([format_item(tasks, task_type) for tasks in tasks])

print """
<?xml version='1.0'?>
<items>%s</items>
""" % items
