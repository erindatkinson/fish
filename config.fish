set EDITOR 'code --wait'
set GOPATH ~/go
set PATH ~/go/bin $PATH
set SHELL /usr/local/bin/fish

# Allow for groupings of other configs easily.
for conf in (ls ~/.config/fish/configs/*.config)
    source $conf
end

