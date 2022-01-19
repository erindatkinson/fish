function mov2gif --description "convert an ffmpeg compatible movie to a gif"
  ffmpeg -i $argv[1] -vf "fps=10,scale=480:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 $argv[2]
end
