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
PATH="$(command dirname "$0")/bin${PATH:+:${PATH-}}"
export PATH

# keep backwards compatibility
alias gunstage='git-unstage'
