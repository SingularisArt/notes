#!/bin/bash

key="$1"
node="/usr/bin/node"

root="${HOME}/Documents/notes"
journal_dir="${root}/journal"
today_journal_dir="${journal_dir}/$(date +%F)"

school_notes_root="${HOME}/Documents/notes/school-notes"
current_course="${school_notes_root}/current-course"
papers="${current_course}/papers"
instant_reference="${HOME}/Singularis/third-party-tools/instant-reference/copy-reference.js"
master_pdf="$current_course/master.pdf"

open_xournal () {
  cd "${today_journal_dir}" || exit

  if [ -f "note.xoj" ]; then
    xournal note.xoj;
  else
    touch "note.xoj";
    xournal note.xoj;
  fi
}

compile () {
  cd "${1}" || exit
  pdflatex master.tex && pdflatex master.tex;
  status=$(echo $?)
  if [[ "${status}" == 130 ]]; then
    rofi -e "<span color='red'><b>Failed to compile!</b></span>" -markup
  elif [[ "${status}" == 0 ]]; then
    rofi -e "<span color='green'><b>Compiled successfully!</b></span>" -markup
  fi
}

open_browser () {
  url=$(cat "${current_course}/info.yaml" | shyaml get-value url)
  google-chrome-stable --profile-directory="Profile 2" --app="${url}"
}

open_research_paper() {
  cd "${papers}" || exit
  pdf_file="$(ls . | rofi -i -dmenu)"
  [ -z "$pdf_file" ] && exit 0
  [ -f "$pdf_file" ] && zathura "$(realpath "$pdf_file")" || sensible-browser "https://google.com/search?q=$pdf_file"
}

mkdir -p "${today_journal_dir}";

case ${key} in
  # School Notes
  # Open my current assignment notes
  b ) zathura "${current_course}/assignments/master.pdf" ;;
  # Open my class notes
  o ) zathura "${master_pdf}" ;;
  # Compile my class notes
  O ) compile "${current_course}" ;;
  # List all my inkspace figures
  i ) inkscape-figures edit "${current_course}/figures" ;;
  # Get an instant reference to the current open pdf
  f ) $node "${instant_reference}" ;;
  # Open my current course in the browser
  w ) open_browser ;;
  # Open my info.yaml file
  y ) cd "${current_course}" || exit;
    xfce4-terminal -e "nvim info.yaml" ;;
  # Open the source code
  m ) cd "${current_course}" || exit;
    xfce4-terminal -e "nvim ." ;;
  # Search through my research papers
  p ) open_research_paper ;;

  # Journal
  x ) open_xournal ;;
  r ) xfce4-terminal -e "lf ${today_journal_dir}" ;;
  n ) cd "${journal_dir}" || exit;
    xfce4-terminal -e "nvim $today_journal_dir/note.tex" ;;
  N ) cd "${journal_dir}" || exit;
    xfce4-terminal -e "nvim master.tex" ;;
  j ) zathura "${journal_dir}/master.pdf" ;;
  J ) compile "${journal_dir}" ;;
  M ) cd "${journal_dir}" || exit
    xfce4-terminal -e "nvim ." ;;

  # Custom made scripts
  a ) ~/Documents/notes/school-setup/main.py --rofi-assignments ;;
  c ) ~/Documents/notes/school-setup/main.py --rofi-courses ;;
  l ) ~/Documents/notes/school-setup/main.py --rofi-lectures ;;
  s ) ~/Documents/notes/school-setup/main.py --source-lectures ;;
  A ) ~/Documents/notes/school-setup/main.py --new-assignment ;;
  C ) ~/Documents/notes/school-setup/main.py --new-course ;;
  L ) ~/Documents/notes/school-setup/main.py --new-lecture ;;
esac
