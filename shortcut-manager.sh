#!/bin/bash

key="$1"
vim="nvim"
node="/usr/bin/node"
python="/usr/bin/pyhon3.10"

root="${HOME}/Documents/school-notes"
current_course="$root/current-course"
journal_dir="$root/journal"
today_journal_dir="$journal_dir/$(date +%F)"
paper_location="$root/papers"
instant_reference="${HOME}/Singularis/third-party-tools/instant-reference/copy-reference.js"
master_pdf="$current_course/master.pdf"
papers="${HOME}/Documents/school-notes/current-course/papers"

open_xournal () {
  cd $today_journal_dir; 

  if [ -f "note.xoj" ]; then
    xournal note.xoj;
  else
    touch "note.xoj";
    xournal note.xoj;
  fi
}

compile () {
  cd $1;
  pdflatex master.tex && pdflatex master.tex;
  status=$(echo $?)
  if [[ $status == 130 ]]; then
    rofi -e "<span color='red'><b>Failed to compile!</b></span>" -markup
  elif [[ $status == 0 ]]; then
    rofi -e "<span color='green'><b>Compiled successfully!</b></span>" -markup
  fi
}

open_browser () {
  url=$(cat ${current_course}/info.yaml | shyaml get-value url)
  google-chrome-stable --profile-directory="Profile 2" --app=$url
}

open_research_paper() {
  cd ~/Documents/school-notes/current-course/papers
  pdf_file="$(ls . | rofi -i -dmenu)"
  [ -z "$pdf_file" ] && exit 0
  [ -f "$pdf_file" ] && zathura "$(realpath "$pdf_file")" || sensible-browser "https://google.com/search?q=$pdf_file"
}

mkdir -p $today_journal_dir;

case ${key} in
  # School Notes
  b ) zathura $current_course/assignments/master.pdf ;;
  o ) zathura $master_pdf ;;
  O ) compile $current_course ;;
  i ) inkscape-figures edit $current_course/figures ;;
  f ) $node $instant_reference ;;
  w ) open_browser ;;
  y ) cd $current_course;
    xfce4-terminal -e "nvim info.yaml" ;;
  m ) cd $current_course;
    xfce4-terminal -e "nvim ." ;;

  # Journal
  x ) open_xournal ;;
  r ) xfce4-terminal -e "lf $today_journal_dir" ;;
  n ) cd $journal_dir;
    xfce4-terminal -e "nvim $today_journal_dir/note.tex" ;;
  N ) cd $journal_dir;
    xfce4-terminal -e "nvim master.tex" ;;
  j ) zathura $journal_dir/master.pdf ;;
  J ) compile $journal_dir ;;
  M ) cd $journal_dir;
    xfce4-terminal -e "nvim ." ;;

  # Custom made scripts
  a ) ~/Singularis/local/school/main.py --rofi-assignments ;;
  c ) ~/Singularis/local/school/main.py --rofi-courses ;;
  l ) ~/Singularis/local/school/main.py --rofi-lectures ;;
  s ) ~/Singularis/local/school/main.py --source-lectures ;;
  A ) ~/Singularis/local/school/main.py --new-assignment ;;
  C ) ~/Singularis/local/school/main.py --new-course ;;
  L ) ~/Singularis/local/school/main.py --new-lecture ;;

  # Paper searching
  p ) open_research_paper ;;
esac
