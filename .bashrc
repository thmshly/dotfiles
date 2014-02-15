#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -lh'
alias mzbck='rm -rf $HOME/.mozilla.rm-me; mv $HOME/.mozilla.bck $HOME/.mozilla.rm-me; cp -rp /tmp/.mozilla $HOME/.mozilla.bck;'
alias firefox='[ ! -d /tmp/.mozilla ] && cp -rp .mozilla.bck /tmp/.mozilla; firefox -ProfileManager -no-remote &'
#PS1='[\u@\h \W]\$'
PS1='[\j]\w $ '

set -o vi
