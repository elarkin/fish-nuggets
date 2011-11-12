for p in /usr/bin /usr/local/bin ~/bin
	if test -d $p
		set -x PATH $p $PATH
	end
end

set fish_greeting ""
set -x CLICOLOR 1

set -x BROWSER google-chrome

set -l user (whoami)

# user specific prefs go here.
touch ~/.config/fish/$user.fish
. ~/.config/fish/$user.fish
