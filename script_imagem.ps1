$url = "https://raw.githubusercontent.com/nathanaccacio/poc-html/main/equipesec.png"

$caminhoImagem = Join-Path $env:TEMP "equipesec.png"

try {
    Invoke-WebRequest -Uri $url -OutFile $caminhoImagem -UseBasicParsing -ErrorAction Stop
} catch {
    exit 1
}

try {
    Start-Process "rundll32.exe" -ArgumentList "C:\Windows\System32\shimgvw.dll,ImageView_Fullscreen $caminhoImagem" -ErrorAction Stop
} catch {
    Start-Process $caminhoImagem -ErrorAction SilentlyContinue
}
