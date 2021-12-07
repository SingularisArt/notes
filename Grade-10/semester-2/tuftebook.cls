\NeedsTeXFormat{LaTeX2e}
\ProvidesFile{tuftebook.cls}[2020/03/24 v1.00a Caesar book]

\RequirePackage{amsmath}
\LoadClassWithOptions{book}
\RequirePackage{sidenotes}
\captionsetup{font=footnotesize, skip=2pt}
\RequirePackage[maxfloats=45]{morefloats}

\RequirePackage{marginfix}
\newcommand{\caesar@letterspace}[1]{#1}
\RequirePackage[letterspace=150]{microtype}
\@ifpackagelater{microtype}{2011/08/18}
{\renewcommand{\caesar@letterspace}[1]{\textls{#1}}}
{\AtEndDocument{\ClassWarningNoLine{caesar_book}{Need newest microtype for letterspacing.}}}

% Setting up the dimensions of the page using the package geometry.
\RequirePackage{geometry}
\geometry{
    paperwidth=210mm,
    paperheight=297mm,
    left=42pt,
    top=72pt,
    textwidth=320pt,
    marginparsep=20pt,
    marginparwidth=180pt,
    textheight=650pt,
    footskip=40pt,
}

\renewcommand{\normalsize}{\fontsize{10pt}{13pt}\selectfont}%
\renewcommand{\footnotesize}{\fontsize{8pt}{10pt}\selectfont}%

\newlength{\overhang}
\setlength{\overhang}{\marginparwidth}
\addtolength{\overhang}{\marginparsep}

\newenvironment{fullwidth}
    {\ifthenelse{\boolean{@twoside}}
        {\begin{adjustwidth*}{}{-\overhang}}
        {\begin{adjustwidth}{}{-\overhang}}
    }
    {\ifthenelse{\boolean{@twoside}}
        {\end{adjustwidth*}}
        {\end{adjustwidth}}
    }

\RequirePackage{titlesec,titletoc}
\RequirePackage{fmtcount}
\titleformat{\chapter}[display]
{\bfseries\Large\sf}
{\filleft
\textls{\MakeUppercase{\chaptertitlename}} \expandafter\textls\expandafter{\NUMBERstring{chapter}}}
{1.5ex}
{\titlerule
\vspace*{1.1ex}
\filright}
[\vspace*{1.5ex}
\titlerule]


% This is used for chapters
\RequirePackage{fancyhdr}                       % Helper package
\fancypagestyle{plain}{
    \renewcommand{\headrulewidth}{0pt}          % Line at the header invisible
    \renewcommand{\footrulewidth}{0pt}          % Line at the footer visible
}

% Basic formatting.
\renewcommand{\frontmatter}{\pagestyle{empty}}
\renewcommand{\mainmatter}{\cleardoublepage\pagestyle{fancy}}
\RequirePackage{ragged2e}
\newcommand{\marginparstyle}{\footnotesize}
\long\def\@ympar#1{
    \@savemarbox\@marbox{\marginparstyle#1}
    \global\setbox\@currbox\copy\@marbox
    \@xympar}
\renewcommand*{\marginfont}{\marginparstyle}

% Setting up itemize and enumerate.
\RequirePackage[shortlabels]{enumitem}
\setlist[itemize]{leftmargin=*}

\newcommand\newthought[1]{
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}
}
\ExplSyntaxOn
\NewDocumentCommand \sidecite { o o m }
{ 
    \IfNoValueOrEmptyTF{#1}
    {
        \IfNoValueOrEmptyTF{#2}
        {
          \sidenote{\fullcite{#3}}
        }
        {
          \sidenote{\fullcite[#2]{#3}}
        }
    }
    {
        \IfNoValueOrEmptyTF{#2}
        {
          \sidenote{\fullcite[#1]{#3}}
        }
        {
          \sidenote{\fullcite[#1][#2]{#3}}
        }
    }
}
\ExplSyntaxOff

\RequirePackage{caption}
\RequirePackage[margincaption,outercaption,,wide]{sidecap}
\sidecaptionvpos{figure}{t} 
\captionsetup{labelfont={sf,bf,footnotesize}}
\DeclareCaptionStyle{marginfigure}[]{labelfont={sf,bf,footnotesize}, font=footnotesize, justification=justified}
\DeclareCaptionStyle{sidecaption}[]{labelfont={sf,bf,footnotesize}, font=footnotesize, justification=justified, singlelinecheck=off}
\DeclareCaptionStyle{widefigure}[]{labelfont={sf,bf,footnotesize}, font=footnotesize}

\renewcommand{\normalsize}{\fontsize{10pt}{13pt}\selectfont}%
\renewcommand{\footnotesize}{\fontsize{8pt}{10pt}\selectfont}%
