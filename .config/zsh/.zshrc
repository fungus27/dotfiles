HISTSIZE=1000
SAVEHIST=1000
unsetopt beep extendedglob nomatch
setopt complete_aliases
zstyle :compinstall filename '~/.config/zsh/.zshrc'
autoload -Uz compinit
zstyle ':completion:*' menu select 
zstyle ':completion:*' list-colors "" 
zmodload zsh/complist
compinit


autoload colors -U colors && colors
source ~/.config/zsh/.prompt

#vi mode
bindkey -v
export KEYTIMEOUT=1

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
if [[ ${KEYMAP} == vicmd ]] ||
	[[ $1 = 'block' ]]; then
	echo -ne '\e[1 q'
elif [[ ${KEYMAP} == main ]] ||
	[[ ${KEYMAP} == viins ]] ||
	[[ ${KEYMAP} = '' ]] ||
	[[ $1 = 'beam' ]]; then
	echo -ne '\e[5 q'
fi
}

zle -N zle-keymap-select

zle-line-init() {
zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
echo -ne "\e[5 q"
}

zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

#Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^x' edit-command-line


# Aliases
# alias wget="wget --hsts-file -"
alias cr="curl -O"
alias ls="ls --color=auto"
alias la="ls -alh --color=auto"
alias xclip="xclip -selection clipboard"
alias nvidia-settings="nvidia-settings --config=\"$HOME/.config/.nvidia-settings-rc\""
alias bc="bc -q -l"
alias cal="cal -m"
alias lock="gpg-connect-agent reloadagent reset /bye > /dev/null 2>&1"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias latexclear="rm *.aux && rm *.log"
alias speedswap="xmodmap ~/.config/speedswapper"

# Functions
sr() {
	if [ -z "$1" ]; then
		getdirfiles f | fzf --print0 | xargs -0 -r xdg-open 
	else	
		if [ "$1" == "cd" ]; then
			sdtmp=$(getdirfiles d | fzf) 
			cd $sdtmp
			unset sdtmp
		elif [ "$1" == "la" ]; then
			getdirfiles d | fzf --print0 | xargs -0 -r ls -alh 
        elif [ "$1" == "mv" ]; then
            mv $(getdirfiles d,f | fzf) $(getdirfiles d | fzf)
        elif [ "$1" == "cp" ]; then
            cp $(getdirfiles d,f | fzf) $(getdirfiles d | fzf)
		else
			getdirfiles f | fzf --print0 | xargs -0 -r $1
		fi
	fi
}
