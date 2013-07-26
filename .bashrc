#
# Command History settings
#
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend

# Combine multiline commands into one in history
shopt -s cmdhist

# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

export EC2_HOME=~/bin/ec2/
export JAVA_HOME=/cygdrive/C/Program\ Files/Java/jdk1.7.0_01/
export PATH=$PATH:/cygdrive/c/Program\ Files\ \(x86\)/Android/android-sdk/platform-tools:/cygdrive/C/Program\ Files/Java/jdk1.7.0_01/bin/:$EC2_HOME/bin:/cygdrive/c/Program\ Files\ \(x86\)/Puppet\ Labs/Puppet/bin

#
# Colors + alias settings for directory listings 
#
LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
export LS_COLORS

alias ls='ls -F --color --show-control-chars'
alias ll='ls -al -F --color --show-control-chars'

#
# Use powerline for command line
#
function _update_ps1() {
	export PS1="$( ~/scripts/console-code/powerline-shell/powerline-shell.py $?)"
}
export PROMPT_COMMAND="_update_ps1"

#
# sets AWS to SV
#
amzsv () {
	export EC2_PRIVATE_KEY=~/.ec2/.pem
	export EC2_CERT=~/.ec2/.pem
	export EC2_URL=https://ec2.us-west-1.amazonaws.com
	echo "Set Amazon API Tools to SV"
}

#
# Set the window title
#
function title {
   PROMPT_COMMAND="echo -ne \"\033]0;$1 \007\""
}

#
# Serve some html from the current directory
#
serve (){
	python -m SimpleHTTPServer
}

#
# Use threaded http instance
#
servem () {
	python ~/scripts/servem.py	
}

extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xjf $1		;;
			*.tar.gz)	tar xzf $1		;;
			*.bz2)		bunzip2 $1		;;
			*.rar)		rar x $1		;;
			*.gz)		gunzip $1		;;
			*.tar)		tar xf $1		;;
			*.tbz2)		tar xjf $1		;;
			*.tgz)		tar xzf $1		;;
			*.zip)		unzip $1		;;
			*.Z)		uncompress $1	;;
			*)			echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

up () {
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

