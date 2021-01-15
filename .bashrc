#launch X in the archlinux distro
export TERMINAL=alacritty
#export TERMINAL=roxterm

#alias cutpaste="vmware-user-suid-wrapper ls"
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

#if [[ $DISPLAY == "127.0.0.1:0.0" && $(which ipconfig.exe) != "" ]]; then
#  export DISPLAY=$(ipconfig.exe | grep 192.168 | grep Addr | cut -d: -f2 | sed -es/\ //g | ${HOME}/bin/dos2unix.pl)":0.0"
#  export LIBGL_ALWAYS_INDIRECT=1
#fi
#if [[ -z $DISPLAY && $(which ipconfig.exe) != "" ]]; then
#  export DISPLAY=$(ipconfig.exe | grep 192.168 | grep Addr | cut -d: -f2 | sed -es/\ //g | ${HOME}/bin/dos2unix.pl)":0.0"
#  export LIBGL_ALWAYS_INDIRECT=1
#fi

export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11

############### Terminal Settings ########################
# export LSCOLORS="dxcxfxfxbxegedabagacad"
# export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=02334:ow=03;34:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:"
#export LS_COLORS="ow=01;90:di=01;90"
export PAGER="less -Rs"

############### Aliases ########################

alias ll="ls -ltrh --color=auto"
alias v="gvim"
alias vi=vim
alias gmake=make
alias bs="catfish --method=beagle --fulltext --path=/home/renau"
alias lock="gnome-screensaver-command -l"
alias grep="grep --color=auto"
alias cal="ncal -bM"
#export PS1="\h:\w\$ "
#export PS1="\h \$(ps1.rb)"
#export PS1="\e[0;91m\u\e[m@\e[0;92m\h\e[m \w \n "
rightprompt()
{
  GIT=$(git config --get remote.origin.url)
  printf "%*s" $COLUMNS $GIT" "$(date +%H:%M:%S)
}

export PS1='\[$(tput sc; rightprompt; tput rc)\]\e[0;91m\u\e[m@\e[0;92m\h\e[m \w \n '

# ps2pdf12 -dPDFSETTINGS#/prepress -dSubsetFonts#false -dEmbedAllFonts#true paper.pdf paper2.pdf 
alias epdf="ps2pdf13 -dPDFSETTINGS#/prepress -dSubsetFonts#false -dEmbedAllFonts#true"

# Affinity
# affinity for i in $(pgrep esesc);do ps -mo pid,tid,fname,user,psr -p $i;done
# taskset -c 0 force all threads to same core

# UCSC Cluster
alias sundance="ssh -X sundance.cse.ucsc.edu"
alias stardance="ssh -X stardance.cse.ucsc.edu"
alias waterdance="ssh -X waterdance.cse.ucsc.edu"
alias mondance="ssh  -X mondance.cse.ucsc.edu"

alias mascd1="ssh mascd1.cse.ucsc.edu"
alias mascd2="ssh mascd2.cse.ucsc.edu"
alias mascd3="ssh mascd3.cse.ucsc.edu"
alias mascd4="ssh mascd4.cse.ucsc.edu"
alias mascd5="ssh mascd5.cse.ucsc.edu"
alias mascd6="ssh mascd6.cse.ucsc.edu"
alias mascd7="ssh mascd7.cse.ucsc.edu"
alias mascd8="ssh mascd8.cse.ucsc.edu"
alias mascd9="ssh mascd9.cse.ucsc.edu"
alias mascd10="ssh mascd10.cse.ucsc.edu"
alias mascd11="ssh mascd11.cse.ucsc.edu"
alias mascd12="ssh mascd12.cse.ucsc.edu"

alias mada0="mosh mada0.cse.ucsc.edu"
alias mada1="ssh mada1.cse.ucsc.edu"
alias mada2="ssh mada2.cse.ucsc.edu"
alias mada3="ssh mada3.cse.ucsc.edu"
alias mada4="ssh mada4.cse.ucsc.edu"
alias mada5="ssh mada5.cse.ucsc.edu"
alias mada6="ssh mada6.cse.ucsc.edu"
alias mada7="ssh mada7.cse.ucsc.edu"
alias mada8="ssh mada8.cse.ucsc.edu"
alias mada9="ssh mada9.cse.ucsc.edu"

alias mada="ssh mada`expr $RANDOM % 4`.cse.ucsc.edu"

