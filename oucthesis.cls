\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oucthesis}[OUC Thesis Template]

\newif\ifouc@pdf
\DeclareOption{print}{\ouc@pdffalse}
\DeclareOption{pdf}{\ouc@pdftrue}

\newif\ifouc@overleaf
\DeclareOption{overleaf}{\ouc@overleaftrue}

\newif\ifouc@count
\ouc@countfalse
\DeclareOption{count}{\ouc@counttrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{print}
\ProcessOptions\relax

\ifouc@pdf
  \PassOptionsToClass{openany}{ctexbook}
\else
\PassOptionsToClass{openright}{ctexbook}
\fi
\PassOptionsToClass{twoside}{ctexbook}
\PassOptionsToPackage{quiet}{xeCJK}
\LoadClass[UTF8,a4paper,zihao=-4]{ctexbook}
\PassOptionsToClass{scheme=chinese}{ctexbook}

% ===============================================
% Required Package
\RequirePackage{amsmath}
\RequirePackage{mathtools}
\RequirePackage{unicode-math}
\RequirePackage[driver=xetex]{geometry}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{color}
\RequirePackage{titletoc}
\RequirePackage{caption}
\RequirePackage[perpage]{footmisc}
\RequirePackage{url}
\RequirePackage{calc}
\RequirePackage{dashrule}
\RequirePackage{algorithm}
\RequirePackage{algorithmicx}
\RequirePackage[sort&compress]{natbib}
\RequirePackage{bashful}
\RequirePackage{xstring}
\RequirePackage{geometry}
\RequirePackage{ragged2e}
\RequirePackage{letltxmacro}
\RequirePackage{verbatim}
\RequirePackage{titlesec}
\RequirePackage{xeCJK}
\RequirePackage{xparse}
\RequirePackage{keyval}
\RequirePackage{hyperref}

\ifouc@overleaf
  \setCJKmainfont{simsun.ttc}
  \setCJKfamilyfont{zhsong}[AutoFakeBold = {2.17}]{simsun.ttc}
\else
  \setCJKmainfont{SimSun}
  \setCJKfamilyfont{zhsong}[AutoFakeBold = {2.17}]{SimSun}
\fi
\setmainfont{Times New Roman}
\renewcommand{\songti}{\CJKfamily{zhsong}}

% 中英文论文题目
% 示例：\title{中文题目}{英文题目}
\newcommand{\zhtitle}{}
\newcommand{\entitle}{}
\newcommand{\settitle}[2]{
  \title{#1}
  \gdef\zhtitle{#1}
  \gdef\entitle{#2}
}


% 题名页
\input{data/title_page.cls}
% 学位论文答辩委员会页
\input{data/committee.cls}
% 独创声明和版权使用授权书
\input{data/statement.cls}

% ===============================================
% Changable parameters
\newcommand\ouc@atendpackage{\csname ctex_at_end_package:nn\endcsname}
\ouc@atendpackage{hyperref}{
  \hypersetup{
    bookmarksnumbered  = true,
    bookmarksopen      = true,
    bookmarksopenlevel = 1,
    linktoc            = all,
    unicode            = true,
    psdextra           = true,
  }
  \ifouc@pdf
    \hypersetup{
      colorlinks = true,
      allcolors  = blue,
    }
  \else
    \hypersetup{hidelinks}
  \fi
}

% 字数统计
\ifouc@count
  \immediate\write18{texcount -1 -sum -char -merge main.tex > words.count}
  \newread\wordfile
  \openin\wordfile=words.count
  \read\wordfile to \worddata
  \closein\wordfile
  \newcommand{\ouc@wordcount}{\worddata}
\fi

% ===============================================
% Custom Command

\renewenvironment{titlepage}{
  \clearpage
  \thispagestyle{empty} % 无页眉、无页脚
}{\clearpage}

\newcommand\blankpage{
  \null
  \thispagestyle{empty}
  \addtocounter{page}{-1}
  \newpage
}

\newcommand\zhspace[1][1]{\hspace{#1\ccwd}}

% ===============================================
% Fonts Setting

\newdimen\bp@
\bp@=1bp
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12\bp@}{23\bp@}%
  \abovedisplayskip 12\bp@ \@plus3\bp@ \@minus7\bp@
  \abovedisplayshortskip \z@ \@plus3\bp@
  \belowdisplayshortskip 6.5\bp@ \@plus3.5\bp@ \@minus3\bp@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI
}
% \normalsize
\renewcommand\small{%
  \@setfontsize\small{10.5\bp@}{19.25\bp@}%
  \abovedisplayskip 10.5\bp@ \@plus3\bp@ \@minus6\bp@
  \abovedisplayshortskip \z@ \@plus3\bp@
  \belowdisplayshortskip 6.5\bp@ \@plus3.5\bp@ \@minus3\bp@
  \belowdisplayskip \abovedisplayskip
}
\renewcommand\footnotesize{%
  \@setfontsize\footnotesize{9\bp@}{16.5\bp@}%
  \abovedisplayskip 9\bp@ \@plus2\bp@ \@minus5\bp@
  \abovedisplayshortskip \z@ \@plus3\bp@
  \belowdisplayshortskip 6\bp@ \@plus3\bp@ \@minus3\bp@
  \belowdisplayskip \abovedisplayskip
}
\renewcommand\scriptsize{\@setfontsize\scriptsize{7.5\bp@}{13.75\bp@}}
\renewcommand\tiny{\@setfontsize\tiny{6.5\bp@}{11.92\bp@}}
\renewcommand\large{\@setfontsize\large{15\bp@}{27.5\bp@}}
\renewcommand\Large{\@setfontsize\Large{18\bp@}{33\bp@}}
\renewcommand\LARGE{\@setfontsize\LARGE{22\bp@}{40.33\bp@}}
\renewcommand\huge{\@setfontsize\huge{24\bp@}{44\bp@}}
\renewcommand\Huge{\@setfontsize\Huge{26\bp@}{47.67\bp@}}

% \linespread{1}\selectfont
\newcommand\ouc@setchinese{
  \xeCJKResetPunctClass
}
\newcommand\ouc@setenglish{
  \xeCJKDeclareCharClass{HalfLeft}{"2018, "201C}
  \xeCJKDeclareCharClass{HalfRight}{
    "00B7, "2019, "201D, "2013, "2014, "2025, "2026, "2E3A
  }
}
\ouc@setchinese

% ===============================================
% Page Format 

% 页边距设置：上、下、左、右边距均为25 mm，应用于整篇文档
% 页眉边距 15 mm
% 页脚边距15 mm
\geometry{
  paper       = a4paper,
  includehead = false,
  includefoot = false,
  vmargin     = 25mm,
  headheight  = 6mm,
  headsep     = 4mm,
  footskip    = 10mm,
  hmargin     = 25mm
}
\pagestyle{fancy}
\let\sectionmark\@gobble

% ===============================================
% Header and Footer Format

% 页眉采用宋体五号字（10.5pt）居中书写，页眉底下划一条线
\newcommand\ouc@hf@font{\fontsize{10.5\bp@}{12\bp@}\selectfont}
\fancypagestyle{title}{
  \fancyhf{} % 清除当前的页眉和页脚设置
  \fancyhead[CO]{\ouc@hf@font 中国海洋大学硕（博）士学位论文} % 奇数页页眉
  \fancyhead[CE]{\ouc@hf@font\@title}  % 偶数页页眉
  \fancyfoot[C]{\ouc@hf@font\thepage}  % 页码
  \renewcommand{\headrulewidth}{0.4pt} % 添加页眉下划线
  \ifouc@count
    \fancyfoot[R]{\color{gray}\ouc@hf@font \ouc@wordcount words} % 右下角显示全文字数
  \fi
}
\fancypagestyle{plain}{
  \fancyhf{} % 清除当前的页眉和页脚设置
  \renewcommand{\headrulewidth}{0pt} % 无页眉线
  \fancyhead[C]{} % 页眉内容为空
  \fancyfoot[C]{\ouc@hf@font\thepage} % 显示页码
}


\ctexset{
  chapter = {
    name        = {,},
    format      = \centering,
    nameformat  = {},
    number      = \thechapter,
    aftername   = \hspace{\ccwd},
    beforeskip  = 24bp, % 24磅 段前间距
    afterskip   = 18bp, % 18磅 段后间距
    fixskip     = true,
  },
}

\NewDocumentCommand\ouc@chapter{o m}{
  \IfValueTF{#1} % 检查是否提供了可选参数
  {
    \chaptermark{#1} % 页眉使用可选参数
    \makeatletter
    \c@secnumdepth=-1 % 抑制章节编号
    \makeatother
    \chapter[#1]{#2} % 目录显示 #1，正文显示 #2
  }{
    \chaptermark{#2} % 页眉使用必选参数
    \makeatletter
    \c@secnumdepth=-1 % 抑制章节编号
    \makeatother
    \chapter{#2}
  }
}

% 调整页码格式，但不重置页码
\newcommand\pagenumberingnoreset[1]{
  \gdef\thepage{\csname @#1\endcsname\c@page}
}

\let\standardclearpage\clearpage

% 英文目录格式
\newcommand\tableofengcontents{
  \clearpage
  \pagestyle{plain}
  \pagenumberingnoreset{Roman}
  \renewcommand{\headrulewidth}{0pt} % 取消页眉横线
  \vspace{24pt}
  \chapter*{\zihao{3}\textbf{\textrm{Contents}}}
  \vspace{18pt}
  {\linespread{1}\@starttoc{toe}}
}
\newcommand\addengcontents[2]{
  \addcontentsline{toe}{#1}{\protect\numberline{\csname the#1\endcsname}#2}}
\newcommand\addengcontent[2]{\addcontentsline{toe}{#1}{#2}}
\newcommand\enchapter[1]{\addengcontents{chapter}{#1}}
\newcommand\ensection[1]{\addengcontents{section}{#1}}
\newcommand\ensubsection[1]{\addengcontents{subsection}{#1}}


% 中文目录格式
\renewcommand\tableofcontents{
  \clearpage
  \pagestyle{plain}
  \pagenumberingnoreset{Roman}
  \renewcommand{\headrulewidth}{0pt} % 取消页眉横线
  \vspace{24pt}
  \chapter*{\heiti\zihao{3}目\zhspace[2]录}
  \vspace{18pt}
  {\linespread{1}\@starttoc{toc}}
}

\newcommand\ouc@leaders{\titlerule*[4\bp@]{\textperiodcentered}}

\titlecontents{chapter}
[\z@]{\vspace*{6pt}\songti\zihao{4}}
{\contentspush{\thecontentslabel\unskip\hspace{\ccwd}}}{}
{\unskip\hspace{\ccwd}\ouc@leaders\contentspage}
\titlecontents{section}
[2\ccwd]{\vspace*{6pt}\songti\zihao{-4}}
{\contentspush{\thecontentslabel\hspace{\ccwd}}}{}
{ \ouc@leaders\contentspage}
\titlecontents{subsection}
[4\ccwd]{\vspace*{6pt}\songti\zihao{-4}}
{\contentspush{\thecontentslabel\hspace{\ccwd}}}{}
{ \ouc@leaders\contentspage}

% 中文摘要
\newenvironment{abstract}{
  \clearpage
  \pagestyle{plain}
  % 从中文摘要开始进行罗马数字页码编号
  \pagenumbering{Roman}
  \ouc@setchinese
  \let\clearpage\relax
  \phantomsection\addengcontent{chapter}{Abstract (In Chinese)}
  \ouc@chapter[摘要]{\heiti\zihao{3}摘\zhspace[2]要}
  \let\clearpage\standardclearpage
  \songti\zihao{-4}
  \setlength{\baselineskip}{20pt}
  \vspace*{15pt} % 模拟标题的单倍行距
}{
  \noindent\hangindent=4\ccwd\relax
  \clearpage
  \pagenumberingnoreset{arabic}
}

% 英文摘要
\newenvironment{enabstract}{
  \clearpage
  \pagestyle{plain}
  \pagenumberingnoreset{Roman}
  \ouc@setenglish
  \let\clearpage\relax
  \phantomsection\addengcontent{chapter}{Abstract (In English)}
  \ouc@chapter[Abstract]{\zihao{3}\textbf{\textrm{ABSTRACT}}}
  \let\clearpage\standardclearpage
  \setlength{\baselineskip}{20pt}
  \vspace*{15pt} % 模拟标题的单倍行距
}{
  \noindent\hangindent=4\ccwd\relax
  \clearpage
  \pagenumberingnoreset{arabic}
}

% 插图清单
\newcommand{\setlistoffigures}{
  \begingroup
    \newcommand{\name}{插图清单}
    \renewcommand{\numberline}[1]{图~##1\hspace*{1em}}
    \renewcommand{\listfigurename}{\heiti\zihao{3}\name}
    \begin{center}
      \clearpage
      \phantomsection
      \addengcontent{chapter}{Figure list}
      \phantomsection
      \addcontentsline{toc}{chapter}{插图清单}
      {\setlength{\baselineskip}{20pt}\listoffigures}
    \end{center}
  \endgroup
}

% 表格清单
\newcommand{\setlistoftables}{
  \begingroup
    \newcommand{\name}{表格清单}
    \renewcommand{\numberline}[1]{表~##1\hspace*{1em}}
    \renewcommand{\listtablename}{\heiti\zihao{3}\name}
    \begin{center}
        \clearpage
        \phantomsection\addcontentsline{toc}{chapter}{表格清单}
        \phantomsection\addengcontent{chapter}{Table list}
        {\setlength{\baselineskip}{20pt}\listoftables}
    \end{center}
  \endgroup
}

% ===============================================
% Main Content Format 

\renewcommand\chapter{
  \if@openright\cleardoublepage\else\clearpage\fi
  \global\@topnum\z@ % 禁止新章节页的顶部出现浮动体
  \@afterindenttrue  % 章节后的第一段要缩进
  \secdef\@chapter\@schapter
}
\renewcommand\mainmatter{
  \clearpage
  \pagestyle{title}
  \ctexset{
    % 章标题用黑体三号（16磅）字，居中无缩进，段前24磅，段后18磅，单倍行距。
    % 题序和标题之间空1个半角空格。
    chapter = {
      format      = {\heiti\zihao{3}\centering\fontspec{Times New Roman}},
      aftername   = \zhspace[0.5],
      beforeskip  = 24pt,
      afterskip   = 18pt,
      fixskip     = true,
    },
    % 二级标题用黑体四号（14磅）字，两端对齐，无缩进，段前24磅，段后6磅，单倍行距。
    % 题序与标题之间空1个半角空格。
    section = {
      format      = {\heiti\zihao{4}\justifying\fontspec{Times New Roman}},
      aftername   = \zhspace[0.5],
      beforeskip  = 24pt,
      afterskip   = 6pt,
      fixskip     = true,
    },
    % 三级标题用黑体小四号（12磅）字，两端对齐，无缩进，段前12磅，段后6磅，单倍行距。
    % 题序与标题之间空 1 个半角空格
    subsection = {
      format      = {\heiti\zihao{-4}\justifying\fontspec{Times New Roman}},
      aftername   = \zhspace[0.5],
      beforeskip  = 12pt,
      afterskip   = 6pt,
      fixskip     = true,
    },
    % 撰写规范中为指定四级标题格式，暂定为黑体 11 磅字，两端对齐，无缩进，段前12磅，段后6磅，单倍行距。
    subsubsection = {
      format      = {\heiti\fontsize{11\bp@}{11\bp@}\selectfont\justifying\fontspec{Times New Roman}},
      aftername   = \zhspace[0.5],
      beforeskip  = 12pt,
      afterskip   = 6pt,
      fixskip     = true,
    },
  }
  \pagenumbering{arabic} % 开始阿拉伯数字页码编号
  % 正文用宋体小四号（12磅）字，两端对齐，首行缩进2字符，段前0行，段后0行，行距为固定值20磅。
  \songti\zihao{-4}
  \setlength{\parindent}{2\ccwd}
  \setlength{\parskip}{0pt}
  \justifying
  \setlength{\baselineskip}{20pt}
  \setlength{\floatsep}{20pt}
  \setlength{\textfloatsep}{20pt}
}

% Caption Stype
\renewcommand{\thetable}{\thechapter-\arabic{table}~}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}~}
\counterwithin{algorithm}{chapter}
\renewcommand{\thealgorithm}{\thechapter-\arabic{algorithm}}
\floatname{algorithm}{算法}
\DeclareCaptionLabelSeparator{space}{ }
\captionsetup{
   labelsep=space
}

\newcounter{desc}  % 定义一个名为 'desc' 的计数器，用来编号表注和图注
\setcounter{desc}{0}  % 初始化计数器为 0

\newcommand{\desc}[1]{
  \refstepcounter{desc}
  \begin{spacing}{1}
    \justifying
    {\zihao{5}\songti\selectfont 注~\thedesc\quad #1}
  \end{spacing}
}

% 忽略所有图片
\newcommand{\disablefigures}{
  \renewenvironment{figure}[1][]{\comment}{\endcomment}
  \renewenvironment{figure*}[1][]{\comment}{\endcomment}
}
% 忽略所有表格
\newcommand{\disabletables}{
  \renewenvironment{table}[1][]{\comment}{\endcomment}
  \renewenvironment{table*}[1][]{\comment}{\endcomment}
}

% 自定义图标题格式
\newcommand{\figurecaption}[2]{%
  \caption[#1]{%
    \centering #1 \\[6pt] % 在中文和英文之间增加6pt的垂直间距
    \centering \textnormal{Fig.}~\thefigure\quad #2
  }
}

% 自定义表格标题格式
\newcommand{\tablecaption}[2]{%
  \caption[#1]{%
    \centering #1 \\[6pt] % 在中文和英文之间增加6pt的垂直间距
    \centering \textnormal{Table.}~\thetable\quad #2 \\[6pt] 
  }
}

% 设置中英文标题格式
\captionsetup[figure]{
  font={small},     % 小号字体
  labelsep=quad,    % 图序与图题之间空2个半角空格
  format=plain,     % 无缩进
  justification=centering, % 居中
  singlelinecheck=false,  % 允许多行显示
  position=below,   % 标题放在图片下方
  skip=6pt, % 段前段后间距 6 磅
  belowskip=6pt, % 段后间距 6 磅
  aboveskip=6pt, % 段前间距 6 磅
}

\captionsetup[table]{
  labelsep=quad,
  format=plain,
  singlelinecheck=false,
  justification=centering,
  font={small},
  position=below,
  skip=6pt,
  belowskip=6pt,
  aboveskip=6pt
}

\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\newtagform{test}[]{（}{）}
\usetagform{test}


% 正文结束后的章节标题格式
\newcommand\makeafter{
  \ctexset{
    chapter = {
      name        = {,},
      format      = {\centering\heiti\zihao{3}},
      nameformat  = {},
      number      = \thechapter,
      aftername   = \hspace{\ccwd},
      beforeskip  = 24pt,
      afterskip   = 18pt,
      fixskip     = true
    }
  }
}

\newcommand\bibstyle@super{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\citestyle{super}
\renewcommand\bibfont{\songti\zihao{5}}
\setlength{\bibsep}{0\p@ \@plus.2\p@}
\setlength{\bibhang}{2\ccwd}
\renewcommand\@biblabel[1]{[#1]\hfill}

\renewcommand\bibsection{
  \clearpage
  \makeafter
  \phantomsection\addengcontent{chapter}{References}
  \ouc@chapter{\bibname}
  \songti\zihao{5}
  \setlength{\baselineskip}{20pt}
}

\newenvironment{ackonwlegmentback}{
  \clearpage
  \makeafter
  \ouc@setchinese
  \phantomsection\addengcontent{chapter}{Acknowledgements}
  \ouc@chapter[致谢]{致\zhspace[2]谢}
}{
  \clearpage
}

\newcounter{achievesecno}
\setcounter{achievesecno}{0}
\newcommand{\achievetitle}[1]{
  \refstepcounter{achievesecno}
  {
    \heiti\zihao{4}\noindent
    \chinese{achievesecno}、#1
  }
}
\newenvironment{achievement}{
  \clearpage
  \makeafter
  \ouc@setchinese
  \phantomsection\addengcontent{chapter}
    {Published papers and research results while pursuing the degree}
  \ouc@chapter{攻读硕士学位期间取得的研究成果}
  \songti\zihao{-4}
  \setlength{\baselineskip}{20pt}
}{\clearpage}

\newenvironment{profile}{
  \clearpage
  \makeafter
  \ouc@setchinese
  \phantomsection\addengcontent{chapter}{Resume}
  \ouc@chapter{作者简介}
  \songti\zihao{-4}
  \setlength{\baselineskip}{20pt}
}{\clearpage}