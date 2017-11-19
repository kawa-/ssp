#!/bin/sh -x
dd bs=4K count=250000 if=/dev/zero of=file4rtest oflag=direct
rm file4rtest
