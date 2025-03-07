% 本页为题名页，装订时为封面后的第一页，采用单面印刷。

\newcommand{\defineouctitlepagekeys}{
  \makeatletter
  \define@key{ouctitlepage}{clc}{\def\tp@clc{##1}} % 中国图书馆分类法（CLC）分类号
  \define@key{ouctitlepage}{udc}{\def\tp@udc{##1}} % 通用十进制分类法（UDC）分类号  
  \define@key{ouctitlepage}{schoolcode}{\def\tp@schoolcode{##1}} % 学校代码
  \define@key{ouctitlepage}{id}{\def\tp@id{##1}} % 学号
  \define@key{ouctitlepage}{author}{\def\tp@author{##1}} % 作者
  \define@key{ouctitlepage}{advisor}{\def\tp@advisor{##1}} % 指导教师
  \define@key{ouctitlepage}{coadvisor}{\def\tp@coadvisor{##1}} % 合作导师
  \define@key{ouctitlepage}{degreetype}{\def\tp@degreetype{##1}} % 学位类型
  \define@key{ouctitlepage}{major}{\def\tp@major{##1}} % 专业名称
  \define@key{ouctitlepage}{researchfield}{\def\tp@researchfield{##1}} % 研究方向
  \define@key{ouctitlepage}{institution}{\def\tp@institution{##1}} % 授予学位单位
  \makeatother
}


\DeclareDocumentCommand{\settitlepage}{m}{
  \defineouctitlepagekeys
  \clearpage
  \thispagestyle{empty}
  \makeatletter
  \begingroup
    \setkeys{ouctitlepage}{clc={},udc={},schoolcode={10423},id={},
      author={},advisor={},coadvisor={},
      degreetype={学术学位},major={},researchfield={},
      institution={},#1}
    
    % 小四号字填写，中文用宋体，英文字母、阿拉伯数字用 Times New Roman 字体
    % 分类号按《中国图书馆分类法》选取，可从学校图书馆网页
    %（http://library.ouc.edu.cn/Home/ClassificationBooks）
    % 左侧末端下载《中国图书分类法详细类目表》，填写至三级类目。
    % UDC 按《国际十进分类法》选取，可从学校图书馆网页
    % （http://library.ouc.edu.cn/Home/ClassificationBooks）右侧末端点击“UDC分类法详细查询”，
    % 从主表（网页灰色横条上的0-9数字）中，根据论文内容选择相应数字开头的分类号，
    % 经逐级查询后填写论文的 UDC 号。一般填写至三级类目。
    \begin{spacing}{0}
      \noindent\songti
      {\zihao{4}\textbf{分类号：}} 
      {\zihao{-4} \tp@clc} \hfill 
      {\zihao{4}\textbf{学校代码：}} 
      {\zihao{-4} \tp@schoolcode\phantom{000000}} \\ 
      {\zihao{4}\textbf{UDC：}} 
      {\zihao{-4} \tp@udc} \hfill 
      {\zihao{4}\textbf{学~~~~~~号：}} 
      {\zihao{-4} \tp@id}
    \end{spacing}
 
    \par\vfill
    
    \begin{center}
      % 中文标题，黑体二号字
      {\zihao{2}\heiti \zhtitle}
      
      \par\vskip30pt
        
      % 英文标题
      % 1.英文题目第一个单词首字母大写。
      % 2.实词（名词、动词、代词、形容词、副词等）首字母大写，虚词（介词、冠词、连词等）首字母小写。
      % 3.超过5个字母的虚词（between、without等）首字母应该大写。
      % 4.使用 Times New Roman 二号字加粗，题目太长时可用小二号字.
      {\zihao{-2}\bfseries\textrm \entitle}
    
      % 冒号左侧用黑体四号字，冒号右侧用宋体四号字，1.5倍行距。
      \par\vfill
      \begin{tabular}{cl}
          % 作者
          \ziju{0.65}\zihao{4}\heiti 作~~~~~~~~~~~~~~~~者： & \zihao{4}\songti \tp@author \\
          % 指导教师，填写姓名及专业技术职务，如XX教授
          \ziju{0.65}\zihao{4}\heiti 指导教师： & \zihao{4}\songti \tp@advisor \\
          % 合作导师，仅专业学位博士填写校外合作指导教师的姓名及专业技术职务。
          \ifx\tp@coadvisor\@empty
          \else
            \ziju{0.65}\zihao{4}\heiti 合作导师： & \zihao{4}\songti \tp@coadvisor \\
          \fi
          % 学位类型
          % 学术学位博士（硕士）、同等学力申请硕士学位人员填写“学术学位”；
          % 专业学位博士（硕士）填写“专业学位”
          \ziju{0.65}\zihao{4}\heiti 学位类型： & \zihao{4}\songti \tp@degreetype \\
          \ziju{0.65}\zihao{4}\heiti 专业名称： & \zihao{4}\songti \tp@major \\
          \ziju{0.65}\zihao{4}\heiti 研究方向： & \zihao{4}\songti \tp@researchfield \\
          \zihao{4}\heiti 授予学位单位： & \zihao{4}\songti \tp@institution \\
      \end{tabular}
    
      \par\vfill
      {\zihao{4}\heiti 日期：~~~~ 年 ~~~ 月}
    \end{center}
  \endgroup
  \makeatother
}