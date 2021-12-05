#!/usr/bin/env sh
#
#                   ╭╮
#                  ╭╯╰╮
#      ╭──┬╮╭┬─╮╭──┼╮╭┼──┬──┬──╮
#      │╭╮││││╭╮┤ ─┤│││╭╮│╭╮││─┤
#      │╰╯│╰╯│││├──││╰┤╭╮│╰╯││─┤
#      ╰─╮├──┴╯╰┴──╯╰─┴╯╰┴─╮├──╯
#      ╭─╯│              ╭─╯│
#      ╰──╯              ╰──╯
#
#
#      gunstage
#      🔫 `git unstage` as a service
#      author: Lucas Larson
#      license: GPLP 1.0 or later (GPL-compatible)
#      https://github.com/LucasLarson/gunstage
#

# enable `git unstage` in addition to `gunstage`
# by adding `bin` directory to `PATH`
# without adding an initial colon `:` to `PATH`
# https://unix.stackexchange.com/a/415028
PATH=${PATH:+${PATH}:}$(command dirname "$0")/bin
export PATH

# keep backwards compatibility
alias gunstage='git-unstage'
