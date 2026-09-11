#!/bin/bash
curl -fsS http://127.0.0.1:8000/packages.json | jq '
  [.[] | select(.status=="active" and .downloads >= 100)]
  | sort_by(-.downloads, .name)
' > tmp.json

cat > summary.md <<MARKDOWN
# Active Package Summary

| name | version | downloads |
|------|---------|-----------|
$(jq -r '.[] | "| \(.name) | \(.version) | \(.downloads) |"' tmp.json)
MARKDOWN
rm tmp.json



