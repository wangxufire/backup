#pacman
#破坏依赖卸载
#pacman -Rdd
#不被依赖的包
#pacman -Qqtd

# Alias
alias ll='ls -l'
alias py='proxychains4'
alias ls='ls --color=auto'
alias off='shutdown now -h'
alias grep='grep --color=auto'
alias cc='cd /home/madoka'
alias apa='sudo systemctl start httpd'
alias ls='/usr/bin/ls -hF --color=auto'
alias pacman='sudo pacman --color=auto'
alias grep='/usr/bin/grep --color=auto -P'
alias sshd='sudo systemctl start sshd.service'
alias smb='sudo /usr/bin/smbd -D && sudo /usr/bin/nmbd -D'
alias smbd='sudo systemctl start smbd.service && sudo systemctl start nmbd'

# Var
PL="2"

# Export
export TIME_STYLE="+%Y-%m-%d %H:%M:%S"

# Command completion
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE
autoload -U compinit
compinit

# Color
autoload -U colors
colors
eval `dircolors ~/.color`

#标题栏、任务栏样式
case $TERM in (*xterm*|*rxvt*|(dt|k|E)term)
precmd () { print -Pn "\e]0;%n@%M:%/\a" }
preexec () { print -Pn "\e]0;%n@%M:%/\ $1\a" }
;;
esac

# PROMPT

autoload -U promptinit
promptinit
setopt prompt_subst

XB_FACE="PATH >>"

X_FACE="%{$fg_bold[red]%}$XB_FACE%{$fg[green]%}%{$reset_color%}"
X_URNM="%{$fg_bold[cyan]%}%n%{$reset_color%}"
#X_MCNM="%{$fg_bold[magenta]%}%M%{$reset_color%}"
X_MCNM="%{$fg_bold[yellow]%}%M%{$reset_color%}"
#X_CLON="%{$fg[yellow]%}%{$reset_color%}"
X_PATH="%{$fg_bold[green]%}<%~>%{$reset_color%}"
#X_NTLN="%{$fg_bold[yellow]%}Command Line %{$reset_color%}"
X_NTLN="%{$fg_bold[magenta]%}Command Line ->%{$reset_color%}"
X_NTMD="%{$fg_bold[cyan]%}==>%{$reset_color%}"
X_NTST="%{$fg_bold[cyan]%}=>%{$reset_color%}"
X_TIME="%{$fg[cyan]%}20%D %*%{$reset_color%}"


if [[ $PL == "2" ]]; then

