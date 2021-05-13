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
export PATH=${PATH}:$(dirname "$0")/bin

# keep backwards compatibility
alias gunstage='git-unstage'
