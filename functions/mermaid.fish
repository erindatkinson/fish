function mermaid
  set -l fname (string split . $argv[1])[1]
  npx @mermaid-js/mermaid-cli -i $argv[1] -o "$fname.png"
end