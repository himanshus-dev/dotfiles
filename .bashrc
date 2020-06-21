# fuzzy-finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# powerline-shell
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# golang stuff
export GOROOT=$HOME/go
#export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# aliases
alias own_dir='sudo chown -R himanshu:himanshu'
