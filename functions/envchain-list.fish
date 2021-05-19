function envchain-list
  security dump-keychain | string match -e -r '\\"svce\\"<blob>="envchain-([\\w]+)' | grep -v svce | sort --unique
end