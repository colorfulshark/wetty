#!/bin/bash

# $1: key
# $2: default value
get_config() {
	local key=$1
	local def=$2
	local val=$(snapctl get $key)
	if [ -z "$val" ]; then
		val=$def
	fi
	echo "$val"
}

ssh_host=$(get_config 'ssh.host' '127.0.0.1')
ssh_port=$(get_config 'ssh.port' '22')
server_base=$(get_config 'server.base' '/wetty/')
server_host=$(get_config 'server.host' '0.0.0.0')
server_port=$(get_config 'server.port' '3000')
server_title=$(get_config 'server.title' 'WeTTY - The Web Terminal Emulator')

wetty --force-ssh \
	--ssh-host "$ssh_host" \
	--ssh-port "$ssh_port" \
	--base "$server_base" \
	--host "$server_host" \
	--port "$server_port" \
	--title "$server_title" &
