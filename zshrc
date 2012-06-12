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
export PATH=~/bin:/opt/local/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH
export PYTHONPATH=/usr/local/lib/python2.6/site-packages

# RVM prompt
PS1="\$(~/.rvm/bin/rvm-prompt) $PS1"

# De-symbolicate iPhone app builds
function desym
{
    /Developer/Platforms/iPhoneOS.platform/Developer/Library/PrivateFrameworks/DTDeviceKit.framework/Versions/A/Resources/symbolicatecrash -A -v $1 | more
}

export JSTESTDRIVER_HOME="${HOME}/bin/"

export NODE_PATH=$NODE_PATH:/usr/local/lib/node:/usr/local/lib/node_modules
export EDITOR="mvim -f"

# Aliases
alias be="bundle exec"
alias ber="bundle exec rspec"
alias berd="bundle exec rspec --drb"

figlet -w`tput cols` `hostname`|lolcat
uptime|lolcat
fortune|cowsay|lolcat
echo
