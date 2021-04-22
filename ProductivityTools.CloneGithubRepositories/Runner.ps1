#clear
$path="d:\"
$directory="GitHub"
$Destination=Join-Path $path $directory
$token="token from github"


Clone-GithubRepositories -TargetDirectory $Destination -Token $token

