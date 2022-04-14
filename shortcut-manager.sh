#!/bin/bash

key="$1"
vim="nvim"
node="/usr/bin/node"
python="/usr/bin/pyhon3.10"

root="${HOME}/Documents/school-notes"
notes_dir="$root/notes"
today_notes_dir="$notes_dir/$(date +%F)"
paper_location="$root/papers"
instant_reference="Singularis/third-party-tools/instant-reference/copy-reference.js"
master_pdf="$root/current-course/master.pdf"

open_xournal () {
  cd $today_notes_dir; 

  if [ -f "note.xoj" ]; then
    xournal note.xoj;
  else
    touch "note.xoj";
    xournal note.xoj;
  fi
}

mkdir -p $today_notes_dir;

case ${key} in
  p ) cd $paper_location;
    pdf_file="$(ls . | rofi -dmenu)";
    string="${pdf_file// /+}"
    url="https://google.com/search?q=$string"
    [ -z "$pdf_file" ] && exit 0;
    [ -f "$pdf_file" ] && zathura "$(realpath "$pdf_file")" || google-chrome-stable --new-window $url ;;
  r ) xfce4-terminal -e "lf $today_notes_dir" ;;
  n ) cd $notes_dir;
    xfce4-terminal -e "nvim $today_notes_dir/note.tex" ;;
  z ) zathura $notes_dir/master.pdf ;;
  o ) zathura $master_pdf ;;
  x ) open_xournal ;;
  f ) $node $instant_reference ;;
  c ) ~/Singularis/local/school/main.py --change-course ;;
  l ) ~/Singularis/local/school/main.py --lessons ;;
  m ) ~/Singularis/local/school/main.py --commands ;;
  w ) ~/Singularis/local/school/main.py --new-lesson ;;
  j ) ~/Singularis/local/school/main.py --projects ;;
esac
