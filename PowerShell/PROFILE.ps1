# Uncomment only if you use Oh-my-Posh
# Import-Module posh-git
# Import-Module oh-my-posh
# Set-PoshPrompt -Theme paradox

function Invoke-Terraform { & terraform.exe $args }
New-Alias -Name tf -Value Invoke-Terraform -Force -Option AllScope

function Invoke-Docker { & docker.exe $args }
New-Alias -Name dk -Value Invoke-Docker -Force -Option AllScope

function Clear-DockerAll{
    docker ps -q | ForEach-Object{
        $cntId = $_
    
        docker kill $cntId
        docker container rm -f $cntId
    }
    
    docker container prune -f
    
    docker images -q | ForEach-Object{
    
        $imgId = $_
    
        docker image remove -f $imgId
    }    
}
New-Alias -Name dknuke -Value Clear-DockerAll -Force -Option AllScope

function Get-IPExternal { (Invoke-WebRequest ifconfig.me/ip).Content }
New-Alias -Name getip -Value Get-IPExternal -Force -Option AllScope
