function decode-jwt -d "decode a jwt"
  argparse 'j/jwt=' -- $argv; or return
  echo $_flag_j | jq -R 'split(".") | .[0],.[1] | @base64d | fromjson'
end
