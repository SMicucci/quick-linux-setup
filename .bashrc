# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#  useful aliases
# color alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree='tree -C'
# shortcut alias
alias l='ls'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
# small tool
alias refresh='clear && exec $SHELL'
alias off='shutdown +0'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# insert git repo function (WIP)
parse_git_branch(){
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
RED="\[\e[38;2;255;0;0m\]"
BLUE="\[\e[38;2;0;127;255m\]"
GREEN="\[\e[38;2;0;255;0m\]"
RESET="\[\e[0m\]"

PS1="${BLUE}\u${RESET}@\H: ${GREEN}\w${RED} \$(parse_git_branch)${RESET}\$ "

neofetch --disable Kernel Icons Theme Uptime --ascii_distro arch --ascii_bold off --os_arch off --cpu_brand off --cpu_speed off --cpu_cores off --cpu_temp C --gpu_brand off --de_version off --gtk_shorthand on --shell_version off --color_blocks off --colors 2 3 7 4 6 7
export PATH="$PATH:$HOME/bash-script"
