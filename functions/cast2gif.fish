function cast2gif
  docker run --rm -v $PWD:/data asciinema/asciicast2gif -s 2 -t solarized-dark $argv[1] $argv[2]
end