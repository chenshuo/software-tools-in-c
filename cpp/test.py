#!/usr/bin/python3

import glob, json, os, subprocess, sys

def run_one(path, binary, test):
    stdin = test[0].encode()
    output = test[1].encode()
    result = subprocess.run(os.path.join(path, binary), input=stdin, capture_output=True)
    if (result.stdout != output):
        print("  Input: ", stdin)
        print("  Expect:", output)
        print("  Got:   ", result.stdout)


def run(filename):
    print(filename)
    with open(filename) as f:
        path = os.path.split(filename)[0]
        path = os.path.join('../bin', path)
        suite = json.load(f)
        for test in suite:
            binary = test['bin']
            print(" ", binary, len(test['tests']))
            for t in test['tests']:
                run_one(path, binary, t)
        

if __name__ == '__main__':
    if len(sys.argv) > 1:
        for test in sys.argv[1:]:
            run(test)
    else:
        for test in glob.iglob("*/test.json"):
            run(test)
