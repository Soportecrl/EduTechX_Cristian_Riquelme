# Configuración de directorios
$sourceDirectory = "C:\Scripts\SQLFiles" # Directorio fuente de archivos .sql
$destinationDirectory = "E:\SecureBackup\SQLFiles" # Directorio de destino

# Crear directorio de destino si no existe
if (!(Test-Path -Path $destinationDirectory)) {
    New-Item -ItemType Directory -Path $destinationDirectory
}

# Mover los archivos .sql
Get-ChildItem -Path $sourceDirectory -Filter *.sql | ForEach-Object {
    Move-Item -Path $_.FullName -Destination $destinationDirectory -Force
    Write-Output "Archivo $($_.Name) movido a $destinationDirectory"
}
