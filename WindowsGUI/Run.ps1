param($runcommand)

$SCRIPT_PATH = ".\Source.cs"
$SCRIPT_ENCODING = "utf8"

if ($runcommand -ne "RUN") {
    Start-Process (Get-PSHostProcessInfo)[0].ProcessName -WorkingDirectory $PWD.ProviderPath -ArgumentList ($MyInvocation.MyCommand.Path, "RUN") -Wait -NoNewWindow
} else {
    $source = Get-Content -Encoding $SCRIPT_ENCODING -Path $SCRIPT_PATH -Raw
    $assemblyNames = [System.Collections.ArrayList]@()
    ([regex]"\/\/\/\s*import\s+([\w\.]+)\s*;").Matches($source) | ForEach-Object {$assemblyNames.Add($_.Groups[1].Value.Trim())} | Out-Null
    Add-Type -ReferencedAssemblies $assemblyNames.ToArray() -TypeDefinition "$source"
    [Program]::Main()
    exit
}
