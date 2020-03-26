\NeedsTeXFormat{LaTeX2e}
\LoadClassWithOptions{article}
\ProvidesClass{teknisk-notat}[2019-02-11 Class file for techincal documentation]

% ----- Options ---------------------------------------------------------------
\newcommand\@opanon{0}
\DeclareOption{anonymous}{\renewcommand\@opanon{1}}
\newcommand\@opnewpage{0}
\DeclareOption{newpage}{\renewcommand\@opnewpage{1}}
\newcommand\@oplargemargins{0}
\DeclareOption{largemargins}{\renewcommand\@oplargemargins{1}}
\ProcessOptions

% ----- Packages --------------------------------------------------------------

% Better fonts with accents
\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}
\RequirePackage{moresize}
\RequirePackage{babel}
%\RequirePackage[fixlanguage]{babelbib}
\setlength{\parindent}{0pt} 
\setlength{\parskip}{2ex}

% Pagesetup
%\RequirePackage[utf8]{inputenc}
\RequirePackage{a4wide}
\RequirePackage{xcolor}

% Code listings
\RequirePackage[newfloat]{minted}

\newenvironment{code}{\captionsetup{type=listing}}{}
\SetupFloatingEnvironment{listing}{name=Kodeeksempel}

% Internasjonal behandling av anførselstegn
\RequirePackage{csquotes}

% Mikrotypografiske optimeringer
\RequirePackage[babel=true]{microtype}

% Required for starred commands
\RequirePackage{suffix}

% Math and electronic symbols
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}
\RequirePackage{centernot}
\RequirePackage{textcomp}
\RequirePackage{gensymb}

\RequirePackage{siunitx}
\sisetup{
exponent-product = \cdot,
output-decimal-marker  =  {,}, % Pass på å endre desimalskilletegnet til punktum om du skriver på engelsk!
separate-uncertainty = true,
per-mode = symbol,
group-digits = false,
}

% Nice lists
\RequirePackage{enumerate}
\RequirePackage{enumitem}
\RequirePackage[font=small,labelfont=bf]{caption}
\RequirePackage{tabularx}
\RequirePackage{multirow}


% Nice images, figures, and listings
% Figurer og tabeller
\RequirePackage{graphicx} % Denne pakken er standard for å kunne laste inn figurfiler med ulike formater
\RequirePackage{makecell}
% Løsne opp på de alt for strenge standardinstillingene for plassering av figurer og tabeller (floats) i LaTeX-kjernen
\renewcommand{\topfraction}{.85}
\renewcommand{\bottomfraction}{.7}
\renewcommand{\textfraction}{.15}
\renewcommand{\floatpagefraction}{.66}
\setcounter{topnumber}{3}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{10}

\RequirePackage{flafter} % For å plassere floats i PDFen første sted LaTeX tillater etter det punktet de er definert i TeX-filen. Om du definerer figuren i TeX-filen rett etter at du refererer til den for første gang vil denne pakken sørge for at de fleste floats havner på greie steder
\RequirePackage{booktabs} % Denne pakken gir tilgang på endel ekstra kommandoer som legger til rette for god skikk og bruk i tabellformatering.
\RequirePackage{multirow}
\RequirePackage[font=small,labelfont=bf]{caption} % Justering av LaTeX standarder for figurtekst og tabelltekst.
\RequirePackage{grffile}
\RequirePackage[all]{xy}
\RequirePackage{wrapfig}
\RequirePackage{fancyvrb}
%\RequirePackage{listings}
%\RequirePackage{listingsutf8}
\RequirePackage{subfig}
\RequirePackage{mathtools}% automatically loads amsmath
\RequirePackage{lipsum}

% Drawing
\RequirePackage{pgf}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.15}
\usetikzlibrary{arrows}

% Electronic drawing
\RequirePackage[european, american currents, american voltages,siunitx]{circuitikz}
\tikzset{opampdownlbl/.style={
    below,
    draw=none,
    append after command={
      (\tikzlastnode.north) edge ([shift={(-5pt,0pt)}]\tikzlastnode.north)
        edge ([shift={(+5 pt,0 pt)}]\tikzlastnode.north)
    }},
  opampuplbl/.style ={
    above,
    draw=none,
    append after command={
      (\tikzlastnode.south) edge ([shift={(-5pt,0pt)}]\tikzlastnode.south)
        edge ([shift={(+5pt,0pt)}]\tikzlastnode.south)
    }}
}
\newcommand*{\eq}{=}


% Conditionals
\RequirePackage{ifthen}

