function tfc
  switch $argv[1]
    case 'share'
      screen -R share
    case 'atlas'
      screen -R atlas
    case 'y'
      yarn start
    case 's'
      tfcdev start
    case 'u'
      tfcdev stack up 2>&1 | tee tmp/stack.log
    case 'd'
      tfcdev stack down
    case 'l'
      tfcdev stack logs
    case '*'
      echo "error: the command '$argv[1]'' does not exist"
  end
end