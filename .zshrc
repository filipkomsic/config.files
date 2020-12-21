# Created by newuser for 5.8

SAVEHIST=1000
HISTFILE=~/.zhistory
export HISTSIZE=1000
export EDITOR=/usr/bin/nvim
export TERMINAL=/usr/local/bin/st
export SHELL=/bin/zsh

## Prompt

autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

## AutoCD

setopt autocd

#Auto Completion

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)


## Vim keys

bindkey -v
export KEYTIMEOUT=1

## Vim keys in tab complete

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char




## Aliases

alias ls="ls --color=auto"
alias cheat="~/scripts/cheat.sh"
alias music="ncmpcpp"
alias cp="cp -iv" 
alias scriptup="sudo ~/scripts/update_dmenu_run.sh"
alias kmap="~/scripts/keyboard_layout_switcher.sh"
alias p="sudo pacman --color=auto" 
alias update='p -Syu && pkill -RTMIN+20 "${STATUSBAR:-dwmblocks}" '
alias grep="grep --color=auto"
alias fixsound="alsactl restore"
alias gm="cd ~/media ; ls "
alias gdw="cd ~/dow ; ls "
alias gdc="cd ~/dox ; ls "
alias gc="cd ~/.config ; ls "
alias gsc="cd ~/scripts ; ls "
alias gsk="cd ~/suckless ; ls "
alias gdf="cd ~/dox/FAX ; ls "
alias gbp="cd ~/dox/FAX/BP1 ; ls "
alias gbb="cd ~/dox/bigbrain ; ls "
alias gba="cd ~/dox/bigbrain/articles ; ls "
alias gbb="cd ~/dox/bigbrain/bukz ; ls "
alias gsc="cd ~/scripts ; ls "
alias gskl="cd ~/suckless ; ls "
alias e="$EDITOR"




#open a script from ~/scripts in nvim
sc(){ cd ~/scripts ; du -a ~/scripts | awk '{print $2}' |grep -v .git| fzf --border=horizontal --height=30% -i --layout=reverse | xargs -r nvim }

# Write a new script
scnew(){ read ime"?File name: " || exit 0
	cd $HOME/scripts
	nvim $ime ; chmod +x $ime }

#open a file form ~/suckless in nvim
skl(){ DIR=$(du -d 1 ~/suckless | awk '{print $2}' | fzf --border=horizontal --height=30% -i --layout=reverse) && cd $DIR ; ls | fzf --border=horizontal --height=30% -i --layout=reverse | xargs -r nvim }

#play a movie
mov(){ cd /home/filip/media/movies && du -a | grep '.mp4\|.mkv\|.avi' | awk '{ $1=""; print $0}' |
	fzf --border=horizontal --height=30% -i --layout=reverse |
	sed 's|^..|/home/filip/media/movies|g; s|^|"|g; s|$|"|g' |
	xargs mpv ; cd 
}
goto(){ CD=$(du ~/ | awk '{print $2}' | fzf --border=horizontal --height=30% -i --layout=reverse) && 
	cd $CD || 
	echo "Nothing selected :(" }

hk(){ nvim ~/.config/sxhkd/sxhkdrc }



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


##newpath

path+=('/home/filip/scripts')


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null

