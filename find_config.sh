#!/bin/bash

export src=$1

# go off of this
while read conf; do
	grep -rnh -A 15 "config $conf" | sed -n "/config $conf/,/-config/p" > somefile.txt

done < $src

#grep -rn -A 15 "config ARCH_HAS_DEBUG_VM_PGTABLE" | sed -n '/config ARCH_HAS_DEBUG_VM_PGTABLE/,/-config/p'
