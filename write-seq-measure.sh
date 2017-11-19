#!/bin/sh -x
dd bs=100M count=50 if=/dev/zero of=file4stest oflag=direct
rm file4stest
