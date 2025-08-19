fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression

function Get-FnmVersionInfo {
    # 定义颜色代码
    $colorFnm = "`e[38;5;45m"  # 亮蓝色
    $colorVersion = "`e[38;5;82m" # 绿色
    $colorAlias = "`e[38;5;226m"  # 黄色
    $colorReset = "`e[0m"       # 重置颜色

    # 获取当前激活的Node.js版本
    $fnmCurrent = fnm current 2>$null
    if ($LASTEXITCODE -ne 0 -or -not $fnmCurrent) {
        return ""
    }

    # 从fnm list中获取包含当前版本的行
    $versionLine = fnm list 2>$null | Where-Object { $_ -match "\* $fnmCurrent" }
    if (-not $versionLine) {
        return "${colorFnm}[fnm: ${colorVersion}$fnmCurrent${colorFnm}]${colorReset} "
    }

    # 提取别名（版本后面的逗号分隔值）
    if ($versionLine -match "\* $fnmCurrent\s+(.*)") {
        $aliases = $matches[1].Trim()
        # 替换逗号为竖线，使显示更清晰
        $aliasesFormatted = $aliases -replace ', ', '|'
        return "${colorFnm}[fnm: ${colorVersion}$fnmCurrent ${colorAlias}($aliasesFormatted)${colorFnm}]${colorReset} "
    }

    return "${colorFnm}[fnm: ${colorVersion}$fnmCurrent${colorFnm}]${colorReset} "
}

function prompt {
    $colorPath = "`e[38;5;141m"  # 紫色
    $colorPrompt = "`e[38;5;255m" # 白色
    $colorReset = "`e[0m"        # 重置颜色
    
    $fnmInfo = Get-FnmVersionInfo
    $currentDir = $PWD.Path.Replace($HOME, "~")
    
    "${fnmInfo}${colorPath}$currentDir ${colorPrompt}>${colorReset} "
}

# 确保PowerShell支持ANSI转义序列
if ($Host.UI.RawUI.ForegroundColor -ne $null) {
    $Host.UI.RawUI.ForegroundColor = "Gray"
    $Host.UI.RawUI.BackgroundColor = "Black"
}
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding
$env:TERM = "xterm-256color"
