# 绪言

使用[Pandoc Markdown][pandoc]写论文的正文。

[pandoc]: http://johnmacfarlane.net/pandoc/README.html

阅读`thesis.md`、`template.tex`、`abstract.tex`、`thanks.md`来看看这篇文章是从什么样的源码生成的。

# 章节1

## 引用

请在`ref.bib`里添加引用文献，然后可以这样引用\cite{aumann1976agreeing}。

`ref.bib`中所有的条目都出现在参考文献一节中，而不仅仅是被引用的条目。

## 列表

### 无序列表

* here is my first list item.
* and my second.

### 有序列表

1.  one
2.  two
3.  three

## 代码

### 行内代码

这是行内代码`print 1 + 1`。

### 代码片段

\begin{lstlisting}[language=javascript]
var fruits = ["Banana", "Orange", "Apple", "Mango"];
document.getElementById("demo").innerHTML = fruits.join(" * ");
function myFunction(name,job) {
    for (var i = 0; i < 5; i++) {
        if (true) {
            document.getElementById("demo").innerHTML =
            "Welcome " + name + ", the " + job + ".";
        }
    }
}
\end{lstlisting}

\begin{lstlisting}[language=python]
qsort []     = []
qsort (x:xs) = qsort (filter (< x) xs) ++ [x] ++
               qsort (filter (>= x) xs)
\end{lstlisting}

## 表格

  Right     Left     Center     Default
-------     ------ ----------   -------
     12     12        12            12
    123     123       123          123
      1     1          1             1

: Demonstration of simple table syntax\label{table:simple}.

## 图

图请放入`figures`目录下。

![图示例\label{fig:radial}](figures/radial.pdf)

![图PNG示例\label{fig:pngtest}](figures/pngtest.png)

## 公式

### 行内公式

这是行内公式$\sum_{i=1}^{10} t_i$。

### 块公式

\begin{equation}
  x = a_0 + \cfrac{1}{a_1
          + \cfrac{1}{a_2
          + \cfrac{1}{a_3 + \cfrac{1}{a_4} } } }
\end{equation}

\begin{equation}
  \lim_{x \to \infty} \exp(-x) = 0
\end{equation}

## 交叉引用

1. 如表格\ref{table:simple}所示；
2. 如图\ref{fig:radial}所示。

<!-- 这是一个注释 -->

# 章节2

可以自定义LaTeX指令。

\newcommand{\ugt}{This is a command named \texttt{{\textbackslash}ugt}}

\ugt
