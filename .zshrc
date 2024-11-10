# 设置历史记录
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# 加载插件
source ~/.zsh/zsh-dircolors-solarized/zsh-dircolors-solarized.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh


# 添加 zsh-completions 到 fpath
fpath=(~/.zsh/zsh-completions/src $fpath)

# 补全设置
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' complete-all true
zstyle ':completion:*' accept-exact true
zstyle ':completion:*' verbose true
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# 启用自动补全
autoload -Uz compinit
compinit

# 设置按键绑定
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[Z' reverse-menu-complete  # Shift+Tab 向前选择
bindkey '^I' menu-complete            # Tab 向后选择

# 设置 PS1
setopt PROMPT_SUBST
PS1=' %F{93}%~ %f> '
#PS1='[%F{205}%n %f@ %F{43}%m%f] > %F{93}%~ %f> '
# 设置基本别名
if [[ "$(uname)" == "Darwin" ]]; then
    alias ls='gls --color=auto'
else
    alias ls='ls --color=auto'
fi
alias ll='ls -lah'
alias grep='grep --color=auto'

# 启用命令行编辑
bindkey -e

# 补全相关选项
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE
