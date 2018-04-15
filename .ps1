#!/bin/bash

BLACK='\e[30m'
CYAN='\e[36m'
RED='\e[31m'
REDFLASH='\e[31;5m'
GREEN='\e[32m'
YELLOW='\e[33m'
WHITE='\e[37m'
BACKBLACK='\e[40m'
BACKCYAN='\e[46m'
BACKRED='\e[41m'
BACKGREEN='\e[42m'
BACKYELLOW='\e[43m'
BACKWHITE='\e[47m'
NONE='\e[0m'
DEFAULT=$CYAN

function git_ps1(){
  __git_ps1=$(git branch 2> /dev/null | awk '/^*/{print $2}')
  if [[ ! -z $__git_ps1 ]]; then
    __git_ps1="$DEFAULT($RED$__git_ps1$DEFAULT)$NONE"
  fi
}

function searchdir() {
  local _dir=$(realpath $1)
  if [ -f $_dir/.env/bin/activate ]; then
    dir=$_dir
  elif [ $_dir != '/' ]; then
    searchdir $_dir/..
  fi
}

function check_env(){
  if [ -z "$dir" ]; then
    searchdir .
  fi
  if [ -n "$dir" ]; then
    source $dir/.env/bin/activate
    export PS1=$_OLD_VIRTUAL_PS1
    local name="pyenv"
    __venv="$DEFAULT($GREEN$name$DEFAULT) $NONE"
  fi
 
  case $(pwd) in
    $dir/*)
      ;;
    $dir)
      ;;
    *)
      unset dir
      __venv=""
      deactivate 2> /dev/null
    ;;
  esac
}

function battery(){
  local level=$(cat /sys/class/power_supply/BAT1/capacity)
  local status=$(cat /sys/class/power_supply/BAT1/status)

  local color=$DEFAULT

  # PORCENT COLOR
  if [ $level -lt 30 ]; then
    if [ $status != "Charging" ]; then
      color=$REDFLASH
    else
      color=$RED
    fi
  elif [ $level -lt 60 ]; then
    color=$YELLOW
  elif [ $status = "Charging" ]; then
    color=$WHITE
  else
    color=$GREEN
  fi
  # CHARGER STATUS
  if [ $status != "Charging" ]; then
    __level="$color$level$NONE"
  else
    __level="$color\u26a1$level$NONE"
  fi
}

function __command_color(){
  echo -e $__git_ps1 $__venv $__level
}

export PROMPT_COMMAND="$PROMPT_COMMAND;git_ps1;check_env;battery"

export PS1='[\e[36;06m\w $(__command_color)\e[0m] \n\$ '
