##########################
### EXPORTS AND CONFIG ###
##########################

### zsh home
export ZSH=$HOME/.zsh

### PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

### productivity and wsl stuff

# windows home
export WIN=/mnt/c

# workspace
export WKSP=$HOME/workspace

### history config

# history file
export HISTFILE=$ZSH/.zsh_history

# how many commands to store in .zsh_history
export HISTSIZE=10000

# how many commands history will save in the file
export SAVEHIST=10000

# ignore duplicates in history
setopt HIST_IGNORE_ALL_DUPS

# don't show duplicates when searching history
setopt HIST_FIND_NO_DUPS

### zsh themes and plugins

# themes
source $ZSH/themes/powerlevel10k/powerlevel10k.zsh-theme

# plugins
source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=($ZSH/plugins/zsh-completions/src $fpath)

##########################################
### USER-DEFINED ALIASES-AND-FUNCTIONS ###
##########################################

### zsh-specific aliases
alias zr='vim ~/.zshrc' # edit .zshrc
alias sc='source ~/.zshrc' # source .zshrc

### ls gets its own section
alias ls='ls -A --color=auto' # not using -a or -A is like not showing hidden files on Windows
alias l='ls -lhp'
alias ll='l'
alias la='l -a' # in case you want to see the dots

### make unaliased commands work better
alias mv='mv -iv' # use interactive mode and show results
alias cp='cp -iv' # use interactive mode and show results
alias df='df -h' # always show disk space in human-readable units
alias echo='echo -e' # always allow escaped characters

### getting somewhere

# easier to type and always ls when you cd
# using non-aliased commands for portability
go () {
  \cd $1
  \echo -e "\e[1;30m${$(pwd)/\/home\/$USER/"~"}:\e[0m" # show '~' for home and color dark gray
  \ls -A --color=auto
}

# make 'cd ..' easier
alias up='go ..'
alias up1='go ..'
alias up2='go ../..'
alias up3='go ../../..'
alias up4='go ../../../..'
alias up5='go ../../../../..'
alias ..='up'
alias ...='up2'
alias ....='up3'
alias .....='up4'
alias ......='up5'

alias bk='go "$OLDPWD' # go to previous directory

# places
alias wksp="go $WKSP"
alias wk="wksp"
alias rp="go $WKSP/repos"
alias repos="rp"
alias win="go $WIN"
alias wsld="go $WIN/wsl"
alias wdocs="go $WIN/Users/m94710/Documents"
alias wdown="go $WIN/Users/m94710/Downloads"

### common commands
alias s='sudo'
alias c='clear'
alias h='history'
alias mk='mkdir'
alias hg='history | grep'
alias f='find'
alias fs='find | grep'
alias q='exit'
alias p='pwd'
alias k='kill'
alias pk='pkill'
alias now='date "+%a %m/%d %H:%M"'
alias nl='/dev/null'
alias 777='chmod -R 777'
alias space='du -S | sort -n -r | more'
alias tz='tar -xvzf'
alias ta='tar -xvcf'

# mk and go to dir of destination
# always navigates to the first directory
mkg () {
  mk -p $@ && go $1
}

# mv and go to dir of destination
# TODO figure out a way to do this for cp
mg () {
  if [ -d ${@: -1} ];then
    dir=${@: -1}
  else
    dir=$(dirname ${@: -1})
  fi
  mv $@ && echo "" && go $dir
}

# break the rm habit and use the trash cli instead
# you can still use rm with \rm
alias rm='echo "\e[0;31mAvoid using rm, use tr or trash instead!\e[1;30m"'
alias tr='trash'
alias trl='trash-list'
alias empty='trash-empty' # longer and different alias for safety
alias trs='trash-restore'

# apt stuff
alias ai='sudo apt install'
alias agi='sudo apt-get install'
alias ar='sudo apt remove'
alias agr='sudo apt-get remove'
alias au='sudo apt update'
alias agu='sudo apt-get update'
alias ag='sudo apt upgrade'
alias agg='sudo apt-get upgrade'

# apps
alias wsl='wsl.exe'
alias v='vim'
alias sv='sudo vim'
alias ff='firefox'
alias co='code'
alias co.='code .'
alias ci='code-insiders'
alias codi='code-insiders'
alias ci.='code-insiders .'
alias codi.='code-insiders .'
alias py='python3'
alias python='python3'

### networking
alias net='netstat -tulane'

# kill whatever's running on a given port
kpt () {
  fuser $1/tcp -k
}

### git
alias g='git'
alias st='git status' # my single most used command aside from l/ll
alias com='git commit -m'
alias comv'git commit'
alias ga='git add'
alias gaa='git add -A'
alias all='git add -A'
alias gs='git switch'
alias new='git switch -c'
alias gsm='git switch main'
alias pull='git pull'
alias push='git push'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git checkout'
alias gd='git diff'
alias dif='git diff'
alias diff='git diff'
alias gm='git merge'
alias gmm='git merge main' # not very useful because of the latest commands below
alias gl='git log'
alias gr='git restore'
alias grs='git restore --staged'
alias grm='git rm' # be careful

# pull the latest changes from main into your branch,
# while leaving a commit of the premerge state
# note that this can be simplified by just doing `git pull origin main`,
# but this makes sure your local main is up-to-date
latest () {
  targetBranch=$(git branch --show-current)
  git add -A
  git commit -m "commit prior to merging from master"
  git switch main
  git pull
  git switch $targetBranch
  git merge main
}

# this does the same as the previous function without making the premerge commit
latestnocom () {
  targetBranch=$(git branch --show-current)
  git stash
  git switch main
  git pull
  git switch $targetBranch
  git merge main
  git stash pop
}

# backs out a commit to main and puts those changes on a new branch instead
fixmaincommit () {
  git branch $1
  git reset HEAD~ --hard
  git switch $1
}

# run this when you need to clean-slate everything you're working on
# and by that i mean EVERYTHING you are working on will be gone
fthis () {
  read -p "Are you sure you want to go through with this? [Y/n]: " yn
  case $yn in
    [Y][Ee][Ss]|[Y] )
      echo "Resetting master and removing untracked changes..."
      git fetch origin
      git switch main
      git reset --hard origin/main
      git clean -d --force
      echo "Done, your repo is like new!"
      ;;
    * )
      echo "That was a close one!"
      ;;
  esac
}

# same as the above in essence,
# but this time actually delete and reclone the repo
# handle with care
fuckthis () {
  read =p "Are you sure you want to go through with this? [Y/n]: " yn
  case $yn in
    [Y][Ee][Ss]|[Y] )
      echo "Undoing all..."
      repoPath=$(pwd)
      url=$(git remote get-url origin)
      cd ..
      sudo rm -r $repoPath
      echo "Restoring balance..."
      git clone $url
      cd $repoPath
      echo "It is done."
      ;;
    * )
      echo "That was close!"
      ;;
  esac
}

###########
### END ###
###########
