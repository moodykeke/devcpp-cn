
2020-04-03  by abli
此程序的界面中出现了 TdevPages 控件。居然找不到。
删除之，然后把相应的标签和文本框都简单地列出在界面中。



此程序中要用到压缩算法。
关键在于 bzip2.pas 中要用到几个 obj 文件

{$L blocks.obj} //blocksort
{$L huffman.obj}    //hoffman
{$L compress.obj}   //compress
{$L decompress.obj} //decompress
{$L bzlib.obj}      //bzlib

但是在 Delphi XE2 中编译时会报错说这几个 obj 文件格式不对。
重新从这里下载：https://torry.net/files/vcl/compress/other/BZip21.05.zip


我把 bzip2 从项目中移除，然后就会对 zip.pas 报错。

看来是无法解决的了。放弃。


