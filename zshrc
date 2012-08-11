# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

source $ZSH/oh-my-zsh.sh
unsetopt auto_name_dirs

# Customize to your needs...
export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"

export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/node_modules/.bin:$PATH
export PYTHONPATH=/usr/local/lib/python2.6/site-packages

# RVM prompt
function time_since_last_commit() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  git log -1 --pretty=format:"%ar" | sed 's/\([0-9]*\) \(.\).*/\1\2/'
}
PS1="\$(~/.rvm/bin/rvm-prompt) $PS1"

# De-symbolicate iPhone app builds
function desym
{
    /Developer/Platforms/iPhoneOS.platform/Developer/Library/PrivateFrameworks/DTDeviceKit.framework/Versions/A/Resources/symbolicatecrash -A -v $1 | more
}

alias myip='curl www.whatismyip.com/automation/n09230945.asp'
export JSTESTDRIVER_HOME="${HOME}/bin/"


export EDITOR="mvim -f"

# Set VIM mode
set -o vi
# Use incremental history search on /
bindkey -M vicmd '/' history-incremental-search-backward
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# Show VI mode at right
export PS_BKP=$PS1
function zle-line-init zle-keymap-select {
    #PS1="${${KEYMAP/vicmd/N}/(main|viins)/I} $PS_BKP"
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Functions
compute () { awk "BEGIN{ print $* }" ;}
center () { _cen=$1;printf "%*s\n" $(((${#_cen}+$COLUMNS)/2)) "$_cen";}

# Aliases
alias be="bundle exec"
alias ber="bundle exec rspec"
alias berd="bundle exec rspec --drb"
alias ql="qlmanage -p"
alias ss="/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

alias quotes="wget --timeout=1 -O - -q http://www.iheartquotes.com/api/v1/random\?show_permalink\=false\&width=150\&show_source\=false\&source\=south_park+simpsons_homer"

figlet -c -w`tput cols` `hostname`|lolcat
center "`date`"
center "`uptime`"
quotes|cowsay -n -W`compute $(tput cols)/2`|lolcat
echo

source $(rvm default do rvm env --path)
__rvm_project_rvmrc

