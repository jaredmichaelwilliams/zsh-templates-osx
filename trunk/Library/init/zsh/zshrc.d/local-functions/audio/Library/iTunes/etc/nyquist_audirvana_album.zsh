#!/bin/zsh -f


# shell script name: nyquist.zsh  
# Use iTunes inteface to play selected tracks in Audirvana, an open-source
# audiophile music player application that properly adjusts the sampling
# frequency automatically.  The main utility of this hack is it allows one
# to use Apple's iPod/iPad/iPhone Remote.app to initiate playback.  Currently,
# once playback is initiated, it is beyond control of Remote.app, but using
# a standard Apple Remote Control device permits further user interaction.

# Audirvana can be obtained here:  http://code.google.com/p/audirvana/

version="3.1.0"


# Put this file in /Library/iTunes/etc
# and the accompanying Plug-in into /Library/iTunes/iTunes Plug-ins 
# or ~/Library/iTunes/iTunes Plug-ins
#  Open iTunes and set the visualizer to use "iTunesPlugIn".


###############################################################################
 
#  Created by William G. Scott on Sept 15, 2010. Revised to use Audirvana
#  instead of GUI scripting of Audio MIDI Setup and afplay, on Feb 9, 2011.
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

# Many thanks to "red menace" of the Apple bulletin board community, Bob Stern, and
# several others for helpful suggestions and input.

# If it is a video or protected file, bail from this script and hand it back
# to the iTunes player. Otherwise, pause iTunes, and play with Audirvana.

trackkind=$(osascript <<-eof1
tell application "iTunes" 
set isProtected to kind of the current track
    if isProtected is "Protected AAC audio file" then
    return 42
    end if
    set isVideo to video kind of current track
    if isVideo is  none then
        pause
    else
        return 1
    end if
end tell
eof1
)

if [[ $trackkind == 1 || $trackkind == 42 ]];then
    return 0
fi

osascript <<-eof2
 
tell application "iTunes"
	set trackName to name of current track
	set CurrentAlbum to album of current track
    if trackName is "That's All Folks" then
        tell application "Audirvana" to quit
    end if
	pause -- Now that we have the info, stop playing iTunes and use afplay after checking sample rate match
	set filePath to location of current track
end tell

-- here we use Audirvana rather than iTunes to play the track
set theTune to POSIX path of filePath
tell application "Audirvana" 
    open theTune
end tell

tell application "iTunes"
	next track
	if CurrentAlbum is not album of current track
		tell application "System Events" to set visible of process "iTunes" to false  -- hide iTunes
	    return -- prevents selection of multiple albums (incompatible with playlists)
	end if
	if  trackName is name of current track then
	    tell application "System Events" to set visible of process "iTunes" to false  -- hide iTunes
	    return -- prevents endless repeat of the last song on the playlist
	end if
    play
	pause
end tell


eof2
return 0

