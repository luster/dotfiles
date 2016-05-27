# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="simple"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git aws sublime)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin"
source $ZSH/oh-my-zsh.sh
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias vim="/usr/local/Cellar/macvim/7.4-77/bin/mvim -v"
alias vi="vim"
alias git="hub"

# Hackerati aliases
alias hack="cd ~/Developer/Hackerati"

# Masters aliases
alias thesis="cd ~/Developer/Thesis/thesis; workon thesis;"

# Functions
function server() {
    python -c "import BaseHTTPServer as bhs, SimpleHTTPServer as shs; print 'Server running on ${1:-8000}'; bhs.HTTPServer(('127.0.0.1', ${1:-8000}), shs.SimpleHTTPRequestHandler).serve_forever()"
}

function swap() {
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

function cchk() {
    # Auto-check for pep8 so I don't check in bad code
    FILES=$(git diff --cached --name-only --diff-filter=ACM | grep -e '\.py$')
    if [ -n "$FILES" ]; then
        flake8 -r $FILES
    fi
}

# Python virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Developer
source /usr/local/bin/virtualenvwrapper.sh

# tmuxinator
export EDITOR='vim'
export SHELL='zsh'
# source ~/.bin/tmuxinator.sh
source /usr/local/opt/autoenv/activate.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
