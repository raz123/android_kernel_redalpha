#!/bin/bash
set -euo pipefail
ZIP_FILE="${1:?Usage: $0 <path-to-anykernel3.zip>}"
if [[ ! "$ZIP_FILE" = /* ]]; then ZIP_FILE="$(pwd)/$ZIP_FILE"; fi
if [[ ! -f "$ZIP_FILE" ]]; then echo "ERROR: ZIP file not found: $ZIP_FILE" >&2; exit 1; fi
if [[ ! -s "$ZIP_FILE" ]]; then echo "ERROR: ZIP file is empty: $ZIP_FILE" >&2; exit 1; fi
SIZE=$(stat -c%s "$ZIP_FILE" 2>/dev/null || stat -f%z "$ZIP_FILE" 2>/dev/null)
echo "ZIP file: $ZIP_FILE ($SIZE bytes)"
echo "ZIP validation passed."
