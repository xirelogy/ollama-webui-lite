#!/usr/bin/env bash
export EXISTING_VARS='$OLLAMA_API_BASE_URL';

for file in $(find /usr/share/nginx/html/_app -name '*.js');
do
  cat $file | envsubst $EXISTING_VARS | tee TMPFILE && mv TMPFILE $file
done
