% This is a fork of the Reed College LaTeX thesis class file, adapted for use
% at Imperial College London. This .cls file was inspired by an Overleaf
% template developed by nuric (Creative Commons CC BY 4.0). Links below:
%
% doc.ic.ac.uk/~nuric/posts/teaching/imperial-college-phd-thesis-latex-template/
% overleaf.com/latex/templates/imperial-college-phd-thesis-template/hrwyvzbvmdzh
%
% NOTE this template is *not* officially recognised by Imperial College London
% nor is it validated for correctness. Please ensure the final rendered document
% meets the requirements set out by the University and your department.
%
% Original copyright in the comment below:
% 
% This file is copyright (C) 2003 Sam Noble. It may be modified so long
% as my name is not removed and the modifier adds his name to the file.
% Redistribution permitted.
%
% 27 Jan 2004	Sam Noble	Removed tocbibind dependency.
% 04 Dec 2001 	Sam Noble	Class file
% 03 Sep 1995	David Perkinson	Title Page
% Acknowledgements Page, David Perkinson & Sam Noble
% May 2005 Patrick Carlisle Table of contents chapter definition
% 2004-2005 Ben Salzberg (BTS) a variety of tweaks here and in the template
% 2015 Chester Ismay (CII) modified to create R Markdown template
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{imperialthesis}[2024/11/07 Imperial College PhD Thesis Class]

% Base class
\LoadClass[a4paper,11pt,twoside,openany]{book}

% Required packages
\RequirePackage[utf8]{inputenc}
\RequirePackage{mathptmx}
\RequirePackage[T1]{fontenc}
\RequirePackage[a4paper,top=2.5cm,bottom=2.5cm,left=3cm,right=3cm,marginparwidth=1.75cm]{geometry}
\RequirePackage{setspace}
\RequirePackage{amsmath,amsfonts,bm,amsthm}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{tikz}
\RequirePackage{parskip}
\RequirePackage{indentfirst}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[capitalise]{cleveref}
\RequirePackage{calc}
\RequirePackage{caption}
\RequirePackage{float}

% Set default spacing
\onehalfspacing

% Remove page numbers from empty pages
\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
  \clearpage
  {\pagestyle{empty}\origdoublepage}%
}
\let\cleardoublepage\clearemptydoublepage

% Set page numbering style
\pagestyle{plain}

% Department and degree information
\newcommand{\department}[1]{\def\@department{#1}}
\department{DEPARTMENT OF COMPUTING}
\newcommand{\degree}[1]{\def\@degree{#1}}
\degree{Doctor of Philosophy in Computing}
\newcommand{\advisor}[1]{\def\@advisor{#1}}

% Title page
\renewcommand{\maketitle}{%
    \begin{titlepage}
        \center
        
        % Logo
        \includegraphics[width=0.4\textwidth]{figure/logo}\\[1cm]
        
        % University and department
        {\small IMPERIAL COLLEGE LONDON\\
        \@department}\\[2cm]
        
        % Title and author
        {\Large \@title}\\[1cm]
        {\large \@author}
        \vfill
        
        % Supervisor info if provided
        \ifx\@advisor\undefined\else
        {\large Supervisor: \@advisor}\\[1cm]
        \fi
        
        % Date
        {\large \@date}\\[1cm]
        
        % Submission statement
        {\small Submitted in part fulfilment of the requirements for the degree of\\
        \@degree{} of Imperial College London and\\
        the Diploma of Imperial College London.}
    \end{titlepage}
    \clearpage
}

% Define copyright text
\newcommand{\copyrighttext}{%
    The copyright of this thesis rests with the author and its contents are made available under a
    Creative Commons Attribution Non-Commercial Share-Alike 4.0 International (CC BY-NC-SA
    4.0) License. You may copy and redistribute the material in any medium or format. You may
    also remix, transform or build upon the material. In doing so, you must give appropriate credit
    to the author, provide a link to the license and indicate if any changes were made. If you remix,
    transform or build upon this material, you must redistribute your contributions under the same
    license. You may not use the material for commercial purposes.
    
    Please seek permission from the copyright holder for uses of this work that are not included in the
    license mentioned above.
}

% Declaration text
\newcommand{\declarationtext}{%
    I, \@author, declare that the work in this thesis is my own. The work of others has been appropriately
    referenced. A full list of references is given in the bibliography.
}

% Create the environments with built-in titles
\newenvironment{declaration}
    {%
    \newpage
    \thispagestyle{empty}
    \vspace*{\fill}
    {\centering\large\bfseries Declaration of Originality\par}
    \vspace{1em}
    \declarationtext
    \vspace*{\fill}
    }
    {\clearpage}

\newenvironment{copyrightdec}
    {%
    \newpage
    \thispagestyle{empty}
    \vspace*{\fill}
    {\centering\large\bfseries Copyright\par}
    \vspace{1em}
    \copyrighttext
    \vspace*{\fill}
    }
    {\clearpage}

\newenvironment{abstract}{%
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{Abstract}
  \fontsize{12}{14}\selectfont
}
{\clearpage \if@restonecol\twocolumn\fi}

% Redefine abstract environment
\let\oldabstract\abstract
\let\endoldabstract\endabstract
\renewenvironment{abstract}
    {%
    \newpage
    \thispagestyle{empty}
    \vspace*{\fill}
    {\centering\large\bfseries Abstract\par}
    \vspace{1em}
    }
    {%
    \vspace*{\fill}
    \clearpage
    }

\newenvironment{acknowledgements}
    {%
    \newpage
    \thispagestyle{empty}
    \vspace*{\fill}
    {\centering\large\bfseries Acknowledgements\par}
    \vspace{1em}
    }
    {%
    \vspace*{\fill}
    \clearpage
    }

\newenvironment{dedication}
    {%
    \newpage
    \thispagestyle{empty}
    \begin{center}
    \vspace*{\fill}
    {\large\bfseries Dedication\par}
    \vspace{1em}
    }
    {%
    \vspace*{\fill}
    \end{center}
    \clearpage
    }

% Modify TOC, LOF, and LOT
\renewcommand{\contentsname}{Contents}
\renewcommand{\listfigurename}{List of Figures}
\renewcommand{\listtablename}{List of Tables}

% For RMarkdown compatibility
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

% Setup for code chunks
\usepackage{fancyvrb}
\DefineVerbatimEnvironment{Highlighting}{Verbatim}{commandchars=\\\{\}}

\endinput