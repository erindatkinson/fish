function aws-shell --description 'alias for aws-vault exec'
  aws-vault exec $argv[1] -- fish
end