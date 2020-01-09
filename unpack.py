#!/usr/bin/python3

import os, re, sys

def write_file(name, content):
    path, file = os.path.split(name)
    directory = path.lower()
    if path:
        if not os.path.exists(directory):
            os.mkdir(directory)
    with open(os.path.join(directory, file), 'w') as out:
        out.write(content)


def unpack(archive):
    # -h- README 1647
    header = re.compile('^-h- ([^ ]+) (\\d+)')

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


if len(sys.argv) > 1:
    if sys.argv[1] == '-':
        unpack(sys.stdin)
    else:
        with open(sys.argv[1]) as archive:
            unpack(archive)
