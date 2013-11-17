function parse_git_branch {
    git branch --no-color 2>/dev/null|sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
function git-track {
    CURRENT_BRANCH=$(parse_git_branch)
    git config branch.$CURRENT_BRANCH.remote $1
    git config branch.$CURRENT_BRANCH.merge refs/heads/$CURRENT_BRANCH
}

function parse_git_branch_and_add_brackets {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ [\1]/'
}

export PS1="\[\033[0;32m\]\u\[\033[0;33m\]@\[\033[0;34m\]\h\[\033[0;37m\]:\W\[\033[0;32m\]\$(parse_git_branch_and_add_brackets)\[\033[0;37m\] $ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export GREP_OPTIONS='--color=auto'
alias ls='ls -GFh'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
