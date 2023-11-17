# PowerShell script to retrieve and log high CPU utilization processes

# Additionally added the sort-object in descending.

# Retrieve a list of running processes
$processes = Get-Process

#  Filter processes to display only those with high CPU utilization (above 80%)
$highCPUProcesses = $processes | Where-Object { $_.CPU -gt 80 } | Sort-Object CPU -Descending

# : Save the list of high CPU utilization processes to a log file with the current date and time
$logFilePath = "HighCPUProcesses_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"
$highCPUProcesses | Format-Table -AutoSize | Out-File -FilePath $logFilePath

# Display a message indicating the completion of the script
Write-Host "High CPU Utilization processes have been logged to: $logFilePath"

