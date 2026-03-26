# script.ps1 — положи на GitHub и используй RAW ссылку
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

# Открываем CMD на весь экран
$wshell = New-Object -ComObject wscript.shell
$wshell.SendKeys('{F11}')

# Устанавливаем красный цвет
Write-Host "`e[31m" -NoNewline

# Заполняем экран случайными цифрами
for ($i = 0; $i -lt 2000; $i++) {
    Write-Host -NoNewline (Get-Random -Minimum 0 -Maximum 9)
    if ($i % 100 -eq 0) { Write-Host "" }
}
Start-Sleep -Milliseconds 800

# Очистка экрана
Clear-Host

# Центрируем ASCII-арт (примерно)
$lines = $asciiArt -split "`n"
$width = 80
foreach ($line in $lines) {
    $padding = [Math]::Max(0, ($width - $line.Length) / 2)
    Write-Host (" " * $padding) + $line
}

# Чтобы окно не закрывалось
Read-Host "Press Enter to exit"
