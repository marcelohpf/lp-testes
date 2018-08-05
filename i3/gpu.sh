#!/bin/bash

set -e

STATUS=$(nvidia-smi --format=csv,noheader,nounits --query-gpu=memory.used,memory.free,memory.total,temperature.gpu,utilization.gpu) 

MB_USAGE=$(echo $STATUS | awk -F ', ' '{printf("%.2f", $1/1024)}')
MB_FREE=$(echo $STATUS | awk -F ', ' '{printf("%.2f", $2/1024)}')
MB_TOTAL=$(echo $STATUS | awk -F ', ' '{printf("%.2f", $3/1024)}')
TEMPERATURE=$(echo $STATUS | awk -F ', ' '{print $4}')
UTILIZATION=$(echo $STATUS | awk -F ', ' '{print $5}')

for value in 12,▁ 25,▂ 37,▃ 50,▄ 62,▅ 75,▆ 87,▇ 100,█; do
  IFS=","
  read percent char <<< "${value}"
  if [ $percent -gt $UTILIZATION ] ; then
    UTILIZATION="$char"
    break
  fi
done

echo "$UTILIZATION $TEMPERATURE°C $MB_USAGE GB"
