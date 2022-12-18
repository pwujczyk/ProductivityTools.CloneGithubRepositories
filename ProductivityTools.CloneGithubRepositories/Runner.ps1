#clear
$path="d:\"
$directory="GitHub"
$Destination=Join-Path $path $directory
$token="token from github"
cd $PSScriptRoot
Import-Module ./ProductivityTools.CloneGithubRepositories.psm1 -Force

Clone-GithubRepositories -TargetDirectory $Destination -Token $token