############### Path ########################
export PATH=${PATH}:${HOME}/bin
export PATH=${PATH}:/usr/local/bin

############### Bash Completition ########################
#ulimit -c unlimited
ulimit -c 0 # No core
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s extglob
# merge history between terminals
shopt -s histappend   

complete -A directory  mkdir rmdir
complete -A directory  cd

_make_targets ()
{
    local mdef makef gcmd cur prev i

    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}

    case "$prev" in
	-*f) COMPREPLY=( $(compgen -f $cur ) ); return 0;;
	esac

    case "$cur" in
	-) COMPREPLY=(-e -j -f -i -k -n -p -q -r -S -s -t); return 0;;
	esac

    if [ -f makefile ]; then
	mdef=makefile
    elif [ -f Makefile ]; then
	mdef=Makefile
    else
	mdef=*.mk
    fi

    for (( i=0; i < ${#COMP_WORDS[@]}; i++ )); do
	if [[ ${COMP_WORDS[i]} == -*f ]]; then
	    eval makef=${COMP_WORDS[i+1]}
	    break
	fi
    done

    [ -z "$makef" ] && makef=$mdef

    if [ -n "$2" ]; then gcmd='grep "^$2"' ; else gcmd=cat ; fi

    COMPREPLY=( $(cat $makef 2>/dev/null | awk 'BEGIN {FS=":"} /^[^.# 	][^=]*:/ {print $1}' | tr -s ' ' '\012' | sort -u | eval $gcmd ) )
}

complete -F _make_targets -X '+($*|*.[cho])' make gmake pmake ppmake

_cvs_targets ()
{
    local mdef makef gcmd cur prev i

    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}

    if [ -n "$2" ]; then gcmd='grep "^$2"' ; else gcmd=cat ; fi

    case "$cur" in
	-r) COMPREPLY=( -r ); return 0;;
	-) COMPREPLY=( -r ); return 0;;
	esac

    case "$prev" in
	cvs) COMPREPLY=( $(cvs help 2>&1 | cut -c-20 | grep "^   " | sed -e s/\ //g | eval $gcmd ) ); return 0;;
	esac

    COMPREPLY=( $(compgen -f $cur) )
}

complete -F _cvs_targets cvs

complete -F _kill_targets kill

############### Mpage usual configuration ################

alias mpage='enscript --mark-wrapped-lines=arrow  -2r -T2 -j -fcourier6'
alias mpage2='enscript --mark-wrapped-lines=arrow  -r -fcourier6'

############### SVN  ################
alias svn2cl="svn log --xml --verbose | xsltproc ~/bin/svn2cl.xsl -"

##################################

export DISTCC_HOSTS=""
for a in 1 2 3 4 5 6 7
do
	export DISTCC_HOSTS="${DISTCC_HOSTS} @mada${a}.cse.ucsc.edu"
done
for a in 1 2 3 
do
	export DISTCC_HOSTS="${DISTCC_HOSTS} @mascx${a}.cse.ucsc.edu"
done

###################################
# To create patches

alias mkpatch="diff -bBdNrw -U5 --exclude=*.orig --exclude=.git --exclude=.svn --exclude=esesc.xcode --exclude=CVS --exclude=CVSmain --exclude=cscope.files --exclude=cscope.out --exclude=ChangeLog"
###################################
# LLVM SCC
#export PATH=${HOME}/build/llvm-3.3-scc/llvm-install-debug/bin:${PATH}
#export SCC_REPO=${HOME}/projs/SCC
#export SCC_LLVMINSTALL=${HOME}/build/llvm-3.3-scc/llvm-install-debug

###################################
# SESC Flags

# Sourceforge
# ssh jrenau@shell.sourceforge.net

export PATH=${PATH}:${HOME}/projs/esesc/conf/scripts

alias getesesc="tar czvf ~/mtmp/esesc.tar.gz --exclude '*.sw?' esesc/CMake* esesc/tests esesc/conf/ esesc/bins/ esesc/docs esesc/emul esesc/misc esesc/pwth esesc/simu"

##################################
#export PATH=${PATH}:${HOME}/projs/gnu/sparc-elf-4.4.2/bin
#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${HOME}/projs/gnu/sparc-elf-4.4.2/lib

#######################
alias masca1="ssh masca1.cse.ucsc.edu"
alias masca2="ssh cmpe202@masca2.soe.ucsc.edu"

export SCVTOOLS_ROOT=${HOME}/projs/scvtools

#export PATH=$PATH:/usr/local/android/tools
#export PATH=$PATH:/opt/android-sdk-linux_86/tools
#export PATH=$PATH:/opt/android-sdk-linux_86/platform-tools

# add gems like nanoc and jekyll
#export PATH=$PATH:/var/lib/gems/1.8/bin/

# Chipsel
#export CHISEL=$HOME/projs/chisel

# LInux specific confs
export BROWSER=chromium-chrome
export EDITOR=vim

if [ -d ${HOME}/.signatures ]; then
  ${HOME}/.signature >${HOME}/.signatures/today
  if [ -d ${HOME}/Documents/email ]; then
    cp ${HOME}/.signatures/today ${HOME}/Documents/email/signature
  fi
fi

# BMQ32-T9GP4-63G34-JQC6P-V7Q88

export TERM=xterm
alias tmux="/usr/bin/tmux -2u"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Tyoing tools: tuxtyping ktouch klavaro
# perl -p -i -e 's/color:([^;]*);\s*stroke:[^;]*;/color:$1; stroke:$1;/' <inkscape.svg

# PANDOC
export PATH=$PATH:/home/renau/.cabal/bin

# Ruby
#export PATH=$PATH:/usr/local/rvm/bin # Add RVM to PATH for scripting
#export PATH=$PATH:/home/renau/.rvm/gems/ruby-1.8.7-p371/bin

# Crypt options
#sudo cryptsetup open --type plain /dev/sdb2 huawei
#sudo mount /media/huawei
#sudo umount /media/huawei
#sudo cryptsetup close huawei


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  filedest=`date +".activity/%Y_%m_%d.bash.log"`
  echo `date +"%y/%m/%d %H:%M:%S,"` "," $timer_show "," `history 1 | cut -c7-` >>${HOME}/${filedest}
  unset timer
  unset filedest
}

