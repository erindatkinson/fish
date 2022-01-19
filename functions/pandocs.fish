function pandocs
  set -l fname (string split . $argv[2])[1]
  switch $argv[1]
    case 'html' 
      pandoc -s -c ~/hashicorp/static/css/local/main.css -o "$fname.html" $argv[2]
    case 'pdf'
      pandoc --pdf-engine=xelatex -o "$fname.pdf" $argv[2]
    case '*'
      echo "error: the command '$argv[1]' does not exist"
  
  end
end