# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -lF'

alias ip='ip -c'

alias diff='diff --color'

# git
alias gitfix='git diff --name-only | uniq | xargs vim'

# grep
alias grep='grep --exclude-dir={__pycache__,*mypy_cache} -I --color'
