#!/usr/bin/env zsh
#
#                   ╭╮
#                  ╭╯╰╮
#      ╭━━┳╮╭┳━╮╭━━╋╮╭╋━━┳━━┳━━╮
#      ┃╭╮┃┃┃┃╭╮┫ ━┫┃┃┃╭╮┃╭╮┃┃━┫
#      ┃╰╯┃╰╯┃┃┃┣━━┃┃╰┫╭╮┃╰╯┃┃━┫
#      ╰━╮┣━━┻╯╰┻━━╯╰━┻╯╰┻━╮┣━━╯
#      ╭━╯┃              ╭━╯┃
#      ╰━━╯              ╰━━╯
#
#
#      gunstage
#      🔫 `git unstage` as a service
#      author: Lucas Larson
#      license: GPLP 1.0 or later (GPL compatible)
#

# git will let you turn any executable into a git command. If you
# name it 'git-xyz', it will get called when the user types 'git xyz'
#
# Make gunstage into a full-on 'git unstage' command by sticking it into
# an executable and putting it in the user's path.

# Add our plugin's bin directory to user's path
PLUGIN_D=$(dirname "$0")
export PATH="${PATH}:${PLUGIN_D}/bin"

# Be backwards compatible.
alias gunstage='git-unstage'
