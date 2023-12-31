#!/bin/bash

input=$1
output=$2

acts-install/bin/ActsAnalysisMaterialComposition \
      -i $input \
      -o $output \
      --sub-names beampipe pixel sstrips lstrips solenoid \
      --sub-rmin 0:25:200:680:1100 \
      --sub-rmax 25:200:680:1100:2000 \
      --sub-zmin -3200:-3200:-3200:-3200:-3200 \
      --sub-zmax 3200:3200:3200:3200:3200 \
      -s
