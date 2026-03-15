$gs = "C:\Program Files\gs\gs10.06.0\bin\gswin64c.exe"

$limiteKB = 4780
$limiteBytes = $limiteKB * 1024

Get-ChildItem -Filter *.pdf | ForEach-Object {

    $arquivo = $_.FullName
    $nomeBase = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
    $dir = $_.DirectoryName

    $arquivoComprimido = Join-Path $dir "$($nomeBase)_compress.pdf"

    Write-Host ""
    Write-Host "Processando:" $_.Name

    $tamanho = (Get-Item $arquivo).Length

    if ($tamanho -le $limiteBytes) {
        Write-Host "Arquivo já está abaixo de 4780KB"
        return
    }

    Write-Host "Comprimindo PDF..."

    $args = @(
        "-sDEVICE=pdfwrite"
        "-dCompatibilityLevel=1.4"
        "-dDownsampleColorImages=true"
        "-dColorImageResolution=150"
        "-dDownsampleGrayImages=true"
        "-dGrayImageResolution=150"
        "-dJPEGQ=75"
        "-dNOPAUSE"
        "-dQUIET"
        "-dBATCH"
        "-sOutputFile=$arquivoComprimido"
        "$arquivo"
    )

    & $gs $args

    if (!(Test-Path $arquivoComprimido)) {
        Write-Host "Erro ao comprimir PDF"
        return
    }

    $novoTamanho = (Get-Item $arquivoComprimido).Length

    if ($novoTamanho -le $limiteBytes) {

        Write-Host "Compressão suficiente."

        Remove-Item $arquivo
        Rename-Item $arquivoComprimido "$($_.Name)"
        return
    }

    Write-Host "Ainda maior que 4780KB. Extraindo páginas..."

    $tempFolder = Join-Path $dir "tmp_pdf_pages"

    if (Test-Path $tempFolder) {
        Remove-Item $tempFolder -Recurse -Force
    }

    New-Item -ItemType Directory -Path $tempFolder | Out-Null

    # extrair páginas
    & $gs `
        -sDEVICE=pdfwrite `
        -dSAFER `
        -dBATCH `
        -dNOPAUSE `
        "-sOutputFile=$tempFolder\page_%03d.pdf" `
        "$arquivoComprimido"

    $pages = Get-ChildItem "$tempFolder\page_*.pdf" | Sort-Object Name

    $parte = 1
    $lista = @()
    $sizeTotal = 0

    foreach ($page in $pages) {

        $size = (Get-Item $page).Length

        if (($sizeTotal + $size) -gt $limiteBytes) {

            $saida = "$dir\$nomeBase - Parte $parte.pdf"

            $inputs = $lista.FullName

            & $gs `
                -sDEVICE=pdfwrite `
                -dNOPAUSE `
                -dBATCH `
                "-sOutputFile=$saida" `
                $inputs

            Write-Host "Criado:" $saida

            $parte++
            $lista = @()
            $sizeTotal = 0
        }

        $lista += $page
        $sizeTotal += $size
    }

    if ($lista.Count -gt 0) {

        $saida = "$dir\$nomeBase - Parte $parte.pdf"

        & $gs `
            -sDEVICE=pdfwrite `
            -dNOPAUSE `
            -dBATCH `
            "-sOutputFile=$saida" `
            $lista.FullName

        Write-Host "Criado:" $saida
    }

    Remove-Item $tempFolder -Recurse -Force
    Remove-Item $arquivoComprimido
    Remove-Item $arquivo
}