starship init fish | source
set -U fish_greeting


set -x PATH $HOME/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/eww/target/release $PATH

# ohmyposh init fish --config ~/.config/fish/theme2.json | source
# if status is-interactive
#     # Commands to run in interactive sessions can go here
    
# end


function yy
	set tmp (mktemp -t "yazi-cwd.XXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end


# pnpm
set -gx PNPM_HOME "/home/saurabh/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Created by `pipx` on 2025-02-23 07:58:02
set PATH $PATH /home/saurabh/.local/bin
