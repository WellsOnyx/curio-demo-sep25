#!/bin/bash
set -euo pipefail
CSS_N=$(ls chunks/css/p*.txt 2>/dev/null | wc -l)
JS_N=$(ls chunks/js/p*.txt 2>/dev/null | wc -l)
echo css=$CSS_N js=$JS_N
mkdir -p assets
if [ "$CSS_N" -ge 8 ]; then
  cat chunks/css/p*.txt > assets/index-CBV8Q18_.css
  echo assembled css $(wc -c < assets/index-CBV8Q18_.css)
fi
if [ "$JS_N" -ge 57 ]; then
  cat chunks/js/p*.txt > assets/index-CF7O1ExU.js
  echo assembled js $(wc -c < assets/index-CF7O1ExU.js)
fi
if [ "$CSS_N" -lt 8 ] && [ "$JS_N" -lt 57 ]; then
  echo incomplete chunks, skip
  exit 0
fi
