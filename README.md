# My Personal Notes

## File structure

```
~/Documents/notes/.
|
├── Grade-9
│   ├── semester-1
│   └── semester-2
├── Grade-10
│   ├── semester-1
│   ├── semester-2
│   │   ├── hs-algebra-2
│   │   │   ├── bibliography.bib
│   │   │   ├── conclusion.tex
│   │   │   ├── copyright.tex
│   │   │   ├── info.yaml
│   │   │   ├── master.tex
│   │   │   ├── preface.tex
│   │   │   ├── summary.tex
│   │   │   ├── unit-1
│   │   │   │   ├── lesson-1.tex
│   │   │   │   ├── ...
│   │   │   │   ├── lesson-35.tex
│   │   │   │   ├── ...
│   │   │   │   ├── figures
│   │   │   │   │   ├── graphing-vectors.pdf
│   │   │   │   │   ├── graphing-vectors.pdf_tex
│   │   │   │   │   ├── graphing-vectors.svg
│   │   │   │   │   └── ...
│   │   │   ├── unit-2
│   │   │   │   ├── lesson-1.tex
│   │   │   │   ├── ...
│   │   │   │   ├── lesson-35.tex
│   │   │   │   ├── ...
│   │   │   │   ├── figures
│   │   │   │   │   ├── rate-of-change.pdf
│   │   │   │   │   ├── rate-of-change.pdf_tex
│   │   │   │   │   ├── rate-of-change.svg
│   │   │   │   │   └── ...
│   │   │   ├── note-taking-class.cls
│   │   │   └── preamble.tex
├── Grade-11
│   ├── semester-1
│   └── semester-2
├── Grade-12
│   ├── semester-1
│   └── semester-2
├── current-course
```

`current-course` is a [symbolic link](https://en.wikipedia.org/wiki/Symbolic_link) that points to one of the classes in the current grade/current semester. For example, if I am in grade 9 and semester 2 and I am working on math, it points me to [honors algebra 2](Grade-10/semester-2/hs-algebra-2). I use scripts to help me maintain all of my notes, which you can find them [here](https://github.com/SingularisArt/Singularis/tree/master/local/scripts).

The `note-taking-class.cls` file is a class file that I use when taking notes.

The `preamble.tex` is a file that I use in every single `master.tex`. It has all of my default packages, commands, setup, etc.

Contents of `info.yaml`
```yaml
title: 'Honors Linear Algebra'
short: 'HS LA'
url: 'https://'
grade: '100%'
```

Contents of `master.tex`:
```tex
\documentclass[a4paper,11pt,openany]{tuftebook}

\input{preamble}

\newcommand\theTitle{'TITLE'}
\newcommand\theauthor{'AUTHOR'}
\newcommand\thedate{'DATE'}

\title{\theTitle}
\author{\theauthor}
\date{\thedate}

\begin{document}

    \maketitle
    
    \renewcommand{\thepage}{Page: \roman{page}}
    \setcounter{page}{1}
    \pagestyle{plain}
    
    \input{copyright.tex}
    \input{preface.tex}
    \input{summary.tex}
    
    \tableofcontents

    \pagestyle{fancy}
    \renewcommand{\thepage}{Page: \arabic{page}}
    \setcounter{page}{1}
    
    \input{unit-1/lesson-1}
    ...
    \input{unit-1/lesson-35}
    ...
    \input{unit-5/lesson-1}
    ...
    \input{unit-5/lesson-35}
    
    \listoftodos
    \printbibliography
    
\end{document}
```

Contents of `bibliography.bib`
```bibtex
@book{milnor,
  title={Morse theory.(AM-51)},
  author={Milnor, John},
  volume={51},
  year={2016},
  publisher={Princeton university press}
}

...
```

A lesson.tex file contains
```latex
\header{'header type'}{'header number'}{'header name'}{'date'}
...
```
