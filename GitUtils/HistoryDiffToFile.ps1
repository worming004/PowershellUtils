$AllCommits = git log --pretty=oneline | ForEach-object {$_.substring(0,40)} 
$AllDiff = $AllCommits | ForEach-Object { @{
    commit = $_
    fileName = ".\" + $_ + ".diff"
    diff = git show $_} 
}

$AllDiff[0]
$AllDiff[0].fileName.GetType()
$AllDiff | ForEach-Object  -Process {
    Out-File $_.fileName -InputObject $_.diff -Encoding ASCII
}
