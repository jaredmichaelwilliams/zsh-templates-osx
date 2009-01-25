
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

    bindkey '\e\e[C' forward-word
    bindkey '\e\e[D' backward-word
    #bindkey '\e[A'  up-line-or-history
    #bindkey '\e[B'  down-line-or-history
    bindkey '\e[A'  history-search-backward 
    bindkey '\e[B'  history-search-forward
    #bindkey '^[p' history-beginning-search-backward
    #bindkey '^[n' history-beginning-search-forward

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

    bindkey '^[[H'  beginning-of-line       # Home
    bindkey '^[[F'  end-of-line             # End

    # Fix weird sequence that rxvt produces
    bindkey -s '^[[Z' '\t'

    # alias no=ls  # for Dvorak

    bindkey '^L' push-input

    # }}}
fi
