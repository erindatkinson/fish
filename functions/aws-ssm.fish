function aws-ssm --description "aws-ssm-ssh shortcut"
  argparse 'i/instance=' 'p#port=' -- argv
  aws ssm start-session --target "$_flag_i" --document-name AWS-StartSSHSession --parameters "portNumber=$_flag_p"
end
