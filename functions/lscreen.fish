function lscreen -d "autologging screen session"
  mdkir -p log
  screen -L -Logfile ./log/$argv[1].log -R $argv[1]
end
