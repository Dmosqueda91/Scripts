# Check if OneDrive is running
if (Get-Process -Name "OneDrive" -ErrorAction SilentlyContinue) {
    # Get OneDrive configuration
    $onedriveConfig = Get-ItemProperty -Path "HKCU:\Software\Microsoft\OneDrive\Accounts\Business1" -Name "UserFolder"

    # Check the status of each folder
    $desktopStatus = Test-Path -Path (Join-Path -Path $onedriveConfig.UserFolder -ChildPath "Desktop")
    $documentsStatus = Test-Path -Path (Join-Path -Path $onedriveConfig.UserFolder -ChildPath "Documents")
    $picturesStatus = Test-Path -Path (Join-Path -Path $onedriveConfig.UserFolder -ChildPath "Pictures")

    # Output the results
    Write-Host "OneDrive Desktop Backup Status: $desktopStatus"
    Write-Host "OneDrive Documents Backup Status: $documentsStatus"
    Write-Host "OneDrive Pictures Backup Status: $picturesStatus"
} else {
    Write-Host "OneDrive is not running."
}