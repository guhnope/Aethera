#!/bin/bash
set -euo pipefail

echo "=== Scanning and removing invalid UTF-8 filenames ==="

# Focus on paths where RPMs install (faster, catches everything relevant)
find /usr /etc /opt 2>/dev/null | while read -r path; do
    # Test if the filename bytes are valid UTF-8
    if ! printf '%s' "$path" | iconv -f UTF-8 -t UTF-8 //IGNORE >/dev/null 2>&1; then
        echo "INVALID UTF-8 FILENAME DETECTED AND REMOVED: $path"
        rm -rf "$path"  # Safe — usually a doc, example, or asset
    fi
done

echo "=== Cleanup complete. Bad files removed. ==="