git_info() {
    local gitrev="$(git rev-parse --git-dir 2>/dev/null)"
    if [[ "$gitrev" == "" ]]; then
echo ""
    else
local git_cmt="$(git reflog 2>/dev/null | sed -n '1p' | awk '{print $1}')"
      local git_brc="$(git branch 2>/dev/null | grep '^\*' | sed 's/^\*\ //')"
     # echo "%{$fg_bold[blue]%}($git_brc:$git_cmt)%{$reset_color%}"
    fi
  }

  mid_space() {
    local len
    (( len = ${COLUMNS} - ${#${(%):-.$XB_FACE %n@%M:%~20%D %*}} ))
    printf " "%.0s {1..$len}
  }

  PROMPT="$X_FACE $X_URNM@$X_MCNM$X_CLON $X_PATH \$(git_info)
$X_NTLN "
  PROMPT2=" $X_NTST "
  RPROMPT=$X_TIME

else

PROMPT="$X_FACE$X_PATH $X_NTMD "
  PROMPT2=" $X_NTST "
  RPROMPT=$X_TIME

fi

# History
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

## the part of completion system is from Archlinux /etc/zsh/zshrc

# prepare for completion system

is4(){
    [[ $ZSH_VERSION == <4->* ]] && return 0
    return 1
}

is42(){
    [[ $ZSH_VERSION == 4.<2->* || $ZSH_VERSION == <5->* ]] && return 0
    return 1
}

# completion system
#
# called later (via is4 && grmlcomp)
# note: use 'zstyle' for getting current settings
# press ^xh (control-x h) for getting tags in context; ^x? (control-x ?) to run complete_debug with trace output
grmlcomp() {
    # TODO: This could use some additional information

    # Make sure the completion system is initialised
    (( ${+_comps} )) || return 1

    # allow one error for every three characters typed in approximate completer
    zstyle ':completion:*:approximate:' max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )'

    # don't complete backup files as executables
    zstyle ':completion:*:complete:-command-::commands' ignored-patterns '(aptitude-*|*\~)'

    # start menu completion only if it could find no unambiguous initial string
    zstyle ':completion:*:correct:*' insert-unambiguous true
	zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
    zstyle ':completion:*:correct:*' original true

    # activate color-completion
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

    # format on completion
    zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'

    # automatically complete 'cd -<tab>' and 'cd -<ctrl-d>' with menu
    # zstyle ':completion:*:*:cd:*:directory-stack' menu yes select

    # insert all expansions for expand completer
    zstyle ':completion:*:expand:*' tag-order all-expansions
    zstyle ':completion:*:history-words' list false

    # activate menu
    zstyle ':completion:*:history-words' menu yes

    # ignore duplicate entries
    zstyle ':completion:*:history-words' remove-all-dups yes
    zstyle ':completion:*:history-words' stop yes

    # match uppercase from lowercase
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

    # separate matches into groups
    zstyle ':completion:*:matches' group 'yes'
    zstyle ':completion:*' group-name ''

    if [[ "$NOMENU" -eq 0 ]] ; then
        # if there are more than 5 options allow selecting from a menu
        zstyle ':completion:*' menu select=5
    else
        # don't use any menus at all
        setopt no_auto_menu
    fi

	zstyle ':completion:*:messages' format '%d'
    zstyle ':completion:*:options' auto-description '%d'

    # describe options in full
    zstyle ':completion:*:options' description 'yes'

    # on processes completion complete all user processes
    zstyle ':completion:*:processes' command 'ps -au$USER'

    # offer indexes before parameters in subscripts
    zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

    # provide verbose completion information
    zstyle ':completion:*' verbose true

    # recent (as of Dec 2007) zsh versions are able to provide descriptions
    # for commands (read: 1st word in the line) that it will list for the user
    # to choose from. The following disables that, because it's not exactly fast.
    zstyle ':completion:*:-command-:*:' verbose false

    # set format for warnings
    zstyle ':completion:*:warnings' format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'

    # define files to ignore for zcompile
    zstyle ':completion:*:*:zcompile:*' ignored-patterns '(*~|*.zwc)'
    zstyle ':completion:correct:' prompt 'correct to: %e'

    # Ignore completion functions for commands you don't have:
    zstyle ':completion::(^approximate*):*:functions' ignored-patterns '_*'

    # Provide more processes in completion of programs like killall:
    zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'

    # complete manual by their section
    zstyle ':completion:*:manuals' separate-sections true
	zstyle ':completion:*:manuals.*' insert-sections true
	zstyle ':completion:*:man:*' menu yes select

    # Search path for sudo completion
    zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
                                               /usr/local/bin \
                                               /usr/sbin \
                                               /usr/bin \
                                               /sbin \
                                               /bin \
                                               /usr/X11R6/bin

    # provide .. as a completion
    zstyle ':completion:*' special-dirs ..

    # run rehash on completion so new installed program are found automatically:
    _force_rehash() {
        (( CURRENT == 1 )) && rehash
        return 1
    }

    ## correction
    # some people don't like the automatic correction - so run 'NOCOR=1 zsh' to deactivate it
    if [[ "$NOCOR" -gt 0 ]] ; then
	zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete _files _ignored
        setopt nocorrect
    else
        # try to be smart about when to use what completer...
        setopt correct
        zstyle -e ':completion:*' completer '
			if [[ $_last_try != "$HISTNO$BUFFER$CURSOR" ]] ; then
				_last_try="$HISTNO$BUFFER$CURSOR"
				reply=(_complete _match _ignored _prefix _files)
			else
				if [[ $words[1] == (rm|mv) ]] ; then
					reply=(_complete _files)
				else
					reply=(_oldlist _expand _force_rehash _complete _ignored _correct _approximate _files)
				fi
			fi'
    fi

    # command for process lists, the local web server details and host completion
    zstyle ':completion:*:urls' local 'www' '/var/www/' 'public_html'

    # caching
    [[ -d $ZSHDIR/cache ]] && zstyle ':completion:*' use-cache yes && \
                            zstyle ':completion::complete:*' cache-path $ZSHDIR/cache/

    # host completion
    if is42 ; then
        [[ -r ~/.ssh/known_hosts ]] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
        [[ -r /etc/hosts ]] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
    else
		_ssh_hosts=()
        _etc_hosts=()
    fi
		hosts=(
       	 	$(hostname)
        	"$_ssh_hosts[@]"
        	"$_etc_hosts[@]"
        	localhost
    	)
    zstyle ':completion:*:hosts' hosts $hosts
    # TODO: so, why is this here?
    # zstyle '*' hosts $hosts

    # use generic completion system for programs not yet defined; (_gnu_generic works
    # with commands that provide a --help option with "standard" gnu-like output.)
    for compcom in cp deborphan df feh fetchipac head hnb ipacsum mv \
                   pal stow tail uname ; do
        [[ -z ${_comps[$compcom]} ]] && compdef _gnu_generic ${compcom}
    done; unset compcom

    # see upgrade function in this file
    compdef _hosts upgrade
}

is4 && grmlcomp

#MAP KEY
# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

bindkey -e                                            # Use emacs key bindings

bindkey '\ew' kill-region                             # [Esc-w] - Kill from the cursor to the mark
bindkey -s '\el' 'ls\n'                               # [Esc-l] - run command: ls
bindkey '^r' history-incremental-search-backward      # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
if [[ "${terminfo[kpp]}" != "" ]]; then
  bindkey "${terminfo[kpp]}" up-line-or-history       # [PageUp] - Up a line of history
fi
if [[ "${terminfo[knp]}" != "" ]]; then
  bindkey "${terminfo[knp]}" down-line-or-history     # [PageDown] - Down a line of history
fi

if [[ "${terminfo[kcuu1]}" != "" ]]; then
  bindkey "${terminfo[kcuu1]}" up-line-or-search      # start typing + [Up-Arrow] - fuzzy find history forward
fi
if [[ "${terminfo[kcud1]}" != "" ]]; then
  bindkey "${terminfo[kcud1]}" down-line-or-search    # start typing + [Down-Arrow] - fuzzy find history backward
fi

if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line      # [Home] - Go to beginning of line
fi
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}"  end-of-line            # [End] - Go to end of line
fi

bindkey ' ' magic-space                               # [Space] - do history expansion
bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word

if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi

bindkey '^?' backward-delete-char                     # [Backspace] - delete backward
if [[ "${terminfo[kdch1]}" != "" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char            # [Delete] - delete forward
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# consider emacs keybindings:

#bindkey -e  ## emacs key bindings
#
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search
#bindkey '^[^[[C' emacs-forward-word
#bindkey '^[^[[D' emacs-backward-word
#
#bindkey -s '^X^Z' '%-^M'
#bindkey '^[e' expand-cmd-path
#bindkey '^[^I' reverse-menu-complete
#bindkey '^X^N' accept-and-infer-next-history
#bindkey '^W' kill-region
#bindkey '^I' complete-word
## Fix weird sequence that rxvt produces
#bindkey -s '^[[Z' '\t'
#

# =========================
# 自动补全设置
# =========================
zstyle ':completion:*' verbose true
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

#纠错
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ssh key
SSH_KEY_PATH='~/.ssh/sshkey'
# 默认编辑器
EDITOR="/usr/bin/vim"
# 终端256色
TERM="xterm-256color"

# =========================
# zsh-syntax-higlighting
# =========================
if [[ -d /usr/share/zsh/plugins/zsh-syntax-highlighting ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/*.zsh
elif [[ -d $HOME/.zsh/zsh-syntax-highlighting ]]; then
    source $HOME/.zsh/zsh-syntax-highlighting/*.zsh
fi
