# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

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
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# some more ls aliases
alias ls='eza --icons'
alias ll='eza -l'
alias la='eza --icons -a'
alias l='eza'

alias cat="bat"
alias find="fd"
alias grep="rg"
alias ps="procs"

alias g='git'
alias t='tmux'
alias v='nvim'
alias c='clear'

alias p='python3'
alias doc='pydoc'

alias ssh="TERM=xterm-256color ssh"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/etc/profile.d/z.sh

# change the lima default name 
export LIMA_INSTANCE=debian

alias listop='limactl stop debian'
alias listart='limactl start debian'

# update yabai when upgrade it 
alias yup='~/.bin/yabai_update.sh'

# update the outdated packages
function brew() {
  command brew "$@" 

  if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
    sketchybar --trigger brew_update
  fi
}

# config the yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Using fd with fzf
export FZF_DEFAULT_COMMAND='fd --type file --color=always --follow --hidden --exclude .git'
export FZF_DEFAULT_OPTS="--ansi --border"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# use my own bash file
PATH=$PATH:~/.bin


# Goerge Hotz's config
export CLICOLOR=1
export PS1='\u@\h:\[\e[33m\]\w\[\e[0m\]\$ '
# export EDITOR='vim'
# George Hotz's config

# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.
# export DISPLAY=:0

export TLDR_AUTO_UPDATE_DISABLED=true

# enable the fuck command
# eval $(thefuck --alias)


# add the mojo to the PATH
export MODULAR_HOME="$HOME/.modular"
export PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/zdmai/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/zdmai/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/zdmai/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/zdmai/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

conda deactivate
conda activate base
# <<< conda initialize <<<


eval "$(starship init zsh)"
