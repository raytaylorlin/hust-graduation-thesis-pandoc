# HUST Graduation Thesis Pandoc

使用Pandoc Markdown和LaTeX写华中科技大学毕业论文（包括硕士论文和本科论文）。

# 用法

## 前置安装

1. 安装最新版的[Tex Live](https://www.tug.org/texlive/acquire.html)。 强烈建议下载ISO文件安装，这样只需要半个小时就能完成安装（网络安装可能需要一个多小时）。**最后请确保Tex Live的`bin`文件夹在PATH中。**
2. 安装最新版的[Pandoc](http://pandoc.org/installing.html)。
3. 安装最新版的[Node.js](https://nodejs.org/en/)。
4. 安装必需的宋体、黑体、仿宋、楷体字体，可以从[这里](https://github.com/mingchen/mac-osx-chinese-fonts/tree/master/Adobe%20Simple%20Chinese%20Fonts)下载。
5. 执行以下命令：

```
git clone https://github.com/raytaylorlin/hust-graduation-thesis-pandoc
cd hust-graduation-thesis-pandoc
npm install -g gulp
npm install
```

## 使用

* 所有要编辑的源文件，均存放在`src/`文件夹下。`thesis.md`为论文正文，`ref.bib`为引用的文献（使用bibtex，谷歌学术可以直接复制出bib格式的引用），`figures`文件夹存放的是引用的图片。
* 论文类型（草稿/正式版、硕士/学士论文），请修改`template/template.tex`第1行的参数，具体阅读[原Latex模板说明文档](https://raw.githubusercontent.com/hust-latex/hustthesis/master/hustthesis/hustthesis.pdf)
* 论文标题、姓名、专业、导师等基本信息，请修改`template/template.tex` 11~20行
* 论文摘要，请修改`template/template.tex` 22~38行
* 致谢信息，请修改`template/template.tex` 55行
* 编辑完之后，执行`gulp`命令即可，生成的pdf存放于`dist`文件夹下。

# 说明

## 致谢

感谢[@pyrocat101](https://github.com/pyrocat101)成为使用markdown写毕业论文的先驱者，本项目参考了其[hust-thesis-pandoc](https://github.com/Sicun/hust-thesis-pandoc)。

感谢[@xu-cheng](https://github.com/xu-cheng)提供的[华中科技大学毕业论文Latex模板](https://github.com/hust-latex/hustthesis)，本项目将其模板解包之后进行略微的修改而成。

## 原理

本项目旨在让各位毕业生能够脱离用Word编辑论文及其格式的苦海，用优雅的markdown专注于论文的写作。**注意：为了应对论文内容的多样化，本项目使用[Pandoc Markdown](http://pandoc.org/README.html#pandocs-markdown)来写作，这是一种增强版的markdown，具体请参见官方文档。**

本项目使用gulp来自动构建最终的pdf，其流程由多个gulp任务完成。实际所有编译工作均发生在临时目录`temp/`下。流程说明如下：

1. （用户先编辑`src/`文件夹下的md文档、bib文献引用、图片等等）
2. `gulp pandoc-parts`：pandoc将论文的组成部分（如abstract、thanks等）`.md`编译成相应的`.tex`
3. `gulp pandoc-thesis`：pandoc将正文`thesis.md`，结合`template/template.tex`和上一步生成的`.tex`，生成`thesis.tex`
4. `gulp copy-template`：将编译latex所需的`.cls`类文件，华科标题图片等模板文件复制到`temp`下
5. `gulp copy-src`：将编译latex所需的`.bib`和图片复制到`temp`下
6. `gulp pdf`：进入到`temp`文件夹，依次调用`xelatex thesis`，`bibtex thesis`，`xelatex thesis`，`xelatex thesis`，生成`thesis.pdf`（至于为什么要反复调用同一个xelatex命令，请参见[这里](http://tex.stackexchange.com/questions/8332/undefined-citation-warnings)
7. `gulp copy-pdf`：将编译完的pdf复制到`dist`目录下

## 报错解决

**TODO**

## 测试环境

* Windows 8.1
* Node.js v5.2.0
* pandoc 1.13.1
* XeTeX 3.14159265-2.6-0.99992 / BibTeX 0.99d (TeX Live 2015/W32TeX)

由于环境限制，我没有在Mac或Linux下测过，希望有志同道合的人能帮我测试一下，有问题欢迎给我issue或者pull request，谢谢。

## License

[MIT License](https://en.wikipedia.org/wiki/MIT_License)
