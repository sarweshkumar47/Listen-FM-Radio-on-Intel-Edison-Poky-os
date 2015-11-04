#!/bin/bash
if [ $# -eq 0 ]
  then
    echo ""
    echo "Error: Please specify the frequency as an argument in MHz."
    echo ""
fi
rtl_fm -f $1M -M fm -s 170k -A fast -r 32k -l 0 -E deemp -g 30 | aplay -r 30k -t raw -f S16_LE -c 1 -V1 -
