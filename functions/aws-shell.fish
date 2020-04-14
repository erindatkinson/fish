function aws-shell --description 'alias for aws-vault exec'
  aws-vault exec --mfa-token (ykman oath code --single $argv[1]) $argv[1] -- fish
end
