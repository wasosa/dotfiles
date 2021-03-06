[ -z "$PS1" ] && return

# ==================== helpers ====================

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

HISTIGNORE=bg:fg:ls:ll:pwd:exit
HISTCONTROL=ignoredups
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize
shopt -s globstar
shopt -s direxpand >& /dev/null || true

PS1="[\u][\h][\w][\$?]: "

case "$TERM" in
xterm*|rxvt*)
  PS1="\[\e]0;[\u][\h][\w]\a\]$PS1" ;;
esac

if [ -x /usr/bin/dircolors ]; then
  if [ -r ~/.dircolors ]
  then
    eval "$(dircolors -b ~/.dircolors)"
  else
    eval "$(dircolors -b)"
  fi
  alias ls='ls -F --color=auto'
  alias ll='ls -lF --color=auto'
  alias grep='grep --color=auto'
else
  alias ls='ls -F'
  alias ll='ls -lF'
fi

alias clip='xclip -filter -selection primary | xclip -filter -selection secondary | xclip -filter -selection clipboard'
alias dark='xset dpms force standby'

export EDITOR='emacs -nw'
export VISUAL='emacs -nw'

[ -e /etc/bash_completion.d/git ] && source /etc/bash_completion.d/git

alias work='sudo openvpn --daemon --cd /etc/openvpn --config wasosa.ovpn --script-security 2'
alias play='sudo pkill openvpn'

export DISPLAY=:98
export COLUMNS
export LINES

[ -e $HOME/.gitlab-ci-tokens ] && source $HOME/.gitlab-ci-tokens

alias bye='DISPLAY=:0 slock'
alias cop='IMAGE=buildbot-ruby brun rubocop'
alias cat='bat'

# end of file
