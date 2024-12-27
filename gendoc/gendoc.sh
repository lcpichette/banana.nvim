#!/bin/bash

newname=$(echo $1)

echo "Documenting $newname"

../panvimdoc/panvimdoc.sh --input-file $1 --project-name banana-$1 || echo "Failed"
