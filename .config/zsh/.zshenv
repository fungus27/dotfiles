export FINDDIRS="$HOME/datad/general $HOME/datad/resources $HOME/.config $HOME/.local/bin $HOME/.local/src $HOME/.local/themes $HOME/temp $HOME/files $HOME/proj"

export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$HOME/.config/zsh"
export LESSHISTFILE="-"
export FZF_DEFAULT_OPTS="--layout=reverse --height 60%"
export PATH="$HOME/.local/bin:$PATH"
export HISTFILE="$HOME/.config/zsh/.zsh_history"
export PYTHONSTARTUP="$HOME/.config/.pythonrc"
export XAUTHORITY="$HOME/.config/.Xauthority"
export GNUPGHOME="$HOME/.config/.gnupg"
export PASSWORD_STORE_DIR="$HOME/datad/general/enc/pass_store"
export PASSWORD_STORE_GENERATED_LENGHT=35
export THEME_DIR="$HOME/.local/themes"
export SCRATCHPAD="$HOME/.cache/scratchpad"
export EXCHANGE_DIR="$HOME/.cache/exchange"
export EDITOR=nvim
export BROWSER=qutebrowser
export OPENER=xdg-open
export TERMINAL=alacritty

esc=$(printf \\033)
export LESS_TERMCAP_mb="${esc}[1;32m"
export LESS_TERMCAP_md="${esc}[1;32m"
export LESS_TERMCAP_me="${esc}[0m"
export LESS_TERMCAP_se="${esc}[0m"
export LESS_TERMCAP_so="${esc}[7m"
export LESS_TERMCAP_ue="${esc}[0m"
export LESS_TERMCAP_us="${esc}[1;4;31m"
export GROFF_NO_SGR=1
