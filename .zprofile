# adding $PATH at the end means anything before it will be searched first.
export PATH=$HOME/bin:/sbin:/opt/local/lib/postgresql93/bin:/usr/sbin:/usr/local/bin:$HOME/.node/bin:$PATH
export PATH=/usr/local/heroku/bin:$PATH
export PATH=/opt/local/android/tools:$PATH
export PATH=/opt/local/android/platform-tools:$PATH
# macports
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$HOME/Library/Python/2.7/bin:$PATH
export MANPATH=$MANPATH:/opt/local/share/man
export PYTHONPATH=/opt/local/lib/python2.6/site-packages:${PYTHONPATH}
export PATH=$HOME/npm/bin:$PATH
#android
#ANDROID_HOME is not set and "android" command not in your PATH. You must fulfill at least one of these conditions.

export PAGER="/usr/bin/less -S"
export SVN_EDITOR='vim -c "set wrap linebreak textwidth=72"'

# crontab
export TMP=/private/tmp

# postgres
export PSQL_EDITOR='vim -c "set ft=sql"'

# colors and such
export LSCOLORS="exgxfxdxcxegedHbagacad"
export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.tbz2=01;31:*.bz=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.svg=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.app=01;32"

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color
