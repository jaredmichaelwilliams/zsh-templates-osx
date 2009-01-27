
          ##################################################################
          ##################################################################
          #                                                                #
          #       $ZDOT/zshrc.d/environment.keybindings.zshall.zsh         #
          #                                                                #
          ##################################################################
          ##################################################################



# File:  $ZDOT/zshrc.d/environment.keybindings.zshall.zsh

# sourced from /etc/zshrc

# Version: 2.0.0

###############################################################################

#  Created by William G. Scott on January 2, 2009.
#  Copyright (c) . All rights reserved.


#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
#    USA
#    
#    cf. URL:   http://www.fsf.org/licensing/licenses/gpl.html
#
###############################################################################


##########################################################################
#
#     Use this for all zsh keybidings AFTER emacs or vi is chosen
#
##########################################################################



if [[ -o interactive ]]; then
    # {{{ Key bindings 

    # zshrc_load_status 'key bindings'

    # command zle -la  produces a list of possible commands
    # command bindkey -L produces a list of keys and their current bindings

    bindkey -s '^X^Z' '%-^M'
    bindkey '^[e' expand-cmd-path
    #bindkey -s '^X?' '\eb=\ef\C-x*'
    bindkey '^[^I' reverse-menu-complete
    bindkey '^X^N' accept-and-infer-next-history

    bindkey '^[P' history-beginning-search-backward
    bindkey '^[N' history-beginning-search-forward
    bindkey '^[b' emacs-backward-word
    bindkey '^[f' emacs-forward-word
    bindkey '^[v' expand-or-complete-prefix

    # Key Up(arrow) and Key Down(arrow)
    bindkey '\e[A'  history-search-backward  # Up
	bindkey '\e[B'  history-search-forward   # Down
    #bindkey '\e[A'  up-line-or-history      # Up
    #bindkey '\e[B'  down-line-or-history    # Down
	
	# Key Right(arrow) and Key Left(arrow)
    bindkey '\e\e[C' forward-word            # Right
    bindkey '\e\e[D' backward-word           # Left
	
    # Key Home and Key End
    # May have to be configured within the terminal emulator
    bindkey '^[[H'  beginning-of-line        # Home
    bindkey '^[[F'  end-of-line              # End
   
    # Key PageUp and Key PageDown
    # Note that PageUp and PageDown and/or
    # ^PageUp and ^PageDown are usually intercepted by the 
    # terminal emulator.  Therefore, you will likely have to
    # configure these within the terminal emulator itself.
    # Typical xterm/linux values
    # bindkey '^[[5~' foo  # PageUp
    # bindkey '^[[6~' bar  # PageDown

    # Fix weird sequence that rxvt produces
    bindkey -s '^[[Z' '\t'

    # alias no=ls  # for Dvorak

    bindkey '^L' push-input

    # }}}
fi
