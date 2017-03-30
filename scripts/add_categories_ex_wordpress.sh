#!/bin/bash
perl -p -i -e  's/permalink:/categories: ex-wordpress\npermalink:/'  _posts/ex-wordpress/*/*/*.html
