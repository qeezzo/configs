import sys
import json

json_workspaces = sys.stdin.read()

workspaces = json.loads(json_workspaces)

for workspace in workspaces:
    print (workspace['name'])
