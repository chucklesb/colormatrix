#!/bin/bash

# colormatrix.sh - display the color scheme on terminal

# Define colors
COLOR_RESET='\033[0m'
FG_COLORS=($(seq 30 37) $(seq 90 97))
BG_COLORS=($(seq 40 47) $(seq 100 107))

# Functions
main() {
  reset_colors
  print_header
  print_color_matrix
  reset_colors
}

reset_colors() {
  echo -en "${COLOR_RESET}"
}

print_header() {
  for bg in "${BG_COLORS[@]}"; do
    printf "%4d  " "${bg}"
  done
  echo
}

print_color_matrix() {
  for fg in "${FG_COLORS[@]}"; do
    for bg in "${BG_COLORS[@]}"; do
      printf "\033[%d;%dm %3d  \033[0m" "${fg}" "${bg}" "${fg}"
    done
  echo
  done
}

main "$@"; exit

