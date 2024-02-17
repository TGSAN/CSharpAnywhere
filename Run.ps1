Start-Job -ScriptBlock {
    Set-Location $using:PWD;
    $source = Get-Content -Encoding "utf8" -Path ".\Source.cs" -Raw
    $assemblyNames = [System.Collections.ArrayList]@()
    ([regex]"using(\s+static)?\s+([\w\.]+);").Matches($source) | ForEach-Object {$assemblyNames.Add($_.Groups[2].Value.Trim())} | Out-Null
    Add-Type -ReferencedAssemblies $assemblyNames.ToArray() -TypeDefinition "$source"
    [Program]::Main()
} | Receive-Job -Wait -AutoRemoveJob