[ -r ~/.zsh/.zshrc.local ] && source ~/.zsh/.zshrc.local

alias heroku='nocorrect heroku'
alias vim='nocorrect vim'
alias pstree='nocorrect pstree'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias logtoday="git log --pretty=format:\"• %s%n•%b\" --since=\"6am\" | sed 's/^•$//g'"

export EDITOR=vi

autoload -U compinit

autoload -Uz vcs_info
autoload -U zmv
autoload -U colors
colors

[ -r ~/.zsh/.zfunctions ] && source ~/.zsh/.zfunctions
[ -r ~/.zsh/.zfunctions.local ] && source ~/.zsh/.zfunctions.local


HISTSIZE=2000
SAVEHIST=2000
HISTFILE=~/.zhistory

setopt complete_in_word
setopt all_export
setopt append_history
setopt auto_cd
setopt auto_list
setopt auto_param_slash
setopt auto_pushd
setopt auto_resume
setopt cdable_vars
# disable annoying autocorrect
unsetopt correct
unsetopt correct_all

# disable menu completion
unsetopt menu_complete

setopt extended_glob
setopt extended_history
setopt glob_dots
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_no_functions
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt inc_append_history
setopt long_list_jobs
setopt mail_warning
setopt no_hist_beep
setopt no_beep
setopt notify
setopt pushd_minus
setopt pushd_silent
setopt pushd_to_home
setopt rc_quotes
setopt rec_exact
setopt share_history
setopt prompt_subst
unsetopt bg_nice
unsetopt menu_complete

zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
# if [ -z "$mapfile" ]; then
# 	zmodload -ap zsh/mapfile mapfile
# fi

alias ll='ls -l'
alias dir='ls'
alias links='elinks'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias grep='grep --color=auto'
alias sr="screen -r"
alias r=rails

{ which colordiff >& /dev/null } && alias diff='colordiff'

# GNU overrides for OSX:
if [[ $OSTYPE = darwin* ]]; then
	{ which gcp      >& /dev/null } && alias cp='gcp -i'
	{ which gmv      >& /dev/null } && alias mv='gmv -i'
	{ which grm       >& /dev/null } && alias rm='grm -i'
	{ which gls      >& /dev/null } && alias ls='gls --color=auto'
#	{ which gmd5sum  >& /dev/null } && alias md5sum='gmd5sum'
#	{ which gsha1sum >& /dev/null } && alias shasum='gsha1sum'
	{ which gdu      >& /dev/null } && alias du='gdu'
	{ which gtail    >& /dev/null } && alias tail='gtail'
	{ which ghead    >& /dev/null } && alias head='ghead'
	{ which gln      >& /dev/null } && alias ln='gln'
	{ which gmkdir   >& /dev/null } && alias mkdir='gmkdir'
fi

bindkey "^?" backward-delete-char
bindkey "^r" history-incremental-search-backward
bindkey ' ' magic-space    # also do history expansion on space
#bindkey '^I' complete-word # complete on tab, leave expansion to _expand
bindkey '^I' expand-or-complete-prefix
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '\e[3~' delete-char
bindkey '\e[1;5C' forward-word
bindkey '\e[1;5D' backward-word

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=2

# default color for the hostname:
HOST_COLOR="green"
case $HOST in
	*.zoocasa.com|*.i.internal|dhcp*)
		HOST_COLOR="cyan"
	;;

	zooburg*)
		HOST_COLOR="yellow"
	;;
esac

function-exists vcs_info
if [[ $? = 0 ]]; then
	zstyle ':vcs_info:*'              enable            git svn svk cvs
	zstyle ':vcs_info:*'              disable-patterns "$HOME(|/.*|/bin)"
	zstyle ':vcs_info:*'              actionformats    ' (%F{red}%s%f %F{cyan}%b%f%F{yellow}|%F{1}%a%F{cyan} %B%F{yellow}%c%F{red}%u%%b)'
	zstyle ':vcs_info:*'              formats          ' (%F{red}%s%f %F{cyan}%b%f)'
	zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat     '%b%F{1}:%F{3}%r'
	zstyle ':vcs_info:*'              check-for-changes true
	zstyle ':vcs_info:*'              get-revision      true

	precmd() {
		psvar=()
		vcs_info
		[[ -n $vcs_info_msg_0_ ]] && psvar[1]=" $vcs_info_msg_0_"
	}

	# PROMPT=$'%F{$HOST_COLOR}[%n@%f%F{$HOST_COLOR}%m%f %c]${vcs_info_msg_0_}%b%F%f%# '
	PROMPT=$'[%F{$HOST_COLOR}%c%f]${vcs_info_msg_0_}%b%F%f%# '
else
	PROMPT=$'%{$fg[white]%}[%n@%{$fg[$HOST_COLOR]%}%m%{$fg[white]%} %c]%{$reset_color%}%# '
fi

export JZSHRC=1

export TERM=xterm-256color

# function yb() {
#     cd ~/setup/springbox/youbetcha-app
#     pwd
#     export RUBY_HEAP_MIN_SLOTS=1000000
#     export RUBY_HEAP_SLOTS_INCREMENT=1000000
#     export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
#     export RUBY_GC_MALLOC_LIMIT=1000000000
#     export RUBY_HEAP_FREE_MIN=500000
# }

fpath=(~/.zsh/zsh-completions/src $fpath)

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# compinit

function dict () {
  if [[ $1 == (d|m) ]]; then
    curl dict://dict.org/$1:$2 | $PAGER
  else
    echo 'Unknown command. Use (d)efine or (m)atch.'
  fi
}
