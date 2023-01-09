function opwgen
    set -l _opw (op item create --category login --generate-password --dry-run --format json | jq -r '.fields[] | select(.id=="password") | .value')
    echo -n $_opw 
end