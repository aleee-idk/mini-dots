#--------------------------------------------------------------------#
#                              Aliases                               #
#--------------------------------------------------------------------#

#fix obvious typo's
alias pdw="pwd"

# File Managment
alias \
	cp='cp -iv' \
	mv='mv -iv' \
	cpr='rsync  -za --partial -hh --info=progress2' \
	mvr='rsync  -za --remove-source-files --partial -hh --info=progress2' \
	sync='rsync -zau --delete --partial -hh --info=progress2' \
	del='trash -i' \
	rmf='rm -rfI' \
	md='mkdir -pv' \
	ls='eza -lh --color=always --icons --git ' \
	la='eza -alh --color=always --icons --git ' \
	ld='eza -la --no-permissions --no-filesize --no-time --no-time --no-user' \
	mkexec='chmod +x'

# Search and Query Files
alias grep="rg --sort path --context 3"

# Quicly update Stuff
alias vi-ssh="vi ~/.ssh/config"

# Query Stuff
alias \
	ip='ip -human -color -brief addr' \
	df="duf --hide special --hide-mp '/boot,/boot/*'" \
	du='dust --reverse' \
	du1='dust --reverse --min-size 1M --depth 1' \
	du2='dust --reverse --min-size 1M --depth 2' \
	du3='dust --reverse --min-size 1M --depth 3' \
	cat='bat'

alias \
	dco='docker compose' \
	dps="docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.State}}\t{{.Status}}\t{{.RunningFor}}'"

alias \
	pco='podman compose' \
	pps="podman ps --format 'table {{.ID}}\t{{.Names}}\t{{.State}}\t{{.Status}}\t{{.RunningFor}}'"

alias tm="fzf-tmux-sessions"

# Misc
alias \
	reload='exec $SHELL -l'

# Specific Mac overrides
if [[ "$OSTYPE" != 'linux-gnu' ]]; then
fi

#--------------------------------------------------------------------#
#                               Global                               #
#--------------------------------------------------------------------#

alias -g NULL='> /dev/null 2>&1'
