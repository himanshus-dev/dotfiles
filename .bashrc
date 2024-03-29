# set env vars
export TERM=xterm-256color

# fuzzy-finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# powerline-shell
#function _update_ps1() {
#    PS1=$(powerline-shell $?)
#}

#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi

# starship
eval "$(starship init bash)"

# golang stuff
export GOROOT=$HOME/go
#export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# rust stuff
export PATH=$HOME/.cargo/bin:$PATH
export MOZ_X11_EGL=1
# aliases
alias own_dir='sudo chown -R himanshu:himanshu'
