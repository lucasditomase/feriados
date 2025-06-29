#!/bin/bash

# Process all .md files in the project
find . -type f -name "*.md" | while read -r file; do
  echo "⚙️ Normalizing $file"

  awk '{
    gsub(/[[:space:]]+$/, "")     # Always trim trailing whitespace
    if ($0 == "") print ""        # If line is now empty, leave it blank
    else print $0 "  "            # Otherwise, add two spaces
  }' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
done

echo "✅ Done."