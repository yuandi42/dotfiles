#!/bin/sh

set -eu
ALL="X11 shell misc"
STOWFLAGS="--verbose --target=${HOME} --dir=$(dirname "${0}") --dotfiles"

print_help(){
	echo "Usage: $(basename "${0}") [install|uninstall|help] [$(echo "$ALL"|tr ' ' '|')|all]" >&2
}

install(){
	[ -z "$*" ] && print_help && exit 1
	for dir in "$@"; do
		if echo "all All ALL"|grep -Fq "$dir"; then
			echo "$STOWFLAGS" "$ALL" | xargs stow && exit 0
		elif echo "$ALL"|grep -Fq "$dir"; then
			echo "$STOWFLAGS" "$dir" | xargs stow
		else
			echo "$dir is illegal."
		fi
	done
}

[ $# -eq 0 ] && print_help && exit 1

case "$1" in
	install|i) shift; install "$@" ;;
	uninstall|u) shift;  STOWFLAGS="$STOWFLAGS -D"; install "$@" ;;
	help|h|--help|-h) print_help ;;
	*) print_help ;;
esac
exit 0
