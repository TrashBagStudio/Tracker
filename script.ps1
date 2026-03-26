# ВСТАВЬ СВОЙ ASCII-АРТ СЮДА
$asciiArt = @"
  █████╗ ███████╗ ██████╗██╗██╗
 ██╔══██╗██╔════╝██╔════╝██║██║
 ███████║███████╗██║     ██║██║
 ██╔══██║╚════██║██║     ██║██║
 ██║  ██║███████║╚██████╗██║██║
 ╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝╚═╝
        ТВОЙ ASCII АРТ
"@

# Фуллскрин (F11)
$wshell = New-Object -ComObject wscript.shell
$wshell.SendKeys('{F11}')
Start-Sleep -Milliseconds 300

# Получаем реальные размеры консоли
$width  = [Console]::WindowWidth
$height = [Console]::WindowHeight

# Красный цвет
Write-Host "`e[31m" -NoNewline

# Заполнение экрана
for ($y = 0; $y -lt $height; $y++) {
    $line = ""
    for ($x = 0; $x -lt $width; $x++) {
        $line += Get-Random -Minimum 0 -Maximum 9
    }
    Write-Host $line
}

Start-Sleep -Milliseconds 800
Clear-Host

# Разбиваем ASCII
$lines = $asciiArt -split "`n"

# Высота ASCII
$artHeight = $lines.Count

# Максимальная длина строки ASCII
$artWidth = ($lines | Measure-Object -Property Length -Maximum).Maximum

# Вертикальный отступ (центр)
$topPadding = [Math]::Max(0, ($height - $artHeight) / 2)

# Пустые строки сверху
for ($i = 0; $i -lt $topPadding; $i++) {
    Write-Host ""
}

# Вывод по центру
foreach ($line in $lines) {
    $leftPadding = [Math]::Max(0, ($width - $line.Length) / 2)
    Write-Host (" " * $leftPadding + $line)
}

Read-Host "Press Enter to exit"
