<!--Category:GAS--> 
 <p align="right">
    <a href="http://productivitytools.top/"><img src="Images/Header/ProductivityTools_green_40px_2.png" /><a> 
    <a href="https://github.com/pwujczyk/ProductivityTools.CloneGithubRepositories"><img src="Images/Header/Github_border_40px.png" /></a>
        <a href="https://www.powershellgallery.com/packages/ProductivityTools.CloneGithubRepositories/"><img src="Images/Header/Powershell_border_40px.png" /></a>
</p>
<p align="center">
    <a href="http://http://productivitytools.tech/">
        <img src="Images/Header/LogoTitle_green_500px.png" />
    </a>
</p>


# Clone GitHub Repositories

Module downloads all GitHub repositories from given account to provided directory. To do it first it connects to GitHub using its API and then iterate through all returned repositories.

## Requirements
To make it work you need to:
- have Git installed in a way PowerShell will be able to use it (this is default configuration during installation of Git)
- have token generated on GitHub settings page. It can be retrieved  from https://github.com/settings/tokens

Module has two parameters:
- TargetDirectory - place where all repositories will be cloned
- Token - generated from GitHub settings page

![alt text](Images/Diagram.png)

## Usage example

![alt text](Images/CloneGithubRepositories-Example1.png)


