%%
%% This is file `hustthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% hustthesis.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2013-2014 by Xu Cheng <xucheng@me.com>
%%               2014      by hust-latex <https://github.com/hust-latex>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is hust-latex Organization.
%% 
%% This work consists of the files hustthesis.bst, hustthesis.dtx,
%% hustthesis.ins and the derived file hustthesis.cls
%% along with its document and example files.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{hustthesis}
[2013/07/01 v1.1 A Thesis Template for Huazhong University of Science and Technology]
%% \CharacterTable
%% {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%  Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%  Digits        \0\1\2\3\4\5\6\7\8\9
%%  Exclamation   \!     Double quote  \"     Hash (number) \#
%%  Dollar        \$     Percent       \%     Ampersand     \&
%%  Acute accent  \'     Left paren    \(     Right paren   \)
%%  Asterisk      \*     Plus          \+     Comma         \,
%%  Minus         \-     Point         \.     Solidus       \/
%%  Colon         \:     Semicolon     \;     Less than     \<
%%  Equals        \=     Greater than  \>     Question mark \?
%%  Commercial at \@     Left bracket  \[     Backslash     \\
%%  Right bracket \]     Circumflex    \^     Underscore    \_
%%  Grave accent  \`     Left brace    \{     Vertical bar  \|
%%  Right brace   \}     Tilde         \~}
\RequirePackage{ifthen}
\RequirePackage{xkeyval}
\newif\ifHUST@finalformat
\HUST@finalformattrue
\DeclareOptionX{format}[final]{
  \ifthenelse{\equal{#1}{final}}{
    \HUST@finalformattrue
  }{
    \ifthenelse{\equal{#1}{draft}}{
      \HUST@finalformatfalse
    }{
      \ClassError{hustthesis}
      {Option format can only be 'final' or 'draft'}
      {Try to remove option format^^J}
    }
  }
}
\gdef\HUST@language{chinese}
\DeclareOptionX{language}[chinese]{
  \ifthenelse{\equal{#1}{chinese} \OR \equal{#1}{english} \OR \equal{#1}{english-draft}}{
    \gdef\HUST@language{#1}
  }{
    \ClassError{hustthesis}
    {Option language can only be 'chinese', 'english' or 'english-draft'}
    {Try to remove option language^^J}
  }
}
\gdef\HUST@degree{none}
\DeclareOptionX{degree}[none]{
  \ifthenelse{\equal{#1}{none} \OR \equal{#1}{fyp} \OR \equal{#1}{bachelor} \OR \equal{#1}{master} \OR \equal{#1}{phd}}{
    \gdef\HUST@degree{#1}
  }{
     \ClassError{hustthesis}
      {Option degree can only be 'none', 'fyp', 'bachelor', 'master' or 'phd'}
      {Try to remove option degree^^J}
  }
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptionsX
\LoadClass[12pt, a4paper, openany]{book}
\RequirePackage{iftex}
\ifXeTeX\else
  \ifLuaTeX\else
    \begingroup
      \errorcontextlines=-1\relax
      \newlinechar=10\relax
      \errmessage{^^J
      *******************************************************^^J
      * XeTeX or LuaTeX is required to compile this document.^^J
      * Sorry!^^J
      *******************************************************^^J
      }%
    \endgroup
  \fi
\fi
\ifthenelse{\equal{\HUST@language}{english-draft}}{
    \RequirePackage{fontspec}
    \setmainfont[
      Ligatures={Common,TeX},
      Extension=.otf,
      UprightFont=*-regular,
      BoldFont=*-bold,
      ItalicFont=*-italic,
      BoldItalicFont=*-bolditalic]{texgyretermes}
    \setsansfont[Ligatures={Common,TeX}]{Droid Sans}
    \setmonofont{CMU Typewriter Text}
    \defaultfontfeatures{Mapping=tex-text}
    \let\HEI\relax
    \let\KAI\relax
    \let\FANGSONG\relax
    \newcommand{\hei}[1]{#1}
    \newcommand{\kai}[1]{#1}
    \newcommand{\fangsong}[1]{#1}
}{}
\ifthenelse{\equal{\HUST@language}{english-draft}}{}{
    \ifXeTeX  % XeTeX下使用fontspec + xeCJK处理字体
      % 英文字体
      \RequirePackage{fontspec}
      \RequirePackage{xunicode}
      \setmainfont[
        Ligatures={Common,TeX},
        Extension=.otf,
        UprightFont=*-regular,
        BoldFont=*-bold,
        ItalicFont=*-italic,
        BoldItalicFont=*-bolditalic]{texgyretermes}
      \setsansfont[Ligatures={Common,TeX}]{Droid Sans}
      \setmonofont{CMU Typewriter Text}
      \defaultfontfeatures{Mapping=tex-text}
      % 中文字体
      \RequirePackage[CJKmath]{xeCJK}
      \setCJKmainfont[
       BoldFont={Adobe Heiti Std},
       ItalicFont={Adobe Kaiti Std}]{Adobe Song Std}
      \setCJKsansfont{Adobe Kaiti Std}
      \setCJKmonofont{Adobe Fangsong Std}
      \xeCJKsetup{PunctStyle=kaiming}

      \newcommand\ziju[2]{{\renewcommand{\CJKglue}{\hskip #1} #2}}
      \newCJKfontfamily\HEI{Adobe Heiti Std}
      \newCJKfontfamily\KAI{Adobe Kaiti Std}
      \newCJKfontfamily\FANGSONG{Adobe Fangsong Std}
      \newcommand{\hei}[1]{{\HEI #1}}
      \newcommand{\kai}[1]{{\KAI #1}}
      \newcommand{\fangsong}[1]{{\FANGSONG #1}}
    \else\fi
    \ifLuaTeX  % LuaTeX下使用luatex-ja处理字体 [推荐]
      \RequirePackage{luatexja-fontspec}
      % 英文字体
      \setmainfont[Ligatures={Common,TeX}]{Tex Gyre Termes}
      \setsansfont[Ligatures={Common,TeX}]{Droid Sans}
      \setmonofont{CMU Typewriter Text}
      \defaultfontfeatures{Mapping=tex-text,Scale=MatchLowercase}
      % 中文字体
      \setmainjfont[
       BoldFont={AdobeHeitiStd-Regular},
       ItalicFont={AdobeKaitiStd-Regular}]{AdobeSongStd-Light}
      \setsansjfont{AdobeKaitiStd-Regular}
      \defaultjfontfeatures{JFM=kaiming}

      \newcommand\ziju[2]{\vbox{\ltjsetparameter{kanjiskip=#1} #2}}
      \newjfontfamily\HEI{AdobeHeitiStd-Regular}
      \newjfontfamily\KAI{AdobeKaitiStd-Regular}
      \newjfontfamily\FANGSONG{AdobeFangsongStd-Regular}
      \newcommand{\hei}[1]{{\jfontspec{AdobeHeitiStd-Regular} #1}}
      \newcommand{\kai}[1]{{\jfontspec{AdobeKaitiStd-Regular} #1}}
      \newcommand{\fangsong}[1]{{\jfontspec{AdobeFangsongStd-Regular} #1}}
    \else\fi
    \RequirePackage{zhnumber}
    \def\CJKnumber#1{\zhnumber{#1}} % 兼容CJKnumb
}
\RequirePackage{interfaces-LaTeX}
\changefont{linespread=1.3}
\RequirePackage{geometry}
\geometry{
  a4paper,
  top=1.77in,
  bottom=1.1in,
  left=1.1in,
  right=1.1in,
  includefoot
}
\pdfpagewidth=\paperwidth
\pdfpageheight=\paperheight
\RequirePackage{indentfirst}
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt plus 2pt minus 1pt}
\RequirePackage{color}
\RequirePackage[table]{xcolor}
\RequirePackage[unicode]{hyperref}
\hypersetup{
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=1,
  breaklinks=true,
  colorlinks=true,
  allcolors=black,
  linktoc=all,
  plainpages=false,
  pdfpagelabels=true,
  pdfstartview={XYZ null null 1},
  pdfinfo={Template.Info={hustthesis.cls v1.1 2013/07/01, Copyright (C) 2013-2014 by Xu Cheng 2014 by hust-latex, https://github.com/hust-latex/hustthesis}}
}
\RequirePackage{amsmath,amssymb,amsfonts}
\RequirePackage[amsmath,amsthm,thmmarks,hyperref,thref]{ntheorem}
\RequirePackage{fancynum}
\setfnumgsym{\,}
\RequirePackage[lined,boxed,linesnumbered,ruled,vlined,algochapter]{algorithm2e}
\RequirePackage[all]{xy}
\RequirePackage{overpic}
\RequirePackage{graphicx,caption,subcaption}
\RequirePackage{array}
\RequirePackage{multirow,tabularx,ltxtable}
\RequirePackage{listings}
\RequirePackage[numbers,square,comma,super,sort&compress]{natbib}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{tocvsec2}
\RequirePackage[inline]{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{afterpage}
\RequirePackage{datenumber}
\RequirePackage{etoolbox}
\RequirePackage{appendix}
\RequirePackage[titles]{tocloft}
\RequirePackage{xstring}
\RequirePackage{perpage}
\def\zhtitle#1{\gdef\HUST@zhtitle{#1}\hypersetup{pdftitle={#1}}}
\def\entitle#1{\gdef\HUST@entitle{#1}}
\DeclareDocumentCommand\title{m g}
{
  \IfNoValueTF{#2}{
    \zhtitle{#1}\entitle{#1}
  }{
    \zhtitle{#1}\entitle{#2}
  }
}
\title{}{}
\def\zhauthor#1{\gdef\HUST@zhauthor{#1}\hypersetup{pdfauthor={#1}}}
\def\enauthor#1{\gdef\HUST@enauthor{#1}}
\DeclareDocumentCommand\author{m g}
{
  \IfNoValueTF{#2}{
    \zhauthor{#1}\enauthor{#1}
  }{
    \zhauthor{#1}\enauthor{#2}
  }
}
\author{}{}
\def\date#1#2#3{
  \setdate{#1}{#2}{#3}
}
\setdatetoday
\def\zhdateformat{~\thedateyear~年~\thedatemonth~月~\thedateday~日}
\def\endateformat{\datedate}
\ifthenelse{\equal{\HUST@language}{chinese}}{
  \let\dateformat\zhdateformat
}{
  \let\dateformat\endateformat
}
\def\zhschoolname#1{\gdef\HUST@zhschoolname{#1}}
\def\enschoolname#1{\gdef\HUST@enschoolname{#1}}
\DeclareDocumentCommand\schoolname{m g}
{
  \IfNoValueTF{#2}{
    \zhschoolname{#1}\enschoolname{#1}
  }{
    \zhschoolname{#1}\enschoolname{#2}
  }
}
\schoolname{华中科技大学}{Huazhong University of Science~\char38~Technology}
\def\zhaddress#1{\gdef\HUST@zhaddress{#1}}
\def\enaddress#1{\gdef\HUST@enaddress{#1}}
\DeclareDocumentCommand\address{m g}
{
  \IfNoValueTF{#2}{
    \zhaddress{#1}\enaddress{#1}
  }{
    \zhaddress{#1}\enaddress{#2}
  }
}
\address{中国，武汉，430074}{Wuhan~430074, P.~R.~China}
\def\zhmajor#1{\gdef\HUST@zhmajor{#1}}
\def\enmajor#1{\gdef\HUST@enmajor{#1}}
\DeclareDocumentCommand\major{m g}
{
  \IfNoValueTF{#2}{
    \zhmajor{#1}\enmajor{#1}
  }{
    \zhmajor{#1}\enmajor{#2}
  }
}
\major{}{}
\def\zhsupervisor#1{\gdef\HUST@zhsupervisor{#1}}
\def\ensupervisor#1{\gdef\HUST@ensupervisor{#1}}
\DeclareDocumentCommand\supervisor{m g}
{
  \IfNoValueTF{#2}{
    \zhsupervisor{#1}\ensupervisor{#1}
  }{
    \zhsupervisor{#1}\ensupervisor{#2}
  }
}
\supervisor{}{}
\def\zhasssupervisor#1{\gdef\HUST@zhasssupervisor{#1}}
\def\enasssupervisor#1{\gdef\HUST@enasssupervisor{#1}}
\DeclareDocumentCommand\asssupervisor{m g}
{
  \IfNoValueTF{#2}{
    \zhasssupervisor{#1}\enasssupervisor{#1}
  }{
    \zhasssupervisor{#1}\enasssupervisor{#2}
  }
}
\asssupervisor{}{}
\def\schoolcode#1{\gdef\HUST@schoolcode{#1}}
\schoolcode{}
\def\stuno#1{\gdef\HUST@stuno{#1}}
\stuno{}
\def\classno#1{\gdef\HUST@classno{#1}}
\classno{}
\def\secretlevel#1{\gdef\HUST@secretlevel{#1}}
\secretlevel{}
\long\def\zhabstract#1{\long\gdef\HUST@zhabstract{#1}}
\long\def\enabstract#1{\long\gdef\HUST@enabstract{#1}}
\DeclareDocumentCommand\abstract{+m +g}
{
  \IfNoValueTF{#2}{
    \zhabstract{#1}\enabstract{#1}
  }{
    \zhabstract{#1}\enabstract{#2}
  }
}
\abstract{}{}
\def\zhkeywords#1{\gdef\HUST@zhkeywords{#1}\hypersetup{pdfkeywords={#1}}}
\def\enkeywords#1{\gdef\HUST@enkeywords{#1}}
\DeclareDocumentCommand\keywords{m g}
{
  \IfNoValueTF{#2}{
    \zhkeywords{#1}\enkeywords{#1}
  }{
    \zhkeywords{#1}\enkeywords{#2}
  }
}
\keywords{}{}
\ifthenelse{\equal{\HUST@language}{chinese}}{
    \def\indexname{索引}
    \def\figurename{图}
    \def\tablename{表}
    \AtBeginDocument{\def\listingscaption{代码}}
    \def\bibname{参考文献}
    \def\contentsname{目\hspace{1em}录}
    \def\contentsnamenospace{目录}
    \def\appendixname{附录}
    \def\HUST@listfigurename{插图索引}
    \def\HUST@listtablename{表格索引}
    \def\equationautorefname{公式}
    \def\footnoteautorefname{脚注}
    \def\itemautorefname~#1\null{第~#1~项\null}
    \def\figureautorefname{图}
    \def\tableautorefname{表}
    \def\appendixautorefname{附录}
    \expandafter\def\csname\appendixname autorefname\endcsname{\appendixname}
    \def\chapterautorefname~#1\null{第\zhnumber{#1}章\null}
    \def\sectionautorefname~#1\null{#1~小节\null}
    \def\subsectionautorefname~#1\null{#1~小节\null}
    \def\subsubsectionautorefname~#1\null{#1~小节\null}
    \def\FancyVerbLineautorefname~#1\null{第~#1~行\null}
    \def\pageautorefname~#1\null{第~#1~页\null}
    \def\lstlistingautorefname{代码}
    \def\definitionautorefname{定义}
    \def\propositionautorefname{命题}
    \def\lemmaautorefname{引理}
    \def\theoremautorefname{定理}
    \def\axiomautorefname{公理}
    \def\corollaryautorefname{推论}
    \def\exerciseautorefname{练习}
    \def\exampleautorefname{例}
    \def\proofautorefname{证明}
    \SetAlgorithmName{算法}{算法}{算法索引}
    \SetAlgoProcName{过程}{过程}
    \SetAlgoFuncName{函数}{函数}
    \def\AlgoLineautorefname~#1\null{第~#1~行\null}
}{}
\ifthenelse{\equal{\HUST@language}{chinese}}{}{
    \def\HUST@listfigurename{List of Figures}
    \def\HUST@listtablename{List of Tables}
    \def\equationautorefname{Equation}
    \def\footnoteautorefname{Footnote}
    \def\itemautorefname{Item}
    \def\figureautorefname{Figure}
    \def\tableautorefname{Table}
    \def\appendixautorefname{Appendix}
    \expandafter\def\csname\appendixname autorefname\endcsname{\appendixname}
    \def\chapterautorefname{Chapter}
    \def\sectionautorefname{Section}
    \def\subsectionautorefname{Subsection}
    \def\subsubsectionautorefname{Sub-subsection}
    \def\FancyVerbLineautorefname{Line}
    \def\pageautorefname{Page}
    \def\lstlistingautorefname{Code Fragment}
    \def\definitionautorefname{Definition}
    \def\propositionautorefname{Proposition}
    \def\lemmaautorefname{Lemma}
    \def\theoremautorefname{Theorem}
    \def\axiomautorefname{Axiom}
    \def\corollaryautorefname{Corollary}
    \def\exerciseautorefname{Exercise}
    \def\exampleautorefname{Example}
    \def\proofautorefname{Proof}
    \SetAlgorithmName{Algorithm}{Algorithm}{List of Algorithms}
    \SetAlgoProcName{Procedure}{Procedure}
    \SetAlgoFuncName{Function}{Function}
    \def\AlgoLineautorefname{Line}
}
\def\HUST@classnotitle{{分}\hfill{类}\hfill{号}}
\def\HUST@stunotitle{学号}
\def\HUST@schoolcodetitle{学校代码}
\def\HUST@secrettile{密级}
\def\HUST@zhauthortitle{{学}\hfill{位}\hfill{申}\hfill{请}\hfill{人}}
\def\HUST@zhmajortitle{{学}\hfill{科}\hfill{专}\hfill{业}}
\def\HUST@zhsupervisortitle{{指}\hfill{导}\hfill{教}\hfill{师}}
\def\HUST@zhasssupervisortitle{{副}\hfill{指}\hfill{导}\hfill{教}\hfill{师}}
\def\HUST@zhdatetitle{{答}\hfill{辩}\hfill{日}\hfill{期}}

\def\HUST@enauthortitle{Student}
\def\HUST@enmajortitle{Major}
\def\HUST@ensupervisortitle{Supervisor}
\def\HUST@enasssupervisortitle{Co-Supervisor}

\def\HUST@originaldeclare{独创性声明}
\long\def\HUST@originaldeclaretext{
  本人声明所呈交的学位论文是我个人在导师的指导下进行的研究工作及取得的研究成果。尽我所知，除文中已标明引用的内容外，本论文不包含任何其他人或集体已经发表或撰写过的研究成果。对本文的研究做出贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。
}
\def\HUST@zhauthorsig{学位论文作者签名：}
\def\HUST@zhdatefield{日期：\hspace{2em}年\hspace{2em}月\hspace{2em}日}

\def\HUST@authtitle{学位论文版权使用授权书}
\long\def\HUST@authorizationtext{
  本学位论文作者完全了解学校有关保留、使用学位论文的规定，即：学校有权保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权华中科技大学可以将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。
}
\long\def\HUST@authorizationaddon{
 本论文属于
 \tabincell{l}{
  保密$\square$，在~\makebox[2em]{\hrulefill} 年解密后适用本授权书。\\
  不保密~$\square$。
 }
}
\def\HUST@authorizationcheck{（请在以上方框内打“$\surd$”）}
\def\HUST@zhteachersig{指导教师签名：}

\def\HUST@zhabstractname{摘\hspace{1em}要}
\def\HUST@zhabstractnamenospace{摘要}
\def\HUST@zhkeywordstitle{关键词：}
\def\HUST@enabstractname{Abstract}
\def\HUST@enkeywordstitle{Key words:}

\ifthenelse{\equal{\HUST@language}{chinese}}{
  \def\HUST@ackname{致\hspace{1em}谢}
  \def\HUST@acknamenospace{致谢}
  \def\HUST@publicationtitle{攻读学位期间发表的学术论文}
}{
  \def\HUST@ackname{Acknowledge}
  \def\HUST@acknamenospace{Acknowledge}
  \def\HUST@publicationtitle{Publication}
}

\ifthenelse{\equal{\HUST@degree}{none}}{
  \def\HUST@zhapplyname{学位论文}
  \def\HUST@enapplyname{A Thesis Submitted in Partial Fulfillment of the Requirements for the Degree}
}{}

\ifthenelse{\equal{\HUST@degree}{fyp}}{
  \def\HUST@zhapplyname{毕业设计论文}
  \def\HUST@enapplyname{A Thesis Submitted in Partial Fulfillment of the Requirements for Final Year Project}
}{}

\ifthenelse{\equal{\HUST@degree}{bachelor}}{
  \def\HUST@zhapplyname{学士学位论文}
  \def\HUST@enapplyname{A Thesis Submitted in Partial Fulfillment of the Requirements for the Degree of Bachelor}
}{}

\ifthenelse{\equal{\HUST@degree}{master}}{
  \def\HUST@zhapplyname{硕士学位论文}
  \def\HUST@enapplyname{A Thesis Submitted in Partial Fulfillment of the Requirements for the Degree of Master}
}{}

\ifthenelse{\equal{\HUST@degree}{phd}}{
  \def\HUST@zhapplyname{博士学位论文}
  \def\HUST@enapplyname{A Thesis Submitted in Partial Fulfillment of the Requirements for the Ph.D}
}{}

\ifthenelse{\equal{\HUST@language}{chinese}}{
  \hypersetup{pdfsubject={\HUST@zhschoolname\HUST@zhapplyname}}
}{
  \hypersetup{pdfsubject={\HUST@enapplyname}}
}
\def\listfigurename{\HUST@listfigurename}
\def\listtablename{\HUST@listtablename}
\allowdisplaybreaks[4]
\abovedisplayskip=10bp plus 2bp minus 2bp
\abovedisplayshortskip=10bp plus 2bp minus 2bp
\belowdisplayskip=\abovedisplayskip
\belowdisplayshortskip=\abovedisplayshortskip
\numberwithin{equation}{chapter}
\theoremnumbering{arabic}
\ifthenelse{\equal{\HUST@language}{chinese}}{
  \theoremseparator{：}
}{
  \theoremseparator{:}
}
\theorempreskip{1.2ex plus 0ex minus 1ex}
\theorempostskip{1.2ex plus 0ex minus 1ex}
\theoremheaderfont{\normalfont\bfseries\HEI}
\theoremsymbol{}

\theoremstyle{definition}
\theorembodyfont{\normalfont}
\ifthenelse{\equal{\HUST@language}{chinese}}{
  \newtheorem{definition}{定义}[chapter]
}{
  \newtheorem{definition}{Definition}[chapter]
}

\theoremstyle{plain}
\theorembodyfont{\itshape}
\ifthenelse{\equal{\HUST@language}{chinese}}{
  \newtheorem{proposition}{命题}[chapter]
  \newtheorem{lemma}{引理}[chapter]
  \newtheorem{theorem}{定理}[chapter]
  \newtheorem{axiom}{公理}[chapter]
  \newtheorem{corollary}{推论}[chapter]
  \newtheorem{exercise}{练习}[chapter]
  \newtheorem{example}{例}[chapter]
  \def\proofname{\hei{证明}}
}{
  \newtheorem{proposition}{Proposition}[chapter]
  \newtheorem{lemma}{Lemma}[chapter]
  \newtheorem{theorem}{Theorem}[chapter]
  \newtheorem{axiom}{Axiom}[chapter]
  \newtheorem{corollary}{Corollary}[chapter]
  \newtheorem{exercise}{Exercise}[chapter]
  \newtheorem{example}{Example}[chapter]
  \def\proofname{\textbf{Proof}}
}
\setlength{\intextsep}{0.7\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip}
\setlength{\textfloatsep}{0.8\baselineskip plus 0.1\baselineskip minus 0.2\baselineskip}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}
\def\@cline#1-#2\@nil{%
  \omit
  \@multicnt#1%
  \advance\@multispan\m@ne
  \ifnum\@multicnt=\@ne\@firstofone{&\omit}\fi
  \@multicnt#2%
  \advance\@multicnt-#1%
  \advance\@multispan\@ne
  \leaders\hrule\@height\arrayrulewidth\hfill
  \cr
  \noalign{\nobreak\vskip-\arrayrulewidth}}
\newif\ifHUST@useoldtabular
\HUST@useoldtabularfalse
\def\TurnOffTabFontSetting{\HUST@useoldtabulartrue}
\def\TurnOnTabFontSetting{\HUST@useoldtabularfalse}
\AtBeginEnvironment{tabular}{
  \ifHUST@useoldtabular\else
    \changefont{size=11pt,linespread=1.4}
  \fi
}
\AtBeginEnvironment{tabularx}{
  \ifHUST@useoldtabular\else
    \changefont{size=11pt,linespread=1.4}
  \fi
}
\AtBeginEnvironment{longtable}{
  \ifHUST@useoldtabular\else
    \changefont{size=11pt,linespread=1.4}
  \fi
}
\DeclareCaptionFont{HUST@captionfont}{\changefont{size=11pt}}
\DeclareCaptionLabelFormat{HUST@caplabel}{#1~#2}
\captionsetup{
  font=HUST@captionfont,
  labelformat=HUST@caplabel,
  format=hang,
  labelsep=quad,
  skip=12pt
}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\definecolor{HUST@lstgreen}{rgb}{0,0.6,0}
\definecolor{HUST@lstmauve}{rgb}{0.58,0,0.82}

\lstset{
  basicstyle=\footnotesize\ttfamily\changefont{linespread=1}\FANGSONG,
  keywordstyle=\color{blue}\bfseries,
  commentstyle=\color{HUST@lstgreen}\itshape\KAI,
  stringstyle=\color{HUST@lstmauve},
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  numbers=left,
  numberstyle=\tiny\color{black},
  frame=lines,
  rulecolor=\color{black},
  breaklines=true
}
\setcounter{secnumdepth}{3}
\titleformat{\chapter}
  {
    \bfseries
    \HEI
    \centering
    \changefont{size=18pt}
  }
  {
    \ifthenelse{\equal{\HUST@language}{chinese}}
    {\zhnumber{\thechapter}}
    {Chapter~\thechapter}
  }
  {1em}
  {}
\titlespacing*{\chapter}{0pt}{0pt}{20pt}
\titleformat*{\section}{\bfseries\HEI\changefont{size=16pt}}
\titlespacing*{\section}{0pt}{18pt}{6pt}
\titleformat*{\subsection}{\bfseries\HEI\changefont{size=14pt}}
\titlespacing*{\subsection}{0pt}{12pt}{6pt}
\titleformat*{\subsubsection}{\bfseries\HEI\changefont{size=13pt}}
\titlespacing*{\subsubsection}{0pt}{12pt}{6pt}
\setcounter{tocdepth}{1}
\contentsmargin{2.0em}
\newskip\HUST@oldcftbeforechapskip
\HUST@oldcftbeforechapskip=\cftbeforechapskip
\newskip\HUST@oldcftbeforesecskip
\HUST@oldcftbeforesecskip=\cftbeforesecskip
\let\HUST@oldl@chapter\l@chapter
\let\HUST@oldl@section\l@section
\let\HUST@oldl@subsection\l@subsection
\def\l@chapter#1#2{\HUST@oldl@chapter{#1}{#2}\cftbeforechapskip=3pt}
\def\l@section#1#2{\HUST@oldl@section{#1}{#2}\cftbeforechapskip=\HUST@oldcftbeforechapskip\cftbeforesecskip=3pt}
\def\l@subsection#1#2{\HUST@oldl@subsection{#1}{#2}\cftbeforesecskip=\HUST@oldcftbeforesecskip}
\renewcommand*\cftfigpresnum{\figurename~}
\newlength{\HUST@cftfignumwidth@tmp}
\settowidth{\HUST@cftfignumwidth@tmp}{\cftfigpresnum}
\addtolength{\cftfignumwidth}{\HUST@cftfignumwidth@tmp}
\renewcommand{\cftfigaftersnumb}{\quad~}
\renewcommand*\cfttabpresnum{\tablename~}
\newlength{\HUST@cfttabnumwidth@tmp}
\settowidth{\HUST@cfttabnumwidth@tmp}{\cfttabpresnum}
\addtolength{\cfttabnumwidth}{\HUST@cfttabnumwidth@tmp}
\renewcommand{\cfttabaftersnumb}{\quad~}
\let\ps@plain\ps@fancy
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\ifthenelse{\equal{\HUST@degree}{fyp}}{
  \fancyfoot[R]{\thepage}
}{
  \fancyfoot[C]{\thepage}
}

\ifthenelse{\equal{\HUST@language}{english-draft}}{}{
  \ifHUST@finalformat\else
    \fancyhead[C]{
      \ziju{1em}{\kai{\changefont{size=14pt}\HUST@zhschoolname\HUST@zhapplyname}}
      \vskip -5pt
      \vbox{
        \hrule width \textwidth height 2pt
      }
    }
  \fi
}
\setlist{noitemsep,partopsep=0pt,topsep=.8ex}
\setlist[1]{labelindent=\parindent}
\setlist[enumerate,1]{label=\arabic*.,ref=\arabic*}
\setlist[enumerate,2]{label*=\arabic*,ref=\theenumi.\arabic*}
\setlist[enumerate,3]{label=\emph{\alph*}),ref=\theenumii\emph{\alph*}}
\setlist[description]{font=\bfseries\HEI}
\MakePerPage{footnote}
\def\frontmatter{
  \clearpage
  \@mainmatterfalse
  \pagenumbering{Roman}
}
\def\mainmatter{
  \clearpage
  \@mainmattertrue
  \pagenumbering{arabic}
}
\def\backmatter{
  \clearpage
  \@mainmatterfalse
  \settocdepth{chapter}
  \hypersetup{bookmarksopenlevel=0}
}
\def\HUST@zhtitlepage{
  \begin{center}
  \vspace*{-1.0cm}
  \parbox[t][2.2cm][t]{\textwidth}{
    \begin{center}
      \setlength{\tabcolsep}{0pt}
      \setlength{\extrarowheight}{12pt}
      \TurnOffTabFontSetting
      \changefont{size=14pt,linespread=1.2}
      \begin{tabularx}{\textwidth}{p{4em}p{5em}Xp{2em}p{12em}}
        \HUST@classnotitle    & \makebox[5em][l]{\rule[-2.0pt]{5em}{1pt}\hspace{-5em}\hfill\texttt{\HUST@classno}\hfill} & &
        \HUST@stunotitle      & \makebox[12em][l]{\rule[-2.0pt]{12em}{1pt}\hspace{-12em}\hfill\texttt{\HUST@stuno}\hfill} \\
        \HUST@schoolcodetitle & \makebox[5em][l]{\rule[-2.0pt]{5em}{1pt}\hspace{-5em}\hfill\texttt{\HUST@schoolcode}\hfill} & &
        \HUST@secrettile      & \makebox[12em][l]{\rule[-2.0pt]{12em}{1pt}\hspace{-12em}\hfill\texttt{\HUST@secretlevel}\hfill}
      \end{tabularx}
      \TurnOnTabFontSetting
    \end{center}
    }
  \parbox[t][6cm][t]{\textwidth}{
    \vspace{1.0cm}
    \begin{center}
    \includegraphics[scale=1.1]{hust-title.pdf}\\[0.8cm]
    \ziju{10bp}{\changefont{size=42pt}\HEI\HUST@zhapplyname}
    \end{center}
  }
  \parbox[t][4.8cm][t]{.8\textwidth}{
    \vspace{1.4cm}
    \begin{center}
    \changefont{size=22pt,linespread=1.6}\hei{\HUST@zhtitle}
    \end{center}
  }
  \parbox[t][7.4cm][t]{\textwidth}{
    \vspace{1.2cm}
    \begin{center}
    \changefont{size=18pt,linespread=1.5}
    \setlength{\extrarowheight}{0pt}
    \TurnOffTabFontSetting
    \begin{tabular}{p{5em}@{{：\hspace{1em}}}l}
    \HUST@zhauthortitle       & {\HUST@zhauthor} \\
    \HUST@zhmajortitle      & {\HUST@zhmajor} \\
    \HUST@zhsupervisortitle & {\HUST@zhsupervisor} \\
    \ifthenelse{\equal{\HUST@zhasssupervisor}{}}{}{
      \HUST@zhasssupervisortitle & {\HUST@zhasssupervisor} \\
    }
    \HUST@zhdatetitle & \zhdateformat
    \end{tabular}
    \TurnOnTabFontSetting
    \end{center}
  }
  \end{center}
}
\def\HUST@entitlepage{
  \begin{center}
    \parbox[t][4.5cm][t]{.9\textwidth}{
      \begin{center}
        \changefont{size=16pt,linespread=1.1}
        \HUST@enapplyname
      \end{center}
    }
    \parbox[t][5.7cm][t]{\textwidth}{
      \begin{center}
        \changefont{size=18pt,linespread=1.3}
        \textbf{\textsf{\HUST@entitle}}
      \end{center}
    }
    \parbox[t][5cm][t]{.8\textwidth}{
      \begin{center}
      \setlength{\extrarowheight}{5pt}
      \changefont{size=16pt,linespread=1.5}
      \TurnOffTabFontSetting
      \begin{tabular}{l@{~:~}p{18em}}
        \HUST@enauthortitle     & {\HUST@enauthor} \\
        \HUST@enmajortitle      & {\HUST@enmajor} \\
        \HUST@ensupervisortitle & {\HUST@ensupervisor}
        \ifthenelse{\equal{\HUST@enasssupervisor}{}}{}{
          \\ \HUST@enasssupervisortitle & {\HUST@enasssupervisor}
        }
      \end{tabular}
      \TurnOnTabFontSetting
      \end{center}
    }
    \parbox[t][7cm][b]{.8\textwidth}{
      \begin{center}
      \bfseries
      \changefont{size=14pt,linespread=2.0}
      \HUST@enschoolname \\
      \HUST@enaddress \\
      \endateformat
    \end{center}
    }
  \end{center}
}
\def\HUST@authorization{
  \centerline{\changefont{size=16pt} \HEI \HUST@originaldeclare}
  \vspace{1cm}
  {
    \changefont{size=12pt,linespread=2.0}
    \indent\HUST@originaldeclaretext
  }
  \\[1.9cm]
  \parbox[t]{\textwidth}{
    \changefont{size=12pt,linespread=1.5}
    \TurnOffTabFontSetting
    \hfill\begin{tabular}{ll}
        \HUST@zhauthorsig & \hspace{2em}\\
        \HUST@zhdatefield & \hspace{2em}\\
    \end{tabular}
    \TurnOnTabFontSetting
  }
  \\[1.9cm]
  \centerline{\changefont{size=16pt} \HEI \HUST@authtitle}
  \\[1cm]
  {
    \changefont{size=12pt,linespread=2.0}
    \indent\HUST@authorizationtext \\
    \indent\HUST@authorizationaddon \\
    \indent\HUST@authorizationcheck
  }
  \\[1.9cm]
  \hspace{2em}\parbox[t]{.9\textwidth}{
    \changefont{size=12pt,linespread=1.5}
    \TurnOffTabFontSetting
    \begin{tabular}{ll}
        \HUST@zhauthorsig & \hspace{2em}\\
        \HUST@zhdatefield & \hspace{2em}\\
    \end{tabular}
    \hfill
    \begin{tabular}{ll}
        \HUST@zhteachersig & \hspace{2em}\\
        \HUST@zhdatefield & \hspace{2em}\\
    \end{tabular}
    \TurnOnTabFontSetting
  }
  \vfill
}
\def\maketitle{
  \newgeometry{
    a4paper,
    top=1.2in,
    bottom=1.2in,
    left=1in,
    right=1in,
  }
  \let\HUST@oldthepage\thepage
  \ifthenelse{\equal{\HUST@language}{english-draft}}
  {\def\thepage{Titlepage}}
  {\def\thepage{封面}}
  \begin{titlepage}
    \ifthenelse{\equal{\HUST@language}{english-draft}}{}{
      \thispagestyle{empty}
      \HUST@zhtitlepage
      \clearpage
    }
    \thispagestyle{empty}
    \HUST@entitlepage
  \end{titlepage}
  \ifthenelse{\equal{\HUST@language}{english-draft}}{}{
    \def\thepage{版权页}
    \thispagestyle{empty}
    \HUST@authorization
    \clearpage
  }
  \restoregeometry
  \let\thepage\HUST@oldthepage
  \setcounter{page}{1}
}
\let\makecover\maketitle
\def\HUST@zhabstractpage{
  \chapter*{\HUST@zhabstractname}
  \begingroup
  \changefont{size=10.5pt}
  \HUST@zhabstract \par
  \vskip 1.2ex
  \noindent\hei{\HUST@zhkeywordstitle}\hspace{.8em} \HUST@zhkeywords
  \endgroup
}
\def\HUST@enabstractpage{
  \chapter*{\textsf{\HUST@enabstractname}}
  \begingroup
  \changefont{size=10.5pt}
  \HUST@enabstract \par
  \vskip 1.2ex
  \noindent\textbf{\HUST@enkeywordstitle}\hspace{.8em} \HUST@enkeywords
  \endgroup
}
\def\makeabstract{
  \phantomsection
  \ifthenelse{\equal{\HUST@language}{chinese}}{
    \addcontentsline{toc}{chapter}{\HUST@zhabstractnamenospace}
  }{
    \addcontentsline{toc}{chapter}{\HUST@enabstractname}
  }
  \ifthenelse{\equal{\HUST@language}{english-draft}}{}{
    \HUST@zhabstractpage
    \clearpage
  }
  \HUST@enabstractpage
  \clearpage
}
\let\HUST@tableofcontents\tableofcontents
\def\tableofcontents{
  \ifthenelse{\equal{\HUST@language}{chinese}}{
    \pdfbookmark{\contentsnamenospace}{\contentsnamenospace}
  }{
    \pdfbookmark{\contentsname}{\contentsname}
  }
  \HUST@tableofcontents
  \clearpage
}
\newenvironment{ack}{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{\HUST@acknamenospace}
  \chapter*{\HUST@ackname}
  \begingroup
  \changefont{size=10.5pt}
}{
  \endgroup
}
\newenvironment{publications}{
  \clearpage
  \ifHUST@inappendix
    \chapter{\HUST@publicationtitle}
  \else
    \phantomsection
    \addcontentsline{toc}{chapter}{\HUST@publicationtitle}
    \chapter*{\HUST@publicationtitle}
  \fi
  \begin{enumerate}[labelindent=0pt,label={[\arabic*]},itemsep=0.5ex]
  \changefont{size=10.5pt,linespread=1}
}{
  \end{enumerate}
}
\bibliographystyle{hustthesis}
\let\HUST@bibliography\bibliography
\def\bibliography#1{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{\bibname}
  \begingroup
  \changefont{size=10.5pt,linespread=1}
  \setlength\bibsep{0.5ex}
  \HUST@bibliography{#1}
  \endgroup
}
\newif\ifHUST@inappendix
\HUST@inappendixfalse
\newif\ifHUST@appendix@resetmainmatter
\HUST@appendix@resetmainmatterfalse
\renewenvironment{appendix}{
  \if@mainmatter
    \HUST@appendix@resetmainmatterfalse
  \else
    \HUST@appendix@resetmainmattertrue
    \@mainmattertrue
  \fi
  \appendixtitletocon
  \appendices
  \titleformat{\chapter}
  {
    \bfseries\HEI
    \centering
    \changefont{size=18pt}
  }
  {\appendixname\,\thechapter}
  {1em}
  {}
  \HUST@inappendixtrue
}{
  \endappendices
  \HUST@inappendixfalse
  \ifHUST@appendix@resetmainmatter
    \HUST@appendix@resetmainmatterfalse
    \@mainmatterfalse
  \else\fi
}
\let\HUST@listoffigures\listoffigures
\def\listoffigures{
  \clearpage
  \ifHUST@inappendix
    \addtocounter{chapter}{1}
    \def\listfigurename{\appendixname\,\thechapter\hspace{1em}\HUST@listfigurename}
  \else
    \def\listfigurename{\HUST@listfigurename}
  \fi
  \phantomsection
  \ifHUST@inappendix
    \addcontentsline{toc}{chapter}{\thechapter\hspace{1em}\HUST@listfigurename}
  \else
    \addcontentsline{toc}{chapter}{\listfigurename}
  \fi
  \HUST@listoffigures
  \def\listfigurename{\HUST@listfigurename}
}
\let\HUST@listoftables\listoftables
\def\listoftables{
  \clearpage
  \ifHUST@inappendix
    \addtocounter{chapter}{1}
    \def\listtablename{\appendixname\,\thechapter\hspace{1em}\HUST@listtablename}
  \else
    \def\listtablename{\HUST@listtablename}
  \fi
  \phantomsection
  \ifHUST@inappendix
    \addcontentsline{toc}{chapter}{\thechapter\hspace{1em}\HUST@listtablename}
  \else
    \addcontentsline{toc}{chapter}{\listtablename}
  \fi
  \HUST@listoftables
  \def\listtablename{\HUST@listtablename}
}
\def\email#1{
  \href{mailto:#1}{\texttt{#1}}
}
\endinput
%%
%% End of file `hustthesis.cls'.
