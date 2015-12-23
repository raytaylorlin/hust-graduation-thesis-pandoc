# HUST Graduation Thesis Pandoc

使用Pandoc Markdown和LaTeX写华中科技大学毕业论文（包括硕士论文和本科论文）。

# 用法

## 前置安装

1. 安装最新版的[Tex Live](https://www.tug.org/texlive/acquire.html)。 强烈建议[下载ISO文件](https://www.tug.org/texlive/acquire-iso.html)安装，这样只需要半个小时就能完成安装（网络安装可能需要一个多小时）。**最后请确保Tex Live的`bin`文件夹在PATH中。**测试：命令行执行`xelatex -v`或`lualatex -v`可以正常显示版本。
    * **降级pgf：下载[pgf v2.10](http://sourceforge.net/projects/pgf/files/pgf/version%202.10/pgf_2.10.tds.zip/download)，解压出`tex/generic/pgf/utilities/pgfkeys.code.tex`，替换掉Tex Live安装目录下`<texlive path>/<texlive version>/texmf-dist/tex/generic/pgf/utilities`的文件**，具体原因参照[这里](http://hust-latex.github.io/faqs/)第4个问题
2. 安装最新版的[Pandoc](http://pandoc.org/installing.html)。测试：命令行执行`pandoc -v`可以正常显示版本。
3. 安装最新版的[Node.js](https://nodejs.org/en/)。测试：命令行执行`node -v`可以正常显示版本。
4. 安装必需的宋体、黑体、仿宋、楷体字体，可以从[这里](https://github.com/mingchen/mac-osx-chinese-fonts/tree/master/Adobe%20Simple%20Chinese%20Fonts)下载。
5. 执行以下命令：

```
git clone https://github.com/raytaylorlin/hust-graduation-thesis-pandoc
cd hust-graduation-thesis-pandoc
npm install -g gulp
npm install
```

## 使用

* `src/`文件夹下存放了多个文件夹，每个文件夹代表一个project也就是一篇论文，其中包含了生成一篇论文所需要的各种源文件。例如在`src/thesis-simple/`中，`thesis.md`为论文正文，`ref.bib`为引用的文献（使用bibtex，谷歌学术可以直接复制出bib格式的引用），`figures/`文件夹存放的是引用的图片。
* 使用时可以从`src/`中任意一个示例项目复制一份出来，并重新命名，如`mythesis`（下面以这个项目名举例）
* 论文标题、姓名、专业、导师等基本信息，请修改`src/mythesis/info.tex`
* 论文摘要，请修改`src/mythesis/abstract.tex`
* 致谢信息，请修改`src/mythesis/thanks.tex`
* 编辑完之后，**执行`gulp --thesis mythesis`命令即可构建pdf**，生成的pdf存放于`dist`文件夹下。
    * `--thesis`参数可指定论文所在的项目目录，项目目录必须放在`src/`文件夹下
    * **注意：如果在系统中无法使用xelatex命令（现发现有同学单独运行xelatex无任何反应），可以尝试加入`--lualatex`参数来构建pdf（此方案编译会稍慢一些）**
* 论文类型（草稿/正式版、硕士/学士论文），请修改`template/template.tex`第1行的参数，具体请阅读[原Latex模板说明文档](https://raw.githubusercontent.com/hust-latex/hustthesis/master/hustthesis/hustthesis.pdf)
    > `format = <draft|final>`：提交草稿选择draft 选项，提交最终版选final选项。其中草稿正文页包括页
    眉（“华中科技大学 xx 学位论文”）、页眉修饰线（双线）、页脚（页码）和页脚
    修饰线（单线）。而最终版正文页不包括页眉、页眉修饰线和页脚修饰线，仅包
    含页脚（页码）。

    > `degree = <none|fyp|bachelor|master|phd>`
    指定论文种类，影响中英文封面处的标题和正文处的页眉（如果format设为draft）。

# 说明

## 致谢

感谢[@pyrocat101](https://github.com/pyrocat101)成为使用markdown写毕业论文的先驱者，本项目参考了其[hust-thesis-pandoc](https://github.com/Sicun/hust-thesis-pandoc)。

感谢[@xu-cheng](https://github.com/xu-cheng)提供的[华中科技大学毕业论文Latex模板](https://github.com/hust-latex/hustthesis)，本项目将其模板解包之后进行略微的修改而成。

## 原理

本项目旨在让各位毕业生能够脱离用Word编辑论文及其格式的苦海，用优雅的markdown专注于论文的写作。**注意：为了应对论文内容的多样化，本项目使用[Pandoc Markdown](http://pandoc.org/README.html#pandocs-markdown)来写作，这是一种增强版的markdown，具体请参见官方文档。**然后用Pandoc将`.md`转换成`.tex`，最后用xelatex命令行工具将`.tex`转换为最终的`.pdf`。

本项目使用gulp来自动构建最终的pdf，其流程由多个gulp任务完成。实际所有编译工作均发生在临时目录`temp/`下。流程说明如下：

1. （用户先编辑`src/`文件夹下的md文档、bib文献引用、图片等等）
2. `gulp pandoc-parts`：pandoc将论文的组成部分（如abstract、thanks等）`.md`编译成相应的`.tex`
3. `gulp pandoc-thesis`：pandoc将正文`thesis.md`，结合`template/template.tex`和上一步生成的`.tex`，生成`thesis.tex`
4. `gulp copy-template`：将编译latex所需的`.cls`类文件，华科标题图片等模板文件复制到`temp`下
5. `gulp copy-src`：将编译latex所需的`.bib`和图片复制到`temp`下
6. `gulp pdf`：进入到`temp`文件夹，依次调用`xelatex thesis`，`bibtex thesis`，`xelatex thesis`，`xelatex thesis`，生成`thesis.pdf`（至于为什么要反复调用同一个xelatex命令，请参见[这里](http://tex.stackexchange.com/questions/8332/undefined-citation-warnings)）
7. `gulp copy-pdf`：将编译完的pdf复制到`dist`目录下

## 报错解决

**TODO**

* `Error: EBUSY: resource busy or locked, open 'XXX/XXX/dist/thesis.pdf'`：thesis.pdf文件处于打开状态，文件无法写入，请关闭后重新执行`gulp`

## 测试环境

* Windows 8.1
* Node.js v5.2.0
* pandoc 1.15.2
* XeTeX 3.14159265-2.6-0.99992 / BibTeX 0.99d (TeX Live 2015/W32TeX)

由于环境限制，我没有在Mac或Linux下测过，希望有志同道合的人能帮我测试一下，有问题欢迎给我issue或者pull request，谢谢。

## 声明

由于之前实验室几乎没有人用Latex写过毕业论文，更没有人用markdown来写过论文，所以本项目目前仍处于试验期，我会在写毕业论文期间不断维护这个项目。但如果最终由于技(zhuang)术(bi)问(shi)题(bai)无法解决，导致不能生成最终可以提交给学校的论文，还请大家见谅。（也就是最终只能将内容一一复制到word中）

本人不会Latex，无法提供论文格式上微调的帮助，如果有需要还请各位自行解决。我相信[@xu-cheng](https://github.com/xu-cheng)提供的[华中科技大学毕业论文Latex模板](https://github.com/hust-latex/hustthesis)应该是久经考验的，应该也不用怎么调。

**本项目目前只能生成pdf，至于硕士论文盲审要不要用word的问题，后面我再看看能不能转word。现在至少本科生可以用得上=。=**

# TODO

- [x] 目前图片宽度一旦超过500px就会超出页面范围，应让图片宽度自适应
- [ ] 构建报错时可以显示更加具体的错误信息

# 更新日志

* v0.5.0: 新增project概念，现在一个文件夹表示一个project，对应一篇论文，可以由`--thesis`参数来指定一个文件夹。（原`--thesis`参数的含义已弃用）
* v0.4.2：修复最新版的Pandoc v1.15.2，在生成列表时改用了命令\tightlist而产生编译错误的问题
* v0.4.1：给pandoc-thesis任务添加报错判断信息，并增加对temp文件夹是否存在的判断
* v0.4.0：增加``--lualatex`选项，以备在无法使用xelatex编译的情况下用lualatex编译
* v0.3.1：修复图片比较大时超出页面宽度的问题
* v0.3.0：新增ELWG专用论文example，gulp脚本新增`--thesis`参数
* v0.2.0：将论文模板template.tex中基本信息、摘要和致谢部分拆分成独立的文件
* v0.1.0：发布第一版，可以使用gulp来自动构建论文，生成pdf

# License

[MIT License](https://en.wikipedia.org/wiki/MIT_License)
