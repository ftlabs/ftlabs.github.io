#!/bin/bash

die() { echo "$@" 1>&2 ; exit 1; }

HERE=$(pwd)
NEW_POSTS_DIR=${HERE}/_posts/ex-wordpress

test -d $NEW_POSTS_DIR || die "no such dir=$NEW_POSTS_DIR"

for YEAR in 20??; do
  echo "YEAR=$YEAR"
  cd $YEAR || die "cannot cd to $YEAR"
  for MONTH in [01]?; do
    echo "MONTH=$MONTH"
    cd $MONTH || die "cannot cd to $MONTH"
    FULL_DIR=${NEW_POSTS_DIR}/${YEAR}/${MONTH}
    echo "FULL_DIR=$FULL_DIR"
    mkdir -p $FULL_DIR
    for POST in *; do
      echo "POST=$POST"
      INDEX_FILE=$POST/index.html
      if [[ -f "$INDEX_FILE" ]]; then
        FULL_TITLE=$(cat $INDEX_FILE | grep '<h1>' | tail -1 | cut -d ">" -f2 | cut -d "<" -f 1)
        # FULL_TITLE=${FULL_TITLE/:/\:}
        if [[ -n "$FULL_TITLE" ]]; then
          FULL_FILENAME=${FULL_DIR}/${YEAR}-${MONTH}-01-${POST}.html
          echo "FULL_FILENAME=$FULL_FILENAME"
          echo "---
layout: null
title: '$FULL_TITLE'
date: ${YEAR}-${MONTH}-01
permalink: /${YEAR}/${MONTH}/${POST}/
---" > $FULL_FILENAME
          cat $INDEX_FILE >> $FULL_FILENAME
        else
          die "cannot obtain a non-empty title from POST=$POST"
        fi
      fi
    done
    cd ..
  done
  cd ..
done
