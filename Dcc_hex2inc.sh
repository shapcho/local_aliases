#!/bin/bash
for i in $(ls *.bin); do echo $i; hex2inc_by_sasenov $i `echo $i| sed -e 's/\.bin/\.hhh/g'`; done
