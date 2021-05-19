function gitrand
  # requires installing 'pip install petname'
  git checkout -b (string join "-" $argv (petname))
end
