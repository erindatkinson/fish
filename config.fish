set EDITOR 'code --wait'
set GOPATH ~/go
set PATH ~/go/bin $PATH
set SHELL /usr/local/bin/fish
set PATH ~/.local/share $PATH
set PATH ~/.local/share/bin $PATH
# Allow for groupings of other configs easily.
for conf in (ls ~/.config/fish/configs/*.config)
    source $conf
end

status --is-interactive; and source (rbenv init -|psub)
set -g fish_user_paths "/usr/local/opt/postgresql@9.6/bin" $fish_user_paths
