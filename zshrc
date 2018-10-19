export PATH=$PATH:/usr/local/go/bin:$HOME/Code/go/bin:$HOME/.bin:$HOME/.perl6/bin:$HOME/.npm-global/bin:$HOME/.cargo/bin

# My locale is buggy so i fixed åäö in terminal with this hack
export LANG=en_GB.UTF-8

#Auto startx on TTY1
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
 exec run g
 else
    # Tmux
    if command -v tmux>/dev/null; then
      [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
    fi
fi


# . /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh
function get_pwd() {
  echo "${PWD/$HOME/~}"
}

PROMPT="%F{5}[%*] %F{6}%20d%u %F{5}:: "

# Show battery percentage
# RPROMPT="  $(cat /sys/class/power_supply/BAT0/capacity)%%"

# Global syntax highlighting
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Global syntax autocomplete/showcase
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Autocompletion
autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES

# Vi mode 
# Termite
# Remove mode switching delay.
KEYTIMEOUT=5

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() {
   echo -ne '\e[5 q'
}

# Vim mode
bindkey -v

# Auto ls at cd
function chpwd() {
	emulate -L zsh
	ls --color=auto
}

# Ctrl + arrow
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
# ctrl T by default
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Autopair
source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh

# Alias reminder
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh

# QT5
export CGO_CXXFLAGS_ALLOW=".*" 
export CGO_LDFLAGS_ALLOW=".*" 
export CGO_CFLAGS_ALLOW=".*" 
export QT_DIR="/home/simon/.qt"
export PATH="/usr/lib/ccache:$PATH"

export GOPATH=$HOME/Code/go/


# LS colors
export LS_COLORS="ow=01;90:di=00;35:*.go=00;33:fi=00;20:*.docx=00;34:*.odt=00;34:ln=04;31:ex=01;35:*.py=00;33:*.tar.gz=00;37:*.tar.bz=00;37:*.tar.bz2=00;37:*.tar=00;37:*.iso=00;33:*.sh=01;31"


# Meme
# echo "I Use Arch Btw" | cowsay -f tux | lolcat 2> /dev/null

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

alias ls="ls --color=auto"
alias gopath="cd ~/Code/go/src/Programs"
alias ccompilestuff="export CXX=x86_64-w64-mingw32-g++ && export CC=x86_64-w64-mingw32-gcc"
alias giffpath="sudo find / 2> >(grep -v 'Permission denied' >&2) | grep"
alias word="libreoffice --writer"
alias powerpoint="libreoffice --impress"
alias multiscreen='xrandr --output DP2 --auto --left-of eDP1'
alias sshproxy="ssh -C2qTnN -D 8080 simon@78.71.26.88"
alias tar.gz="tar xzf"
alias tar.xz="tar xJf"
alias dob="cd ~/Code/go/src/github.com/AlmightyF*/dob"
alias wps.w="wps"
alias wps.p="wpp"
alias wps.e="et"
alias bettercap.docker="docker run -it --privileged --net=host bettercap/bettercap"
alias cwap="cd /home/simon/Code/go/src/Programs/cwap"
alias pow="sudo cpupower frequency-set -g powersave"
alias per="sudo cpupower frequency-set -g performance"
alias assembler="nasm -f elf32"
alias linker="ld -m elf_i386"
alias asli="nasm -f elf32 main.nasm -o main.o ; ld -m elf_i386 main.o -o main ; ./main"
alias elmli="elm-make src/Main.elm --output='www/index.html'"
alias gogiscord='cd ~/Code/go/src/github.com/AlmightyFloppyFish/giscord'
alias gate="ssh gate@78.71.26.88"
alias vim="echo 'Did you mean nvim or actually vim?'; sleep 2; vim"
alias scheck='./logic 2> /dev/null; echo 0'
alias clean='pacman -Qdtq | sudo pacman -Rs -'
alias fixterm='export TERM=xterm'
alias nvimrc="nvim ~/.config/nvim/init.vim"
alias zshrc="nvim ~/.zshrc"
alias netuse='sudo netstat -tulpn'
alias craptop='ssh simon@78.71.26.88'
alias craptop-local='ssh simon@192.168.1.201'
alias touchpadtap="xinput set-prop 13 298 1"
alias ef="cd ~/OneDrive/Programmering/code/web/Forum"
alias backup="rsync -av --delete -e ssh /home/simon/Code/ simon@78.71.26.88:/home/simon/simon/code_backup/"
alias giscord="go run /home/simon/Code/go/src/github.com/AlmightyFloppyFish/giscord/*.go"
