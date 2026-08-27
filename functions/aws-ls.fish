function aws-ls -d "list all the profiles configured for aws"
  for entry in (cat ~/.aws/config | grep "\[profile" | sort)
    echo ((string split ' ' $entry)[2] | string replace ']' '')
  end
end
