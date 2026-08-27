function aws-setenv -d "source exported credentials for a given profile"
  argparse 'p/profile=' 'e/erase' -- $argv
  if set -q _flag_e
    set -e AWS_ACCESS_KEY_ID
    set -e AWS_CREDENTIAL_EXPIRATION
    set -e AWS_SECRET_ACCESS_KEY
    set -e AWS_SESSION_TOKEN
  else
    aws configure export-credentials --profile $_flag_profile --format env | source
  end
end
