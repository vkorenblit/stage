\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{smilebeamer}


% use beamer and allow colored beamer, transmit all options to beamer
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[xcolor=table]{beamer}

% images are in the epss folder
\def\input@path{{epss/}}

% start in full screen
\hypersetup{pdfpagemode=FullScreen}

% use Smile colors
\RequirePackage{smilecolor}

% Fix quotes in verbatim envs
\RequirePackage{upquote}

% The Raleway font is a little bigger than the previously used font
% So in order to avoid breaking every already existing document, I 
% decided to shrink the font a little
\RequirePackage[scale=.9]{raleway}


% Smile packages
\RequirePackage{system}
\RequirePackage{slide}
\RequirePackage{system}
\RequirePackage{ifthen}
\RequirePackage{intcalc}
\RequirePackage{textpos}

% Basic lstlistings style
\lstset{
    basicstyle=\tiny,
    showspaces=false
}

\lstset{columns=flexible}                     % Pour pouvoir copier coller le code dans les PDF


% Un theme pas trop chargé, aux couleurs de Smile
\usetheme[height=1cm]{Rochester}
\definecolor{smileorange}{RGB}{255,127,84}
\definecolor{smileblue}{RGB}{59,128,255}
\definecolor{smilered}{RGB}{255,5,68}
\usecolortheme[named=smileorange]{structure}
% Avec le thème rochester, les blocks sont trop foncés, on les re-force en SmileOrange™
\setbeamercolor*{block title}{bg=smileorange,fg=white}
\setbeamercolor*{block title alerted}{bg=smilered,fg=white}
\setbeamercolor*{block title example}{bg=smileblue,fg=white}


% allow frame break
\setbeamertemplate{frametitlecontinuation} {\insertcontinuationcount}

% Slides intended for printout get a page number instead
\only<handout>{\setbeamertemplate{footline}[frame number]}

% Logo Smile sur la page de titre
\titlegraphic{\includegraphics[height=1.3cm]{smile-logo}}

\setbeamertemplate{sidebar right}
{
    \vfill%
    \vskip2pt%
    \llap{\usebeamertemplate***{navigation symbols}\hskip0.1cm}%
    \vskip2pt%
}

\addtobeamertemplate{headline}{}{%
\begin{textblock*}{100mm}(\textwidth-10mm,-8mm)
\includegraphics[height=0.6cm]{smile-icon}
\end{textblock*}}


% Generate a ToC at each new section and subsection
\AtBeginSection[]{\begin{frame} \frametitle{Plan}\tableofcontents[currentsection,hideothersubsections]\end{frame}}
\AtBeginSubsection[]{\begin{frame} \frametitle{Plan}\tableofcontents[currentsection,subsectionstyle=show/shaded/hide]\end{frame}}

% If we dont want to see the ToCs, but still want to use sections and subsections
\DeclareOption{notoc}{
    \AtBeginSection[]{}\AtBeginSubsection[]{}
}

% use a Smile-y orange-y background to leverage corporate compliance at bottom left of every page except the first
\newcommand\backgroundimage{fond_1} % default
\DeclareOption{bgimages}{
        \usebackgroundtemplate{
	  \ifthenelse{\thepage=1}{}{
	    \renewcommand\backgroundimage{fond_\intcalcMod{\value{page}}{12}}
	    % fond_\intcalcMod{\value{page}}{12}
	    \vbox to \paperheight {\vfill \includegraphics[keepaspectratio,height=0.15\paperheight]{\backgroundimage} \vspace{.2cm}}
	  }
	}
}
\ProcessOptions\relax

% avoid two warnings
\let\Tiny=\tiny
