#!/bin/bash

EXPRESSION=$1
FILE=$2

ROWS=$(grep -n ${EXPRESSION} ${FILE} | cut -f1 -d: | head -n3)

bash ~/scripts/show_row.sh ${FILE} ${ROWS}
