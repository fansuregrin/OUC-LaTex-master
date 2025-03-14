% 学位论文答辩委员会页
% 提交存档论文时，须先打印此页，由答辩委员会成员签字后，扫描制作成电子文档，在电子版论文中插入此扫描页。

\newcommand{\setcommittee}{
    \clearpage
    \thispagestyle{empty}

    % 标题部分用黑体三号字，居中无缩进，段前24磅，段后18磅，1.5倍行距。
    \begin{center}
        \zihao{3}\heiti 学位论文答辩委员会
    \end{center}
    
    % 表格内容采用宋体小四号字(英文、数字、字母的字体为Times New Roman)，
    % 居中无缩进，2 倍行距，可根据委员数调整行数。
    \noindent
    \begin{table}[htbp]
        \centering
        \renewcommand\arraystretch{2}
        \begin{tabular}{|c|c|c|c|c|}
            \hline
            答辩时间 & \multicolumn{4}{c|}{ ~~~~ 年 ~~~ 月 ~~~ 日} \\ 
            \hline
            答辩地点 & \multicolumn{4}{c|}{}\\ 
            \hline
            \multicolumn{5}{|c|}{~~~~~~答辩委员会组成~~~~~~}\\ 
            \hline
            ~~~~~组成~~~~~ & ~~~~~姓名~~~~~ & ~~~专业技术职务~~~ & ~~~~~工作单位~~~~~ & ~~~~~签名~~~~~ \\ \hline
            主席 & & & & \\ \hline
            \multirow{6}{*}{委员} & & & & \\
            \cline{2-5}
             & & & & \\ 
            \cline{2-5}
             & & & & \\ 
            \cline{2-5}
             & & & & \\
            \cline{2-5}
             & & & & \\ 
            \cline{2-5}
             & & & & \\ 
            \hline
        \end{tabular}
    \end{table}
}  
