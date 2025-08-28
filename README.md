# fnm-pwsh-prompt

中文 | [English](./README_en.md)

## 介绍

这是一个适用于 [fnm](https://github.com/Schniz/fnm) 和 [git](https://git-scm.com/) 的 PowerShell 的配置文件，它可以在提示词中清晰地展示 [node.js](https://nodejs.org/zh-cn) 当前版本和别名以及展示当前仓库的 [git](https://git-scm.com/) 分支信息。

同时，相比于默认的版本，这个配置文件是双栏的配置，不会由于过长的路径名而导致命令输入空间的缩短。

## 预览

![预览图片](./preview_image.png)

## 使用

首先，打开你当前的 PowerShell 配置文件。

在 PowerShell 中输入 `notepad $profile`

接着，在你的 PowerShell 的配置文件中合适的位置追加 [Microsoft.PowerShell_profile.ps1](./Microsoft.PowerShell_profile.ps1) 中的脚本即可。
