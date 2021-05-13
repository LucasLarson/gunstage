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
PLUGIN_D=$(dirname "$0")
export PATH=${PATH}:${PLUGIN_D}/bin
unset PLUGIN_D

# Be backwards compatible.
alias gunstage='git-unstage'
