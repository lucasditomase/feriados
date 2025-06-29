#!/bin/bash

# Process all .md files in the project
find . -type f -name "*.md" | while read -r file; do
  echo "⚙️ Normalizing $file"

  # For non-empty lines: trim trailing whitespace and append two spaces
  sed -E -i'' -e '/^$/!{s/[[:space:]]+$//; s/$/  /}' "$file"
done

echo "✅ Done."