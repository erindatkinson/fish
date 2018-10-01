function tf --description 'wrapper for terraform'
  if [ $argv[1] == "clean" ]
    rm -rf .terraform
  else
    if set -q AWS_VAULT
      terraform $argv
    else
      aws-vault exec default -- terraform $argv
    end
  end
end