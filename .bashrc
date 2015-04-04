export CLICOLOR=1
export PATH=$HOME/bin/:$HOME/Dropbox/bin/:$PATH 

alias ll='ls -Alrth'
alias cd_training='cd ~/Dropbox/Training/'
alias enw='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
alias ew='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias cd_note='cd ~/Dropbox/Org/'
alias lu='dict.py'
if [ -f ~/.bash.d/git-completion.bash ]; then
  . ~/.bash.d/git-completion.bash
fi

source /usr/local/bin/virtualenvwrapper.sh

alias wdl='ew ~/Dropbox/Org/SavingLog.org' # write daily log
alias sdl='read_exp_log.py'
alias lse='ls | egrep -v '\''~|#$'\'
alias lle='ll | egrep -v '\''~|#$'\'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
