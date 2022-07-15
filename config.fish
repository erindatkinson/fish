set EDITOR 'code --wait'
set SHELL /usr/local/bin/fish
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
set PATH ~/.local/share $PATH
set PATH ~/.local/share/bin $PATH
set PATH ~/.rbenv/bin $PATH
set PATH /usr/local/bin $PATH
# Allow for groupings of other configs easily.
for conf in (ls ~/.config/fish/configs/*.config)
    source $conf
end

status --is-interactive; and rbenv init - | source
set -g fish_user_paths "/usr/local/opt/postgresql@9.6/bin" $fish_user_paths


set -gx GOPATH $HOME/go; set -gx GOROOT $HOME/.go; set -gx PATH $GOPATH/bin $PATH; # g-install: do NOT edit, see https://github.com/stefanmaric/g

nvm use > /dev/null
