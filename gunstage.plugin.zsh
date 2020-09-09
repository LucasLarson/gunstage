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

gunstage () { # 🔫 `git unstage` as a service
  # check whether we’re in a Git repository
  # https://stackoverflow.com/a/53809163
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then

    # check that this isn’t a new repository
    if git rev-parse HEAD > /dev/null 2>&1; then
      unstage="git restore --staged --progress"
    else
      # if the repo is new, it requires different unstaging syntax
      unstage="git rm --cached"
    fi

    # check if `gunstage` was called with any arguments, which are
    # file names
    if [ $# -gt 0 ]; then

      # create an empty array for the file name arguments
      arguments=()
      for index in "$@"; do

        # for each file name, one at a time, unstage it
        # running a string as a command
        # https://unix.stackexchange.com/q/356534#comment631887_356534
        eval "$unstage" "${index[@]}"
        arguments+=("$index")
      done

    # if there were no gunstage arguments, we unstage everything in this
    # directory and below
    else
      eval "$unstage" .
    fi

  else
    # if `gunstage` is called from outside a Git repository, provide
    # instructions to use it
    printf 'gunstage must be called from within a git repository\n'
    printf 'create a file and a repository, then stage and gunstage:\n
            touch file && # create a file called '
    printf '\xe2\x80\x9cfile\xe2\x80\x9d \x5c
            git init && # make a git repository if necessary \x5c
            git add file && # stage the file you just created \x5c
            gunstage file # huzzah.\n'
    exit 1
  fi
}
