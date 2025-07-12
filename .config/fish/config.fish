#source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

alias vim="nvim"
alias vi="vim"


# TTY Colors
#eval (dircolors -c ~/.dircolors | string replace 'LS_COLORS=' 'set -x LS_COLORS ' | string replace ';$' '' )

set -Ux TERMINAL alacritty
set -x GOPROXY direct
set -x XCOMPOSEFILE $HOME/.XCompose
set -Ux PATH $HOME/Coding/nim/bin $PATH

set fish_greeting ""


function cff
    clear
    fastfetch
end

function prompt_pwd
	echo (string replace --regex "^$HOME" "~" (pwd))
end

function fish_prompt
	set -l last_status $status

	set -l stat
	if test $last_status -ne 0
		set stat (set_color red)"[$last_status]" (set_color normal)
	end
    string join '' -- (set_color --bold white) (prompt_pwd) $stat ' > ' (set_color normal)
end

fish_add_path /home/offlinebot/.spicetify
fish_add_path /home/offlinebot/.modular/bin

