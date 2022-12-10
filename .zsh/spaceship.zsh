########################
### SPACESHIP CONFIG ###
########################

### remove sections
spaceship remove time
spaceship remove hg
spaceship remove package
spaceship remove node
spaceship remove bun
spaceship remove deno
spaceship remove ruby
spaceship remove python
spaceship remove elm
spaceship remove elixir
spaceship remove xcode
spaceship remove swift
spaceship remove golang
spaceship remove perl
spaceship remove php
spaceship remove rust
spaceship remove haskell
spaceship remove scala
spaceship remove kotlin
spaceship remove java
spaceship remove lua
spaceship remove dart
spaceship remove julia
spaceship remove crystal
spaceship remove docker
spaceship remove aws
spaceship remove gcloud
spaceship remove venv
spaceship remove dotnet
spaceship remove ocaml
spaceship remove vlang
spaceship remove zig
spaceship remove purescript
spaceship remove erlang
spaceship remove kubectl
spaceship remove ansible
spaceship remove terraform
spaceship remove pulumi
spaceship remove ibmcloud
spaceship remove gnu_screen
spaceship remove exec_time
spaceship remove async
spaceship remove battery
spaceship remove jobs

### prompt order
SPACESHIP_PROMPT_ORDER=(
  user           # Username section
  host		 # Host section
  dir            # Current directory section
  git            # Git section (git_branch + git_status)
  conda          # conda virtualenv section
  docker_compose # Docker section
  nix_shell      # Nix shell
  line_sep       # Line break
  exit_code      # Exit code section
  sudo           # Sudo indicator
  char           # Prompt character
)

### section edits

# prompt section
SPACESHIP_PROMPT_ADD_NEWLINE=true # add newline before new prompt for clarity
SPACESHIP_PROMPT_SUFFIXES_SHOW=true # show section suffixes

# user section
SPACESHIP_USER_SHOW=always # always show the user
SPACESHIP_USER_SUFFIX="@" # put @ between user and host
SPACESHIP_PROMPT_USER_COLOR=green # make user color non-ugly

# host section
SPACESHIP_HOST_SHOW=always # always show the hostname
SPACESHIP_HOST_PREFIX="" # do not add a prefix before the hostname

# dir section
SPACESHIP_DIR_PREFIX="" # do not add a prefix before the dir name
SPACESHIP_DIR_TRUNC=0 # show full dir path
