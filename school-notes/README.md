My Personal Notes
=================

# Gallery

## [Pre-Calculus 2](College/Year-1/semester-2/hs-pre-calculus-2)

![notes-image-2](media/pre-calculus-2.png)

## [Real Analysis](University/Math/RealAnalysis)

![real-analysis](media/real-analysis.png)

# File structure

```
.
├── College
│   ├── Year-1
│   │   ├── semester-1
│   │   │   ├── hs-pre-calculus-2
│   │   │   │   ├── info.yaml
│   │   │   │   ├── Makefile
│   │   │   │   ├── master.tex
│   │   │   │   ├── preamble.tex
│   │   │   │   ├── solutions.tex
│   │   │   │   ├── source-lectures.tex
│   │   │   │   ├── assignments
│   │   │   │   │   ├── Makefile
│   │   │   │   │   ├── master.tex
│   │   │   │   │   ├── preamble.tex
│   │   │   │   │   ├── image-files
│   │   │   │   │   │   ├── week-01.png
│   │   │   │   │   │   ├── week-02.png
│   │   │   │   │   │   ├── week-03.png
│   │   │   │   │   │   └── ...
│   │   │   │   │   ├── figures
│   │   │   │   │   │   ├── graph_of_equation.pdf
│   │   │   │   │   │   ├── graph_of_equation.pdf_tex
│   │   │   │   │   │   ├── graph_of_equation.svg
│   │   │   │   │   │   └── ...
│   │   │   │   │   ├── latex-files
│   │   │   │   │   │   ├── week-01.tex
│   │   │   │   │   │   ├── week-02.tex
│   │   │   │   │   │   ├── week-03.tex
│   │   │   │   │   │   └── ...
│   │   │   │   │   ├── pdf-files
│   │   │   │   │   │   ├── week-01.pdf
│   │   │   │   │   │   ├── week-02.pdf
│   │   │   │   │   │   ├── week-03.pdf
│   │   │   │   │   │   └── ...
│   │   │   │   │   └── yaml-files
│   │   │   │   │       ├── week-01.yaml
│   │   │   │   │       ├── week-02.yaml
│   │   │   │   │       ├── week-03.yaml
│   │   │   │   │       └── ...
│   │   │   │   ├── books
│   │   │   │   │   └── algebra_trigonometry.pdf
│   │   │   │   ├── figures
│   │   │   │   │   ├── diagram_of_trig.pdf
│   │   │   │   │   ├── diagram_of_trig.pdf_tex
│   │   │   │   │   ├── diagram_of_trig.svg
│   │   │   │   │   └── ...
│   │   │   │   ├── lectures
│   │   │   │   │   ├── lec-01.tex
│   │   │   │   │   ├── lec-02.tex
│   │   │   │   │   ├── lec-03.tex
│   │   │   │   │   └── ...
│   │   │   │   ├── papers
│   │   │   │   │   └── Pre-Shape Calculus: Foundations and Application to Mesh Quality Optimization -- Luft Daniel,Schulz Volker.pdf
│   │   │   │   └── UltiSnips
│   │   │   │       └── tex.snippets
│   │   │   └── ...
│   │   └── ...
│   └── ...
└── current-course
```

## Files

Contents of `info.yaml`:

```yaml
title: Pre-Calculus II
short: PC 2
url: https://
calendar_name: Pre-Calculus II
```

Content of `master.tex`:

```tex
\documentclass{report}

\input{preamble.tex}

\title{Pre-calculus 2}
\author{Hashem A. Damrah}
\date{\today}

\begin{document}
  \maketitle
  \mbox{}\newpage
  \input{source-lectures.tex}
  \newpage
  \input{solutions.tex}
\end{document}
```

Content of `source-lectures.tex`:

```tex
\input{lectures/lec-01.tex}
\input{lectures/lec-02.tex}
\input{lectures/lec-03.tex}
...
```

A lecture file contains the following lines:

```tex
\lesson{1}{Apr 04 2022 Mon (10:01:23)}{Sets and Numbers}
\label{les_1:sets_and_numbers}



\newpage
```

The `solutions.tex` is where I keep all of the solutions because throughout my
notes, I create exercises to test my knowledge. Content of `solutions.tex`:

```tex
\begin{solution}[Exercise \ref{exc:exercise_1}]
  \label{sol:exercise_1}

  ...
\end{solution}
```

Where in the notes, I would create an exercise with the following template:

```tex
\begin{exc}[Solution \ref{sol:exercise_1}]
  \label{exc:exercise_1}

  ...
\end{exc}
```

Content of `Makefile`:

```make
DOCNAME=master
PDF_VIEWER=zathura

all:
	make compile
	make clean
	make view

.PHONY:
	clean

compile:
	pdflatex $(DOCNAME).tex
	pdflatex $(DOCNAME).tex

clean:
	mv master.tex master-back.tex
	mv master.pdf master-back.pdf
	rm -rf master.*
	mv master-back.tex master.tex
	mv master-back.pdf master.pdf

view:
	make compile
	make clean
	$(PDF_VIEWER) $(DOCNAME).pdf
```

I can just run `make` to compile my notes, `make clean` to remove all the
output from the compilation, and `make view` to view my notes.

## Figures

The `figures` folder is where I store all of my inkscape figures. I use the
inkscape [mappings](https://github.com/SingularisArt/inkscape-mappings) and
[figures](https://github.com/SingularisArt/inkscape-figures) repos.

## Books

The `books` directory is where I store all the books needed for the current
course.

## Papers

The `papers` directory is where I store the papers I use to do research.

## UltiSnips

The `UltiSnips` directory is where I store the course specific snippets.
See
[this](https://damrah.netlify.app/post/note-taking-with-latex-part-1/#course-specific-snippets)
for more information.

## Current Course

The `current-course` is a [symbolic
link](https://en.wikipedia.org/wiki/Symbolic_link) that points to one of the
classes in the current college year/current college semester.

## Assignments

### Image Files

The `assignments/image-files` folder is where I store the images needed for each
assignment. If there are multiple images for one week, I name them like the
following:

* `week-01-a.png`
* `week-01-b.png`
* `week-01-c.png`

If there is only one needed image for the week, then I just name them like the
following:

* `week-01.png`
* `week-02.png`
* `week-03.png`

### Figures

The `assignments/figures` is just like the `figures` folder for my notes, but
this one is for my assignments.

### Latex Files

The `assignment/latex-files` folder is where I store the LaTeX code for each
assignment.

### PDF Files

The `assignment/pdf-files` folder is where I store the compiled version for
each assignment.

### Yaml Files

The `assignment/yaml-files` folder is where I store the information for each
assignment. I do this because I have a script that helps keep track of the
assignments. Take a look
[here](https://github.com/SingularisArt/school-setup#assignments).
