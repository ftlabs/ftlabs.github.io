#!/bin/bash

for YEAR in 20*; do
  echo "YEAR=$YEAR"
  cd $YEAR
  for MONTH in [01]?; do
    echo "MONTH=$MONTH"
    
  done
  cd -
done
