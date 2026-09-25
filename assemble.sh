#!/bin/bash
set -euo pipefail
cat chunks/css/p*.txt > assets/index-CBV8Q18_.css
cat chunks/js/p*.txt > assets/index-CF7O1ExU.js
wc -c assets/index-CBV8Q18_.css assets/index-CF7O1ExU.js
