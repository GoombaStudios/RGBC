# Set URL and temp file path
$url = "https://raw.githubusercontent.com/GoombaStudios/RGBC/refs/heads/code/install.cmd"
$tempFile = "$env:TEMP\install.cmd"

try {
    # Download the install.cmd file
    Invoke-WebRequest -Uri $url -OutFile $tempFile -UseBasicParsing

    # Run the script and wait for it to finish
    & cmd.exe /c $tempFile

    # Delete the downloaded file
    Remove-Item -Path $tempFile -Force
} catch {
    Write-Host "Error: $_" -ForegroundColor Red
}
