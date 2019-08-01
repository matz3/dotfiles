alias m='meta --exclude ${PWD##*/} $1'
alias x='meta --exclude ${PWD##*/} exec $1'

function killportprocess() {
    lsof -i tcp:$1 | awk 'NR!=1 {print $2}' | xargs kill
}

function mkcd() {
    mkdir $1 && cd $1
}
