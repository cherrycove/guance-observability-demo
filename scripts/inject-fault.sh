#!/usr/bin/env bash
set -euo pipefail

base_url="${DEMO_BASE_URL:-http://127.0.0.1:8080}"
scenario="${1:-}"

if [[ -z "${scenario}" ]]; then
  echo "usage: $0 <scenario-id|off>" >&2
  exit 2
fi

if [[ "${scenario}" == "off" ]]; then
  endpoint="${base_url}/api/demo/faults/off"
else
  endpoint="${base_url}/api/demo/faults/${scenario}/enable"
fi

curl --fail --silent --show-error -X POST \
  -H 'Content-Type: application/json' \
  "${endpoint}"
printf '\n'
