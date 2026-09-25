#!/bin/bash
set -euo pipefail
CSS_N=$(ls chunks/css/p*.txt 2>/dev/null | wc -l)
JS_N=$(ls chunks/js/p*.txt 2>/dev/null | wc -l)
echo css=$CSS_N js=$JS_N
if [ "$CSS_N" -lt 8 ] || [ "$JS_N" -lt 57 ]; then
  echo incomplete chunks, skip assemble
  exit 0
fi
cat chunks/css/p*.txt > assets/index-CBV8Q18_.css
cat chunks/js/p*.txt > assets/index-CF7O1ExU.js
wc -c assets/index-CBV8Q18_.css assets/index-CF7O1ExU.js
