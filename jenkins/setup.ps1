param(
    [Parameter(Mandatory=$true)][String]$giturl=''
)



$regex = new-object System.Text.RegularExpressions.Regex("(?isx)\{\{GIT_URL\}\}")
$content = Get-Content dsl_seed_job.xml
$content = $regex.Replace($content, $giturl)


Write-Host $content

$content | Out-File -FilePath dsl_seed_job_generated.xml -Encoding UTF8