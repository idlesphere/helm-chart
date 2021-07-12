#!/bin/sh
set -e

for file in /work/*.rules.yml
do
    /bin/promtool check rules $file
done
