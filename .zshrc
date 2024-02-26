# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
bindkey -v
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# To prevent overriding fzf keybinds
ZVM_INIT_MODE=sourcing
source /usr/share/doc/pkgfile/command-not-found.zsh
plugins=(ssh-agent git gitfast gpg-agent aws command-not-found fzf git-escape-magic gulp httpie npm thefuck vscode zsh-fzf-history-search zsh-vi-mode zsh-autosuggestions zsh-syntax-highlighting)

# Loading SSH identities
zstyle :omz:plugins:ssh-agent lazy yes identities rushvora-github_rsa rushvora-bitbucket_rsa ds-rv-bitbucket alt-github rv-pi4 adi-pi

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

source $ZSH/oh-my-zsh.sh

# Contains secrets
source $HOME/zshrc.env

# User configuration
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.nodenv/bin:$PATH"
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
export GPG_TTY=$TTY
export EDITOR=vim
export VISUAL=vim
export THEFUCK_PRIORITY="git_hook_bypass=1100" # remove once handling of "gp" (git push) works as expected
eval "$(nodenv init -)"
eval "$(goenv init -)"
eval $(thefuck --alias)
eval "$(rbenv init - zsh)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# export PATH="$GOROOT/bin:$PATH" # only works when go is used via goenv instead of system
# export PATH="$PATH:$GOPATH/bin" # only works when go is used via goenv instead of system

# if [ $GOROOT ]; then
#   export PATH="$GOROOT/bin:$PATH"
# fi
# if [ $GOPATH ]; then
#   export PATH="$PATH:$GOPATH/bin"
# fi

# Not sure if the below 3 lines is needed for croc
# PROG=croc
# _CLI_ZSH_AUTOCOMPLETE_HACK=1
# source /etc/zsh/zsh_autocomplete_croc

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gitcfg="git --git-dir=$HOME/.gitcfg/ --work-tree=$HOME"
alias pip=pip3
alias hs="hub sync"
alias pullfolders="ls | xargs -P10 -I{} git -C {} pull"
alias npmifolders="node /home/rushvora/Code/Random\ Snippets/node/nested-npm-i.js"
alias gcoplock="node /home/rushvora/Code/Random\ Snippets/node/nested-gco-package-lock.js"
alias c="xclip -selection clipboard"
alias dockerprune="docker image prune --all"

# No longer using ExpressVPN
# alias vpnstart="sudo systemctl start expressvpn"
# alias vpnstop="sudo systemctl stop expressvpn"
# alias vpnstat="systemctl status expressvpn"
# alias vpnin="expressvpn connect inmu1"
# alias vpnnl="expressvpn connect nlth"
# alias vpndc="expressvpn connect uswd"
# alias vpnla="expressvpn connect usla"
# alias vpnnj="expressvpn connect usnj3"
# alias vpnsg="expressvpn connect sgju"
# alias vpnuk="expressvpn connect ukel"
# alias vpndisc="expressvpn disconnect"

alias vpnip="curl -4 https://icanhazip.com"
alias vpnip6="curl -6 https://icanhazip.com"
alias ip4="dig @resolver3.opendns.com myip.opendns.com +short"
alias ip6="dig @resolver1.ipv6-sandbox.opendns.com AAAA myip.opendns.com +short -6"
alias vpndsstart="sudo systemctl start pritunl-client"
alias vpndsstop="sudo systemctl stop pritunl-client"
alias vpndsstat="systemctl status pritunl-client"
alias dsvpn="pritunl-client start myvqikuyqc0jlpxi -m=ovpn -p $PRITUNL_PASSWORD"
alias dsvpndisc="pritunl-client stop myvqikuyqc0jlpxi"
alias dsprodvpn="pritunl-client start hc1kymosltjym2rp -m=ovpn -p $PRITUNL_PASSWORD"
alias dsprodvpndisc="pritunl-client stop hc1kymosltjym2rp"
alias dsnlbvpn="pritunl-client start r7yew35uscxwmc8s -m=ovpn -p $PRITUNL_PASSWORD"
alias dsnlbvpndisc="pritunl-client stop r7yew35uscxwmc8s"
alias dsvpnstat="pritunl-client list"
alias dsvpnstatus="watch pritunl-client list"
alias qalc="nocorrect qalc"
alias b64="openssl enc -A -base64"
alias mongoup="docker-compose -f ~/docker/mongodb-v4-4-11/docker-compose.yml up -d"
alias mongodown="docker-compose -f ~/docker/mongodb-v4-4-11/docker-compose.yml down"
# alias mysql56up="docker-compose -f ~/docker/mysql-v5-6/docker-compose.yml up -d"
# alias mysql56down="docker-compose -f ~/docker/mysql-v5-6/docker-compose.yml down"
# alias mysql57up="docker-compose -f ~/docker/mysql-v5-7/docker-compose.yml up -d"
# alias mysql57down="docker-compose -f ~/docker/mysql-v5-7/docker-compose.yml down"
alias pgsqlup="docker-compose -f ~/docker/postgres-latest/docker-compose.yml up -d"
alias pgsqldown="docker-compose -f ~/docker/postgres-latest/docker-compose.yml down"
alias goghthemes='bash -c "$(wget -qO- https://git.io/vQgMr)"'
# alias trafficgraph="speedometer -l -r enp4s0 -t enp4s0 -m $(( 1024 * 1024 * 3 / 2 ))"
alias getfilests="sudo tailscale file get ./"
alias afsstart="sudo systemctl start netatalk.service"
alias afsstop="sudo systemctl stop netatalk.service"
alias afstat="systemctl status netatalk.service"
# alias plexmount="sudo mount -t ntfs /dev/nvme2n1p1 /mnt/ntfs"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Load Angular CLI autocompletion.
# source <(ng completion script)



autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
