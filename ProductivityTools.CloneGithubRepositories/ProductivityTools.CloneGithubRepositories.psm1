function CloneRepository($sshurl, $directoryName) {
	git clone $sshurl  $directoryName
}

function CloneRepositories($repositories) {
	foreach ($repository in $repositories) {
		$repoName = $repository.name
		#Write-Host $repoName;
		if ($repoName -eq ".github") {
			$repoName=$repository.full_name.replace('/','')
		}

		if ($(Test-Path $repoName) -eq $true) {
			Write-Host "Directory $repoName exists. -  Skipping." -ForegroundColor Yellow
		}
		else {
			$sshurl = $repository.ssh_url
			CloneRepository $sshurl $repoName 
			Write-Host "Repository $repoName cloned" -ForegroundColor Green
		}
	}
}

function GetRepositories($token) {
	$GitHubUri = "https://api.github.com/user/repos"
	[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
	$i = 1;
	do {
		$paginateduri = $GitHubUri + "?page=" + $i
		Write-Host "Requesting repositories with address $paginateduri" -ForegroundColor DarkGreen
		$repos = Invoke-WebRequest -Uri $paginateduri -Headers @{"Authorization" = "Bearer $token" }
		$repositories = $repos | ConvertFrom-Json
		CloneRepositories $repositories
		$i++
	}while ($repositories.Count -gt 0)
}

function Clone-GithubRepositories($TargetDirectory, $Token) {
	Push-Location

	if ((Test-Path $TargetDirectory) -eq $false) {
		New-Item $TargetDirectory -ItemType Directory
	}
	cd $TargetDirectory
	GetRepositories $Token

	Pop-Location
}

Export-ModuleMember Clone-GithubRepositories

