# My Personal Notes

## File structure

```
~/Documents/notes/.
├── Grade-9
│   ├── semester-1
│   ├── semester-2
│   │   ├── honors-linear-algebra-2
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
├── Grade-10
│   ├── semester-1
│   └── semester-2
├── Grade-11
│   ├── semester-1
│   └── semester-2
├── Grade-12
│   ├── semester-1
│   └── semester-2
├── current-course
├── note-taking-class.cls
└── preamble.tex
```

`current-course` is a [symbolic link](https://en.wikipedia.org/wiki/Symbolic_link) that points to one of the classes in the current grade/current semester. For example, if I am in grade 9 and semester 2 and I am working on math, it points me to [honors linear algebra 2](Grade-9/semester-2/honors-linear-algebra-2). I use scripts, which you can find them [here](https://github.com/SingularisArt/Singularis/tree/master/local/scripts).

The `note-taking-class.cls` file is a class file that I use when taking notes.

The `preamble.tex` is a file that I use in every single `master.tex`. It has all of my default packages, commands, setup, etc.

Contents of `info.yaml`
```yaml
title: 'Honors Linear Algebra'
short: 'HS LA'
url: 'https://'
```

Contents of `master.tex`:
```tex
\documentclass[]{note-taking-class}
\input{../../../preamble.tex}
...
\title{Agebra}
\date{August 30, 2021}

\begin{document}
    \maketitle
    \tableofcontents
    
    % start lesson
    \input{unit-1/lesson-1.tex}
    ...
    \input{unit-1/lesson-35.tex}
    % end lesson
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

I have a lot of custom environments. Here are all of them:

<object data="environments.pdf" type="application/pdf" width="700px" height="700px">
    <embed src="environments.pdf">
        <p>This browser does not support PDFs. Please download the PDF to view it: <a href="environments.pdf">Download PDF</a>.</p>
    </embed>
</object>
