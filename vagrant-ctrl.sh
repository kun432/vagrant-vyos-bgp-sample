#!/bin/bash

parallel=3
subcmds="$@"

vagrant status --machine-readable | \
  perl -wnlaF"," -e 'print $F[1] if $F[2] =~ /metadata/;' | \
  xargs -P${parallel} -I {} vagrant $subcmds {}
