# Subtitle Embedding Tool
param(
    [Parameter(Mandatory=$true)]
    [string]$VideoFile,
    
    [Parameter(Mandatory=$true)]
    [string]$SubtitleFile,
    
    [Parameter(Mandatory=$true)]
    [string]$OutputFile,
    
    [Parameter()]
    [ValidateSet("soft", "hard")]
    [string]$EmbedType = "soft"
)

Write-Host "Subtitle Embedding Tool" -ForegroundColor Green
Write-Host "Video File: $VideoFile" -ForegroundColor Yellow
Write-Host "Subtitle File: $SubtitleFile" -ForegroundColor Yellow
Write-Host "Output File: $OutputFile" -ForegroundColor Yellow
Write-Host "Embed Type: $EmbedType" -ForegroundColor Yellow

if ($EmbedType -eq "soft") {
    Write-Host "`nUsing soft subtitles (can be toggled)..." -ForegroundColor Cyan
    $command = "ffmpeg -i `"$VideoFile`" -i `"$SubtitleFile`" -c copy -c:s mov_text -metadata:s:s:0 language=eng -metadata:s:s:0 title=`"English`" `"$OutputFile`""
    
    Write-Host "Executing command:" -ForegroundColor White
    Write-Host $command -ForegroundColor Gray
    
    # Execute command
    Invoke-Expression $command
    
} elseif ($EmbedType -eq "hard") {
    Write-Host "`nUsing hard subtitles (burned into video)..." -ForegroundColor Cyan
    $command = "ffmpeg -i `"$VideoFile`" -vf `"subtitles='$SubtitleFile':force_style='FontSize=16,PrimaryColour=&Hffffff'`" `"$OutputFile`""
    
    Write-Host "Executing command:" -ForegroundColor White
    Write-Host $command -ForegroundColor Gray
    
    # Execute command
    Invoke-Expression $command
}

Write-Host "`nProcessing completed!" -ForegroundColor Green 