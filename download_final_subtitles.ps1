# Download final correct MCP course subtitles

Write-Host "=== Downloading MCP Course Subtitles (Final Version) ===" -ForegroundColor Green

# Create output directory
$outputDir = "MCP_Final_Subtitles"
if (Test-Path $outputDir) {
    Remove-Item $outputDir -Recurse -Force
}
New-Item -ItemType Directory -Path $outputDir | Out-Null

$baseUrl = "https://dyckms5inbsqq.cloudfront.net/Anthropic/C2"
$headers = @{
    'Referer' = 'https://learn.deeplearning.ai/'
    'User-Agent' = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
}

Write-Host "Downloading subtitles..." -ForegroundColor Yellow

$results = @()

# Download lessons 1-11
for ($i = 1; $i -le 11; $i++) {
    $lessonNum = "L$i"
    $url = "$baseUrl/$lessonNum/subtitle/eng/sc-Anthropic-C2-$lessonNum-eng.vtt"
    $outputFile = "$outputDir\$lessonNum-subtitles.vtt"
    
    try {
        Write-Host "Downloading $lessonNum..." -ForegroundColor Cyan
        
        $response = Invoke-WebRequest -Uri $url -Headers $headers -ErrorAction Stop
        
        # Convert bytes to string (no decoding needed - already correct format)
        $contentString = [System.Text.Encoding]::UTF8.GetString($response.Content)
        
        # Save content
        $contentString | Out-File -FilePath $outputFile -Encoding UTF8
        
        # Analyze content
        $timestamps = [regex]::Matches($contentString, '\d{2}:\d{2}:\d{2}\.\d{3} --> \d{2}:\d{2}:\d{2}\.\d{3}')
        $isValidVtt = $contentString -match "WEBVTT"
        
        # Get first few lines of actual subtitle text
        $lines = $contentString -split "`r?`n"
        $subtitleLines = $lines | Where-Object { $_ -notmatch '(WEBVTT|X-TIMESTAMP-MAP|^\s*$|\d{2}:\d{2}:\d{2}|^\d+$)' } | Select-Object -First 3
        $sampleText = $subtitleLines -join " "
        
        $result = [PSCustomObject]@{
            Lesson = $lessonNum
            Status = "Success"
            FileSize = $contentString.Length
            Timestamps = $timestamps.Count
            ValidVTT = $isValidVtt
            FirstTimestamp = if ($timestamps.Count -gt 0) { $timestamps[0].Value } else { "None" }
            LastTimestamp = if ($timestamps.Count -gt 0) { $timestamps[-1].Value } else { "None" }
            SampleText = $sampleText.Substring(0, [Math]::Min(50, $sampleText.Length))
        }
        
        Write-Host "  ✓ Success - $($timestamps.Count) timestamps, $($contentString.Length) chars" -ForegroundColor Green
        
    } catch {
        $result = [PSCustomObject]@{
            Lesson = $lessonNum
            Status = "Failed"
            Error = $_.Exception.Message
            FileSize = 0
            Timestamps = 0
            ValidVTT = $false
            FirstTimestamp = "N/A"
            LastTimestamp = "N/A"
            SampleText = "N/A"
        }
        
        Write-Host "  ✗ Failed: $($_.Exception.Message)" -ForegroundColor Red
    }
    
    $results += $result
}

# Display summary
Write-Host "`n=== Download Summary ===" -ForegroundColor Green
$results | Format-Table -AutoSize

# Save summary report
$reportFile = "$outputDir\download_report.txt"
$summaryReport = @"
MCP Course Subtitles Download Report (Final)
Generated: $(Get-Date)

Total lessons attempted: $($results.Count)
Successful downloads: $($results | Where-Object {$_.Status -eq "Success"} | Measure-Object).Count
Failed downloads: $($results | Where-Object {$_.Status -eq "Failed"} | Measure-Object).Count

Details:
$($results | Format-Table -AutoSize | Out-String)

Notes:
- These are the CORRECT WebVTT subtitle files that match the video content
- No decoding needed - server now returns proper WebVTT format
- Files are saved in UTF-8 encoding for compatibility

"@

$summaryReport | Out-File -FilePath $reportFile -Encoding UTF8

Write-Host "`nSummary report saved to: $reportFile" -ForegroundColor Cyan
Write-Host "Subtitle files saved to: $outputDir" -ForegroundColor Cyan

# Show sample content from first successful subtitle
$firstSuccess = $results | Where-Object {$_.Status -eq "Success"} | Select-Object -First 1
if ($firstSuccess) {
    $sampleFile = "$outputDir\$($firstSuccess.Lesson)-subtitles.vtt"
    if (Test-Path $sampleFile) {
        Write-Host "`nSample content from $($firstSuccess.Lesson):" -ForegroundColor Yellow
        $sampleLines = Get-Content $sampleFile | Select-Object -First 15
        $sampleLines | ForEach-Object { Write-Host "  $_" -ForegroundColor Gray }
    }
} 