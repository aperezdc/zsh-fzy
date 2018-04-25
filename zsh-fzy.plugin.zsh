#! /bin/zsh
#
# zsh-fzy.plugin.zsh
# Copyright (C) 2018 Adrian Perez <aperez@igalia.com>
#
# Distributed under terms of the MIT license.
#

# Default fzy flags.
declare -a ZSH_FZY_FLAGS=()

command -v fzy >/dev/null
if [[ $? -ne 0 ]]; then
    echo 'fzy is not installed. See https://github.com/jhawthorn/fzy'
    exit 1
fi

if [[ -n ${ZSH_FZY_TMUX} ]] ; then
	ZSH_FZY_TMUX="${0:A:h}/fzy-tmux"
fi

__fzy_cmd () {
	emulate -L zsh
	if [[ -n ${TMUX} && -n ${ZSH_FZY_TMUX} ]] ; then
		"${ZSH_FZY_TMUX}" -- "${ZSH_FZY_FLAGS[@]}" "$@"
	else
		fzy "${ZSH_FZY_FLAGS[@]}" "$@"
	fi
}

__fzy_fsel () {
	command find -L . \( -path '*/\.*' -o -fstype dev -o -fstype proc \) -prune \
			-o -type f -print \
			-o -type d -print \
			-o -type l -print 2> /dev/null | sed 1d | cut -b3- | \
		__fzy_cmd -p 'file> ' | while read -r item ; do
		echo -n "${(q)item}"
	done
	echo
}

fzy-file-widget () {
	LBUFFER="${LBUFFER}$(__fzy_fsel)"
	zle redisplay
}

fzy-cd-widget () {
	cd "${$(command find -L . \( -path '*/\.*' -o -fstype dev -o -fstype proc \) -prune \
		-o -type d -print 2> /dev/null | sed 1d | cut -b3- | __fzy_cmd -p 'cd> '):-.}"
	zle reset-prompt
}

fzy-history-widget () {
	emulate -L zsh
	local S=$(fc -l -n -r 1 | __fzy_cmd -p 'hist> ' -q "${LBUFFER//$/\\$}")
	if [[ -n $S ]] ; then
		LBUFFER=$S
	fi
	zle redisplay
}

zle -N fzy-file-widget
zle -N fzy-cd-widget
zle -N fzy-history-widget
