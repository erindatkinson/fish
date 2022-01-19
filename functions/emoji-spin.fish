function emoji-spin --description "make a spinning emoji"
  set -l s (string split . $argv[1])

  convert -virtual-pixel transparent -dispose Background -delay 3  $argv[1] -duplicate 24 -distort SRT "0.707,%[fx:t*360/n]" -loop 0 $s[1]-spin.gif
end