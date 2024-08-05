# SSH tunnel
ssh-tunnel() {

	local_port=$1 && shift
	remote_port=$1 && shift
	server=$1 && shift

	echo "Starting SSH Tunnel for $server"

	ssh -N -L "$local_port":localhost:"$remote_port" "$server"
}

# quick wordpress in docker
dwps() {
	image_name="wordpress-development"
	container_build_path="$HOME/Repos/Private/docker-services/wordpress"
	original_path="$PWD"

	if [[ "$(docker images -q $image_name 2>/dev/null)" == "" ]]; then
		cd "$container_build_path"
		docker build --tag "$image_name" .
		cd "$original_path"
	fi

	docker run -d --rm -p 3000:80 --user 1000:1000 -v "$PWD":/var/www/html --name "$image_name" "$image_name"
}

## Create python venv
pvenv() {
	[[ -n $VIRTAUL_ENV ]] && echo "Virtual enviroment already sourced" && return

	dir=${1:-venv}

	[[ ! -d $dir ]] && echo "Creating virtual enviroment..." && python -m venv $dir

	source "$dir/bin/activate"
}

# Print bottlenecks
profzsh() {
	shell=${1-$SHELL}
	ZPROF=true $shell -i -c exit
}

# Pretty Help
alias bathelp='bat --plain --language=help'
help() {
	"$@" --help 2>&1 | bathelp
}

fzf-jq() {
	echo '' | fzf --print-query --preview="jq -r {q} <$@"
}

function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Zellij
function zr() { zellij run --name "$*" -- zsh -ic "$*"; }
function zrf() { zellij run --name "$*" --floating -- zsh -ic "$*"; }
function ze() { zellij edit "$*"; }
function zef() { zellij edit --floating "$*"; }
