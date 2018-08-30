#!/bin/bash

set -e

STATUS=$(nvidia-smi --format=csv,noheader,nounits --query-gpu=memory.used,memory.free,memory.total,temperature.gpu,utilization.gpu) 

MB_USAGE=$(echo $STATUS | awk -F ', ' '{printf("%.2f", $1/1024)}')
MB_FREE=$(echo $STATUS | awk -F ', ' '{printf("%.2f", $2/1024)}')
MB_TOTAL=$(echo $STATUS | awk -F ', ' '{printf("%.2f", $3/1024)}')
TEMPERATURE=$(echo $STATUS | awk -F ', ' '{print $4}')
UTILIZATION=$(echo $STATUS | awk -F ', ' '{print $5}')

IFS=","
while read percent RAMP_UTILIZATION && [ ! $percent -ge $UTILIZATION ]; do
  # pass
  RAMP_UTILIZATION=""
done <<< $(echo -e "2,⠀\n12,▁\n25,▂\n37,▃\n50,▄\n62,▅\n75,▆\n87,▇\n100,█")

echo "$RAMP_UTILIZATION $TEMPERATURE°C $MB_USAGE GB"
