#!/bin/sh

set -eu
ALL="X11 shell misc"
CONFIGDIR="${HOME}/.config"
DATADIR="${HOME}/.local/share"
BINDIR="${HOME}/.local/bin"
STOWFLAGS="--verbose --target=${HOME} --dir=$(pwd) --dotfiles"

install(){
	[ -z "$*" ] && echo "Error: No args" && exit 1
	mkdir -pv "$CONFIGDIR" "$BINDIR" "$DATADIR"
	for dir in "$@"; do
		case "$dir" in
			all) echo "$STOWFLAGS" "$ALL" | xargs stow && exit 0;;
			X11|shell|misc) echo "$STOWFLAGS" "$dir" | xargs stow;;
			*) echo "$dir is illegal.";;
		esac
	done
}

uninstall(){
	[ -z "$*" ] && echo "Error: No args" && exit 1
	for dir in "$@"; do
		case "$dir" in
			all) echo "$STOWFLAGS -D" "$ALL" | xargs stow && exit 0;;
			X11|shell|misc) echo "$STOWFLAGS -D" "$dir" | xargs stow;;
			*) echo "$dir is illegal.";;
		esac
	done
}

print_help(){
	echo "Usage: $0 [install|uninstall|help] dirname" >&2
}

[ -z "$*" ] && echo "Error: No args. Type -h for help message." && exit 1
case "$1" in
	install) shift; install "$*" ;;
	uninstall) shift; uninstall "$*" ;;
	help|--help|-h) print_help ;;
	*) echo "Invaild arg. Type -h for help message." >&2 ;;
esac
exit 0
