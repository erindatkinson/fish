function ecr-login --description 'docker login to ECR'
  aws-vault exec $argv[1] -- aws ecr get-login --no-include-email | fish
end