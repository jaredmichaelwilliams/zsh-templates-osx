

					#################################################
					#################################################
					#                                               #
					#              $ZDOT/aliases.local              #
					#                                               #
					#################################################
					#################################################
					
					
					

if [[ -o interactive ]]; then

	###############################################################################
	#                                                                             #
	#                                                                             #
	#      Local aliases start here.  You will probably want to edit this.        #
	#                                                                             #
	#                                                                             #
	###############################################################################

	# PAGER and MANPAGER variables use "less -is" by default.  I've added in the -e
	# so that the pager quits when it reaches the end. This may annoy you.  If so, 
	# just comment out (or change) what you see below.

	#  export PAGER="less -ise"
	   export MANPAGER="less -ise"

	# If a command is returned complaining of insufficient priviledges, this 
	# evocatively-named command executes the previous command string, but now with 
	# a sudo prefix:

	if [[ -x /usr/bin/sudo || -x /bin/sudo || -x /usr/local/bin/sudo || -x /usr/X11/bin/sudo ]];then
	    alias fu='sudo $( fc -ln -1)'
	fi

	###############################################################################

	# Sometimes the zsh correction behavior is irritating:
		alias mkdir='nocorrect mkdir'
		alias mv='nocorrect mv'
		alias cp='nocorrect cp'
		alias touch='nocorrect touch'
		alias ln='nocorrect ln'

	###############################################################################

	# xpymol in fink (since "pymol" function maps to MacPyMOL)

	if [[ -x $SWPREFIX/lib/pymol-py25/bin/pymol ]];then
	    alias xpymol="$SWPREFIX/lib/pymol-py25/bin/pymol"
	elif [[ -x $SWPREFIX/lib/pymol-py24/bin/pymol ]];then
		alias xpymol="$SWPREFIX/lib/pymol-py24/bin/pymol"
	elif [[ -x $SWPREFIX/lib/pymol-py26/bin/pymol ]];then
		alias xpymol="$SWPREFIX/lib/pymol-py26/bin/pymol"
	fi

	###############################################################################

	# rxvt settings to look like aqua (this might be system-dependent)

	if [[ -x $SWPREFIX/bin/rxvt ]];then
		alias rxvt='rxvt -bg black -fg white -cr grey -ls -geometry 80X25 -colorBD yellow \
	       -troughColor grey -font 9x15 -sr -scrollColor RoyalBlue3 -internalBorder 5 &'
	fi

	###############################################################################

	# Some common aliases:
		alias back='cd "$OLDPWD";pwd'
		# alias rehash='hash -r'  		# Now a shell built-in
		alias purge="rm -i *~"    		# Remove emacs guano
		alias rm="rm -i"		  		# Some people hate this, but it saved my arse many times.
	
		if [[ $(which dt) == "dt not found" ]];then
			alias dt="cd $HOME/Desktop; pwd"  	# Shortcut to the desktop
		fi

		if [[ -n $(which xwit | head -n 1) ]];then
		    alias popx='xwit -pop -id'
		    alias iconx='xwit -iconify -id'
		fi

		alias monitor="netstat | grep -v localhost | grep -v stream | grep -v dgram"

		# alias ls="ls -hF"
		alias firewall_off="sudo ipfw flush"

		# user-friendly version of zmv
		alias mmv='noglob zmv -W'

	###############################################################################
	# These are OSX-specific:  ####################################################

	if [[  $(uname) == Darwin  ]]; then
	
		# alias firewall_on="sudo ipfw /etc/firewall.conf"
	    # alias top="open -a Activity\ Monitor"
	    alias safari="open -a Safari"
	    # alias photoshop="open -a Adobe\ Photoshop\ 7.0"
	    alias netscape="open -a netscape"
		alias calc="open -a calculator"
		# Add a transparent movable (and removable) space to the dock and restart it
		alias add_dock_space="defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}' ; killall Dock"
	
		# Fink specific
		if [[ -d /sw || -x $(which fink) ]]; then	
		    alias finkup='fink -y selfupdate ; fink -y update-all'
			alias aptup="sudo apt-get update; sudo apt-get dist-upgrade"
			alias flgrep='fink list -i'  
		fi
	
		# Darwinports specific
		if [[ -d /opt/local/darwinports || -x $(which port) ]]; then
		    alias portup='sudo port -d selfupdate; sudo port -d upgrade installed'    
		fi
	fi

	###############################################################################


	###############################################################################
	######### For my cd? command ##################################################

		# A synonym for "dirstack" that has to be an alias; naming a function 
		# with a special character doesn't work (or is more trouble than it is worth).
		# gdirs is the corresponding GUI version of this, but works only on Mac OS X for now.
		alias cd\?="dirdump; typeset -U dirs_shared; dirstack"

	###############################################################################
	# uncomment this for debugging purposes or verbose startup:
	# echo "Local system aliases for zsh are now set"


fi