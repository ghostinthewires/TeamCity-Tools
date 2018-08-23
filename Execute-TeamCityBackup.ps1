## Script to automate backup of TeamCity using the API

$user = 'VALID SERVICE ACCOUNT'
$pass = 'VALID PASSWORD'

$pair = "$($user):$($pass)"

$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))

$basicAuthValue = "Basic $encodedCreds"

$Headers = @{
    Authorization = $basicAuthValue
}

Invoke-WebRequest -Uri "https://teamcity.DOMAIN.com/httpAuth/app/rest/server/backup?includeConfigs=true&includeDatabase=false&includeBuildLogs=false&fileName=TeamCity_Backup_" -Method Post -Headers $Headers