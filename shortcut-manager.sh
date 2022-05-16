#!/bin/bash

key="$1"
vim="nvim"
node="/usr/bin/node"
python="/usr/bin/pyhon3.10"

root="${HOME}/Documents/school-notes"
current_course="$root/current-course"
notes_dir="$root/notes"
today_notes_dir="$notes_dir/$(date +%F)"
paper_location="$root/papers"
instant_reference="${HOME}/Singularis/third-party-tools/instant-reference/copy-reference.js"
master_pdf="$current_course/master.pdf"

open_xournal () {
  cd $today_notes_dir; 

  if [ -f "note.xoj" ]; then
    xournal note.xoj;
  else
    touch "note.xoj";
    xournal note.xoj;
  fi
}

open_browser () {
  url=$(cat ${current_course}/info.yaml | shyaml get-value url)
  i3-sensible-browser $url
}

mkdir -p $today_notes_dir;

case ${key} in
  r ) xfce4-terminal -e "lf $today_notes_dir" ;;
  n ) cd $notes_dir;
    xfce4-terminal -e "nvim $today_notes_dir/note.tex" ;;
  z ) zathura $notes_dir/master.pdf ;;
  b ) zathura $current_course/assignments/master.pdf ;;
  o ) zathura $master_pdf ;;
  x ) open_xournal ;;
  i ) inkscape-figures edit $current_course/figures ;;
  f ) $node $instant_reference ;;
  w ) open_browser ;;
  y ) cd $current_course;
    xfce4-terminal -e "nvim info.yaml" ;;

  a ) ~/Singularis/local/school/main.py --rofi-assignments ;;
  c ) ~/Singularis/local/school/main.py --rofi-courses ;;
  l ) ~/Singularis/local/school/main.py --rofi-lectures ;;
  m ) ~/Singularis/local/school/main.py --commands ;;
  p ) ~/Singularis/local/school/main.py --projects ;;
  A ) ~/Singularis/local/school/main.py --new-assignment ;;
  C ) ~/Singularis/local/school/main.py --new-course ;;
  L ) ~/Singularis/local/school/main.py --new-lecture ;;
  P ) ~/Singularis/local/school/main.py --change-path ;;
esac
