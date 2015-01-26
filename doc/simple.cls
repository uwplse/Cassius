\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{simple}[2009/10/01 v1.0 Simple format class]

\PassOptionsToClass{11pt,12pt}{article}
\LoadClass[12pt]{article}

\makeatletter
\newcommand{\draft}[1]{\def\@draft{#1}}
\renewcommand{\@maketitle}{
    \let \footer \thanks
    \newpage
    \null
    \vskip -5em%
    {\bf \Large \@title\ \ifx \@draft \undefined \relax\else
    (Draft \@draft)
    \fi\par}%
    {\bf \large \ifx \@author \undefined%
        \ifx \@date \undefined%
            \relax%
        \else%
            \@date\par%
        \fi%
    \else%
        \@author%
        \if \@date %
            \par%
        \else%
            \ (\@date)\par%
        \fi%
    \fi}%
    \vskip .5em%
} \makeatother

\usepackage[margin=1in]{geometry}
\usepackage[utf8]{inputenc}
\usepackage{multicol}

\usepackage{amsmath,amssymb}
\numberwithin{equation}{section}
\numberwithin{figure}{section}

\setlength{\parskip}{1em plus .75em minus .45em}
\setlength{\parindent}{0em}
\setcounter{secnumdepth}{-1}

\date{}

\providecommand{\RR}{\ensuremath{\mathbb{R}}}
\providecommand{\QQ}{\ensuremath{\mathbb{Q}}}
\providecommand{\CC}{\ensuremath{\mathbb{C}}}
\providecommand{\ZZ}{\ensuremath{\mathbb{Z}}}
\providecommand{\NN}{\ensuremath{\mathbb{N}}}
\providecommand{\FF}{\ensuremath{\mathbb{F}}}

\renewcommand{\thefigure}{\arabic{figure}}
