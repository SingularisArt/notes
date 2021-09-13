My Personal Notes
=================

# Gallery

# Table of Contents

* [Gallery](#gallery)
* [File Structure](#file-structure)
    * [Going over the file tree](#going-over-the-file-tree)
        * [Currenty Course](#current-course)
        * [Source Lessons](#source-lessons)
        * [Note Taking Class Cls](#note-taking-class-cls)
        * [Preamble Tex](#preamble-tex)
        * [Info yaml](#info-yaml)
        * [Master Tex](#master-tex)
        * [Lesson Tex](#lesson-tex)
        * [Lecture Tex](#lecture-tex)
        * [Bibliography Bib](#bibliography-bib)
* [What is LaTeX](#what-is-latex)
* [ToDo](#todo)
    * [Completed](#completed)
    * [Working on](#working-on)
    * [Not started yet](#not-started-yet)

# File structure

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

## Going over the file tree

### Currenty Course

`current-course` is a [symbolic link](https://en.wikipedia.org/wiki/Symbolic_link) that points to one of the classes in the current grade/current semester. For example, if I am in grade 9 and semester 2 and I am working on math, it points me to [honors algebra 2](Grade-10/semester-2/hs-algebra-2). I use scripts to help me maintain all of my notes, which you can find them [here](https://github.com/SingularisArt/Singularis/tree/master/local/scripts).

### Source Lessons

The `source-lessons.tex` is a file that I use to source all of my lessons/lectures in so I don't have to do it in my `master.tex`. Here is the content:

```latex
 \input{unit-1/lesson-1}
 ...
 \input{unit-1/lesson-35}
 ...
 \input{unit-5/lesson-1}
 ...
 \input{unit-5/lesson-35}
```

The reason I do this is because I use a bunch of small scripts to do a lot of things for me. For example, I have a script that creates a new `lesson`/`lecture` for me:

![rofi new lesson](media/rofi-new-lesson.gif)

### Note Taking Class Cls

The `note-taking-class.cls` file is a class file that I use when taking notes.

### Preamble Tex

The `preamble.tex` is a file that I use in every single `master.tex`. It has all of my default packages, commands, setup, etc.

### Info yaml

Contents of `info.yaml`
```yaml
title: 'Honors Linear Algebra'
short: 'HS LA'
url: 'https://'
grade: '100%'
```

### Master Tex

Contents of `master.tex`:
```tex
\documentclass[a4paper,11pt,openany]{tuftebook}

\input{../preamble}

\newcommand\theTitle{'TITLE'}
\newcommand\theauthor{'AUTHOR'}
\newcommand\thedate{'DATE'}

\title{\theTitle}
\author{\theauthor}
\date{\thedate}

\begin{document}

    \maketitle
    
    \pagestyle{plain}
    \renewcommand{\thepage}{Page: \roman{page}}
    
    \setcounter{page}{1}
    \setcounter{chapter}{0}
    
    \input{copyright.tex}
    \input{preface.tex}
    \input{summary.tex}
    
    \tableofcontents

    \pagestyle{fancy}
    \renewcommand{\thepage}{Page: \arabic{page}}
    
    \setcounter{page}{1}
    \setcounter{chapter}{0}
    
    \input{source-lessons}
    
    \listoftodos
    \printbibliography
    
\end{document}
```

### Lesson Tex

A lesson file contains a line
```latex
\lesson{1}{Sep 13 2021 Mon (10:54:11)}{Introduction}
```
which is the lesson number, date an title of the lecture.

### Lecture Tex

A lecture file (just like the [lesson file](#lesson-tex)) contains a line
```latex
\lecture{1}{Sep 13 2021 Mon (10:54:11)}{Introduction}
```
which is the lesson number, date an title of the lecture.

### Bibliography Bib

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

# What is LaTeX

# ToDo

[] Add gif of me using my scripts.
[] Talk about my scripts.
[] Add pictures of how my notes look like when using this setup.
[] Add [What is LaTeX](#what-is-latex) section.
[] Expand more on the [Lesson tex](#lesson-tex) and [Master tex](#master-tex) section.
