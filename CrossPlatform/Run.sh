#! /bin/sh
pwsh -Command "\$source = Get-Content -Encoding \"utf8\" -Path \".\\Source.cs\" -Raw; \$assemblyNames = [System.Collections.ArrayList]@(); ([regex]\"\/\/\/\s*import\s+([\w\.]+)\s*;\").Matches(\$source) | ForEach-Object {\$assemblyNames.Add(\$_.Groups[1].Value.Trim())} | Out-Null; Add-Type -ReferencedAssemblies \$assemblyNames.ToArray() -TypeDefinition \"\$source\"; [Program]::Main()"
