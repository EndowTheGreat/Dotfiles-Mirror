# General configuration.
DISABLE_MAGIC_FUNCTIONS=true
DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true
HISTSIZE=1000
SAVEHIST=1000
export ZSH=$HOME/.oh-my-zsh
export DOTFILES=$HOME/.dotfiles
export HISTCONTROL=ignoreboth
export $EDITOR=nvim

# Theme.
ZSH_THEME="heart"

# Plugins.
plugins=(git zsh-autosuggestions colored-man-pages you-should-use)

source $ZSH/oh-my-zsh.sh

# Aliases.
alias cls="clear"
alias cat="bat"
alias sxiv="nsxiv"
alias uptime="uptime -p | sed 's/up //g'"
alias ls="exa --icons --group-directories-first --git --group --sort extension"
alias lslah="exa -lah --icons --group-directories-first --git --group --sort extension"
alias pacsyu="sudo pacman -Syyu"
alias psua="paru -Sua --noconfirm"
alias psyu="paru -Syu --noconfirm"
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias grep="grep --color=auto"
alias cp="cp -iv"
alias mv="mv -iv"
alias df="df -h"
alias permdel="shred -uzvn3"
alias encsym="gpg -c --no-symkey-cache --cipher-algo AES256"
alias please="sudo"
alias config="git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias ytdl="yt-dlp"
alias ytdl-mp3="yt-dlp --extract-audio --audio-format mp3"
alias ytdl-mp4="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'"
alias mapscii="telnet mapscii.me"

oxfile() {
    ls "$1" 1> /dev/null && curl -sF "file=@${1}" https://0x0.st || \
        echo "Not a file!" && return 1
}


command_not_found_handler() {
    r=$(shuf -i0-9 -n1);
    case $r in
        0 )
            echo -e "\033[38;2;204;36;29m Sorry, that command just doesn't feel like working right now."
            ;;
        1 )
            echo -e "\033[38;2;204;36;29m Oops; it seems you need to remount your brain, because that command isn't a thing!"
            ;;
        2 )
            echo -e "\033[38;2;204;36;29m Lol, I couldn't find that command."
            ;;
        3 )
            echo -e "\033[38;2;204;36;29m Try typing that one again, smart one."
            ;;
        4 )
            echo -e "\033[38;2;204;36;29m 404 command not found!"
            ;;
        5 )
            echo -e "\033[38;2;204;36;29m Hippity hoppity, that command isn't my property."
            ;;
        * )
            echo -e "\033[38;2;204;36;29m Invalid command; try again."
            ;;
    esac
    return 127
}

rm() {
	[[ $1 == "-"* ]] && {
		echo "Stop using flags!"
		return
	}
	gio trash "$@" 2> /dev/null && return
	read -p "gio failed, remove without trash? (y/N) " answ
	[[ $answ != "y" ]] && return
	command rm -rf "$@"
}

# Extract various different file formats.
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

function extract {
 if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

IFS=$SAVEIFS

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
