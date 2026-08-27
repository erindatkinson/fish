function aws-check --description "check if logged into profile, and if not, do so"
  argparse 'p/profile=' -- $argv; or return

  set -f account (aws sts get-caller-identity --profile $_flag_p --query Account --output text 2> /dev/null)
  if test $status -ne 0
    echo "You are not logged in, logging in"
    aws sso login --profile $_flag_p
  else
    echo "you are logged into AWS account: $account
  end
end
