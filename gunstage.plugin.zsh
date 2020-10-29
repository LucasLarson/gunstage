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

gunstage () {( # 🔫 `git unstage` as a service

  # check whether we’re in a Git repository
  # https://stackoverflow.com/a/53809163
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then

    # create a string that we’ll extend and execute below
    unstage="unset unstage"

    # check that this isn’t a new repository
    if git rev-parse HEAD > /dev/null 2>&1; then
      unstage="$unstage; git restore --staged --progress"

    else
      # if the repo is new, it requires different unstaging syntax
      unstage="$unstage; git rm --cached"
    fi

    # check if `gunstage` was called with any arguments, which are
    # a string of file names, or `.` or `*`
    if [ $# -gt 0 ]; then

      # unstage all files named in the string and
      # run the string as a command
      # https://unix.stackexchange.com/q/356534#comment631887_356534
      # https://github.com/koalaman/shellcheck/wiki/SC2145/c11a85d1d22030fbf846eee09a2dce1f896fa5ae#rationale
      eval "$unstage $*"

    else
      # if there were no arguments, we unstage everything in
      # this directory and below
      eval "$unstage" .
    fi

  else
    # we’re not in a Git repository
    # store the failed if as a return status
    # https://github.com/ohmyzsh/ohmyzsh/pull/9238#discussion_r484806772
    unstage=$?

    # if `gunstage` is called from outside a Git repository, provide
    # instructions to use it
    printf 'gunstage must be called from within a git repository\n'
    printf 'create a file and a repository, then stage and gunstage:\n
            touch file && # create a file called '
    printf '\xe2\x80\x9cfile\xe2\x80\x9d \x5c
            git init && # make a git repository if necessary \x5c
            git add file && # stage the file you just created \x5c

            gunstage file # huzzah.\n\n
            gunstage # \xf0\x9f\x94\xab \x60git unstage\x60 as a service
            https://github.com/LucasLarson/gunstage\n\n'
    return "$unstage"
  fi
)}
