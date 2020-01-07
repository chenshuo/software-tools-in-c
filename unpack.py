#!/usr/bin/python3

import os, re, sys

def write_file(name, content):
    path = name.split('/')
    if len(path) > 1:
        directory = path[0].lower()
        if not os.path.exists(directory):
            os.mkdir(directory)
        file = os.path.join(directory, path[1])
    else:
        file = path[0]
    with open(file, 'w') as out:
        out.write(content)

# -h- README 1647
header = re.compile('^-h- ([^ ]+) (\\d+)')

with open(sys.argv[1]) as archive:
    line = archive.readline()
    while line:
        m = header.match(line)
        if m:
            name, size = m.group(1), int(m.group(2))
            print(name, size)
            content = archive.read(size)
            write_file(name, content)
            line = archive.readline()
        else:
            print("err: ", line)
            break
