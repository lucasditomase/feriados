#!/bin/bash

find . -type f -name "*.md" | while read -r file; do
  echo "✏️ Processing: $file"

  tmp_file="${file}.tmp"

  while IFS= read -r line || [[ -n "$line" ]]; do
    # Trim trailing whitespace and add 2 spaces
    trimmed_line="$(echo "$line" | sed 's/[[:space:]]*$//')"
    echo "${trimmed_line}  " >> "$tmp_file"
  done < "$file"

  mv "$tmp_file" "$file"
done

echo "✅ Done processing all .md files."