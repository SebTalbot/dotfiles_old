#                         _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _            
# - - - - - - - - - - - / D E F A U L T     O P T I O N S \ - - - - - - - - - -
#                       - - - - - - - - \ / - - - - - - - -          

case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac


if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  color_prompt=yes
    else
  color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

PATH="/home/snowl/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/snowl/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/snowl/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/snowl/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/snowl/perl5"; export PERL_MM_OPT;

#                         _ _ _ _ _ _ _ _ _ _ _ _ _ _ _            
# - - - - - - - - - - - / P E R S O N A L   O P T I O N S \ - - - - - - - - - -
#                       - - - - - - - - \ / - - - - - - - -          

# 250 Colors for VIM
# export VISUAL="vim"
# export EDITOR="$VISUAL"
export TERM=xterm-256color

# No CTRL+S
stty -ixon

#                                   _ _ _ _ _                      
# - - - - - - - - - - - - - - - - / P R O M P T \ - - - - - - - - - - - - - - -
#                                 - - - \ / - - -                    

source ~/.git-prompt.sh
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
# Powerline prompt
PS1='\[\033[46;37m\] \w\[$(tput sgr0)\033[45;36m\] \[\033[30m\] $(__git_ps1)\[\033[40;35m\] \[\033[00m\]'

# Keep it simple if running in emacs.
case "$EMACS" in
    t)
    PROMPT_COMMAND=
    PS1="\w <\$(__git_ps1)> "
esac

#                                     _ _ _ _ _                        
# - - - - - - - - - - - - - - - - - / A L I A S \ - - - - - - - - - - - - - - -
#                                   - - \ _ / - -                      

# Alias to manage dotfiles
alias config='/usr/bin/git --git-dir=/home/$USER/.dotfiles/ --work-tree=/home/$USER'

# Alias terminal
alias l='ls --group-directories-first -la'
alias lg='ls --group-directories-first -l'
alias ll='ls -alF'
alias la='ls -A'
alias cb="cd .."
alias t="tree --dirsfirst -f"
alias r="ranger"
alias nterm="urxvt || pwd &"

# Alias neoVim
alias vi='nvim'
alias vim='nvim'

# Alias Node.js
alias ng="npm list -g --depth=0 2>/dev/null"
alias nl="npm list --depth=0 2>/dev/null"