% Header & Page Setup
%\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}
\RequirePackage{fancyhdr}
\ifthenelse{\equal{\@oplargemargins}{1}}{}{\RequirePackage{fullpage}}

% Links
\RequirePackage{xurl}
%\RequirePackage[colorlinks=true,allcolors=blue, hidelinks, pdftex, pdfborderstyle={/S/U/W 0}]{hyperref}
\RequirePackage[colorlinks=true,allcolors=blue, hidelinks, pdfborderstyle={/S/U/W 0}]{hyperref} % Used for XeLaTeX
% Noen av navnene for autoreferanser mangler på norsk, så vi ordner opp i det.
\addto\extrasnorsk{%
\def\figureautorefname{figur}%
\def\tableautorefname{tabell}%
\def\sectionautorefname{avsnitt}%
\def\subsectionautorefname{underavsnitt}%
\def\appendixautorefname{vedlegg}
}


\RequirePackage[backend=biber,style=numeric,sortcites,giveninits=true]{biblatex}
%\usepackage[backend=biber,style=numeric,sortcites,firstinits=true]{biblatex}
% Velger hvilken stil url-adresser skrives, f.eks sf
%\urlstyle{sf}
%\urlstyle{same}

%\renewcommand{\familydefault}{\sfdefault}
%\rmdefault
%\sfdefault
%\ttdefault

% ----- Titlevariables --------------------------------------------------------
\newcommand\heading[1]{\renewcommand\@heading{#1}}
\newcommand\@heading{}

\newcommand\version[1]{\renewcommand\@version{#1}}
\newcommand\@version{}

\newcommand\faculty[1]{\renewcommand\@faculty{#1}}
\newcommand\@faculty{}



% ----- Reference commands --------------------------------------------------------


% ----- Page Setup ------------------------------------------------------------

% Use block style paragraphs
\setlength{\parindent}{0pt}
\setlength{\parskip}{5pt plus 1pt}

\def\indented#1{\list{}{}\item[]}
\let\indented=\endlist

% ------- Table of Contents -------

%newcommand{\toc}{
%  \setlength{\parskip}{0ex}
%  \renewcommand{\baselinestretch}{0.1}\normalsize
%  \tableofcontents
%  \renewcommand{\baselinestretch}{1.00}\normalsize
%  \setlength{\parskip}{2ex}
%  \rule{\textwidth}{1pt}
%}
\newcommand{\toc}{
    \tableofcontents
    \clearpage
}
    

% ----- Title & Header --------------------------------------------------------
\pagestyle{empty}
\pagestyle{plain}

\definecolor{elsys}{HTML}{1999ce}
%\definecolor{lightgray}{}{}

\renewcommand{\maketitle}[0]{%
  \begin{tikzpicture}[remember picture,overlay]
    %\fill[red] (current page.south west)++(2cm,0) --++(3cm,0) --++(\paperheight,0) -| ;
    \fill [lightgray] ([xshift=2cm]current page.south west) rectangle ++(3cm,\paperheight);
  \end{tikzpicture}%

  \begin{minipage}[t]{0.15\textwidth}
  \vspace{1.4cm}
  %0.45cm for bunn-align med tittel, 1.4cm for topp
  \includegraphics[width=2.0cm]{figurer/FKlogo.png}
  \vspace{3.25cm}\\
  %3.25cm for sort-boks-topp align undertittel, 3.6cm for ntnulogo
  \includegraphics[width=2.0cm]{figurer/SAMFlogo.png}
  %\includegraphics[width=2.0cm]{elsys-teknisk}  

  \end{minipage}
  \hspace*{.7cm}
  \begin{minipage}[t]{0.75\textwidth}

  \vspace{1.5cm}
  \HUGE\textbf{\@heading}
  \vspace{1cm}\\
  \huge \@author
  \vspace*{1.5cm}\\
  \huge \@title
  \vspace*{0.3cm}\\
  \huge \@date
  \vspace*{0.5cm}\\
  \large Versjon: \@version
  \vspace*{8cm}\\
  \large \textbf{\@faculty}
  \end{minipage}
  \normalsize
  \clearpage
}

% ----- For usage with pandoc converted documents -----------------------------
%
%\providecommand{\tightlist}{%
%  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

% -----------------------------------------------------------------------------
% ------------ User commands
\DeclareRobustCommand{\jolyu}{%
  \begingroup\normalfont
  \includegraphics[height=1.2\fontcharht\font`\B]{figurer/jolyu.pdf}%
  \endgroup
}

% -----------FONTS-----------