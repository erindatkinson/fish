function aws-ssm --description "aws-ssm-ssh shortcut"
  aws ssm start-session --target "$argv[1]" --document-name AWS-StartSSHSession --parameters "portNumber=$argv[2]"
end