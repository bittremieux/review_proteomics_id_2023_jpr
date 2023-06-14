\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wout}[2019/09/12 Wout's opinionated manuscript class]

% scrartcl: Base class.
\LoadClass[a4paper, 10pt, titlepage=false, abstract=on]{scrartcl}

% Pass options to scrartcl.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax

% geometry: Set margins.
\RequirePackage[a4paper, margin=2.0cm, heightrounded]{geometry}

% scrhack: KOMA-script compatibility with external packages.
\RequirePackage{scrhack}

% fix-cm: Use default (OT1) font sizes (in conjunction with T1 fontenc).
\RequirePackage{fix-cm}
% fontenc: Better font encoding than default ascii.
\RequirePackage[T1]{fontenc}
% fontspec: Load external fonts.
\RequirePackage{fontspec}
% serif font: TeX Gyre Pagella
\setmainfont[Mapping=tex-text]{TeX Gyre Pagella}
% sans serif font: Libertine
\setsansfont[Mapping=tex-text]{Gillius ADF No2}
% monospaced font: Consolas
\setmonofont[Scale=0.95]{Consolas}
% symbols: DejaVu Sans
\newfontfamily\boxedsymbols{DejaVu Sans}

% amssymb: Extended symbols.
\RequirePackage{amssymb}
% authblk: Multiple authors and author affiliations.
\RequirePackage{authblk}
% babel: English hyphenation.
\RequirePackage[american]{babel}
% biblatex: Bibliography.
\RequirePackage[backend=biber, bibencoding=inputenc, style=numeric-comp, 
sorting=anyt, hyperref=auto, isbn=false, doi=true, maxbibnames=4, 
minbibnames=4, url=false, giveninits=true]{biblatex}
\DeclareNameAlias{default}{family-given}
\addbibresource{bib.bib}
% booktabs: Pretty looking tables.
\RequirePackage{booktabs}
% csquotes: Context sensitive quotation for BibLaTeX.
\RequirePackage{csquotes}
% enumitem: Inline lists.
\RequirePackage[inline]{enumitem}
% etoolbox: Supporting other packages.
\RequirePackage{etoolbox}
% environ: Manipulate environments.
\RequirePackage{environ}
% floatrow: Customize layout of floating environments.
\RequirePackage[margins=centering, objectset=centering]{floatrow}
% graphicx: Include images.
\RequirePackage{graphicx}
% lastpage: Get last page number.
\RequirePackage{lastpage}
% longtable: Multi-page tables.
\RequirePackage{longtable}
% microtype: Advanced typography.
\RequirePackage[protrusion=true, babel=true, verbose=silent]{microtype}
% rotating: Rotated figures and tables.
\RequirePackage{rotating}
% siunitx: Scientific units.
\RequirePackage[binary-units, detect-all, per-mode=symbol]{siunitx}
% scrlayer-scrpage: Page headers.
\RequirePackage[headsepline]{scrlayer-scrpage}
% subcaption: Sub-captions and sub-figures.
\RequirePackage{subcaption}
% tabularx: Adjustable-width table columns.
\RequirePackage{tabularx}
% xcolor: Define fancy colors.
\RequirePackage[usenames, table]{xcolor}
\robustify\cellcolor	% Robustify provided by etoolbox.
\definecolor{urlblue}{HTML}{191970}
\definecolor{citeyellow}{HTML}{706F19}
\definecolor{linkred}{HTML}{701945}
% xspace: Spaces inside commands.
\RequirePackage{xspace}
% hyperref: Clickable links.
% Should be included as LAST package.
\RequirePackage[breaklinks=true, colorlinks=true,
citecolor=urlblue, linkcolor=black, urlcolor=urlblue]{hyperref}
% glossaries: Acronyms and glossaries.
% Should be loaded AFTER hyperref and fontenc.
\RequirePackage[acronym, nogroupskip, nomain, nonumberlist, nopostdot, 
shortcuts, toc]{glossaries}
\setacronymstyle{long-short}
\addtokomafont{descriptionlabel}{\rmfamily}     % Use serif font.
% cleveref: Better references.
% Should be loaded AFTER hyperref.
\RequirePackage[noabbrev]{cleveref}


% Format header/footer.
\clearpairofpagestyles
\addtokomafont{pagehead}{\normalfont\footnotesize}
\ihead{\authorshort~\the\year~\textbullet~\titleshort}
\ohead{\thepage/\pageref{LastPage}}

% Increase the column white space.
\setlength{\columnsep}{1cm}

% Set caption style.
\setkomafont{captionlabel}{\bfseries}
\setcapindent{0pt}

% Format title and author(s).
\makeatletter
\renewcommand{\maketitle}{
\bgroup
\setlength{\parindent}{0pt}
\begin{flushleft}
\textbf{\sffamily\huge\@title\\}
\vspace{5mm}
\@author
\end{flushleft}
\egroup}
\makeatother

% Single-column title and abstract.
\makeatletter
\NewEnviron{titleabstract}{
\if@twocolumn
    \twocolumn[
    \maketitle
    \section*{\abstractname}
    \BODY
    \vspace{1cm}
    ]
\else
    \maketitle
    \section*{\abstractname}
    \BODY
\fi
\glsresetall
}
\makeatother

% Aligned table columns.
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Glossaries in figure captions.
\newsavebox\glsscratchbox

% Proper column alignment and paragraph alignment.
\sloppy
\flushbottom