mkdir -p $HOME/.activity
trap 'timer_start' DEBUG
export PROMPT_COMMAND=timer_stop

# MIPS
export PATH=$PATH:/home/renau/projs/mips/install-mips-img-linux-gnu/bin
export PATH=$PATH:/home/renau/projs/mips/install-mips-img-elf/bin
export PATH=$PATH:/home/renau/projs/mips/depot_tools
# Fortran PATH (breaks gcc)
#export PATH=$PATH:/home/renau/projs/mips/install-mips-img-linux-gnu-gfortran/bin

#PS1='[last: ${timer_show}s][\w]$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# stapler sel main.pdf 1-15 summary.pdf

if [ -f /usr/bin/screenkey ]; then
  alias skey=$(ruby -e "a=(0.7 * `xrandr | grep primary | cut -dx -f1 | grep -oE '[^ ]+$'`).to_i(); puts \"screenkey --g #{a/3}x#{a/3}+#{a}+#{a/10} -s large --font-color green\"")
fi

export MAKEFLAGS="-j $(grep -c ^processor /proc/cpuinfo)"

# bazel
alias bazel-compdb='~/bin/bazel-compilation-database/generate.sh'

# LiveHD
alias lg="./bazel-bin/main/lgshell"

# Google Cloud
# . /etc/bash_completion.d/bazel
# gcloud compute --project "masc-211823" ssh --zone "us-east1-b" "instance-1"
# gcloud compute --project "masc-211823" ssh --zone "us-west1-b" "renau"
alias g.renau="gcloud compute --project masc-211823 ssh --zone us-west1-b renau"

# system76
alias lemu-br="xrandr --output eDP1 --brightness"
alias lemu-suspend="~/.config/i3/lock.sh && sudo pm-suspend"
alias lemu-mirror2='gst-launch0.0 --gst-plugin-load="/home/renau/bin/libgstairplay.so" airplaysrc ! queue ! h264parse ! avdec_h264 max-threads=1 ! autovideosink'
alias lemu-mirror=rpidplay
alias lemu-display-left='xrandr --output DP1 --left-of eDP1'

alias pdf='masterpdfeditor5'

# https://taskwarrior.org/docs/examples.html

#eval "$(starship init bash)"

# powerpoint: presentations21 wpp
# word: textmaker21 wps
# excel: planmaker21 wps
#
# gcalcli  agenda --details all today 23:59
#

