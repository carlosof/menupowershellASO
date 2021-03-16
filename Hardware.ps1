clear
do{
    Write-Host "1. BIOS"
    write-Host "2. Procesador"
    Write-Host "3. Memoria Ram"
    write-Host "4. Resumen"
    Write-Host "5. Salir"
   [int]$option = Read-Host "Selecciona una opcion"

   if ($option -gt "5"){
   Write-Host "-------"
   Write-Host "ERROR! Las Opciones validas son:"
   Write-Host "-------"
   }

switch($option){
        1 {
            Clear-Host
            $BIOS = Get-CimInstance -ClassName Win32_BIOS

            Write-Host "Nombre: " -ForegroundColor Cyan -NoNewline
            $BIOS.Name

            Write-Host "Descripción: " -ForegroundColor Cyan -NoNewline
            $BIOS.Description

            Write-Host "Fabricante: " -ForegroundColor Cyan -NoNewline
            $BIOS.Manufacturer

            Write-Host "Número de serie: " -ForegroundColor Cyan -NoNewline
            $BIOS.SerialNumber

            Write-Host "Estado: " -ForegroundColor Cyan -NoNewline
            $BIOS.Status
            pause;
            break
        }
        2 {
            Clear-Host
            $CPU = Get-CimInstance -ClassName Win32_Processor

           Write-Host "Nombre: " -ForegroundColor Cyan -NoNewline
            $CPU.Name

            Write-Host "Descripción: " -ForegroundColor Cyan -NoNewline
            $CPU.Description

            Write-Host "Fabricante: " -ForegroundColor Cyan -NoNewline
            $CPU.Manufacturer

            Write-Host "Bits: " -ForegroundColor Cyan -NoNewline
            $CPU.DataWidth

            Write-Host "Número de núcleos: " -ForegroundColor Cyan -NoNewline
            $CPU.NumberOfCores

            Write-Host "Velocidad (Máx.): " -ForegroundColor Cyan -NoNewline
            $CPU.MaxClockSpeed

            Write-Host "Carga (%): " -ForegroundColor Cyan -NoNewline
            $CPU.LoadPercentage

            Write-Host "Estado: " -ForegroundColor Cyan -NoNewline
            $CPU.Status
            pause; 
            break
        }
        3 {
            Clear-Host
            $MEMORIAS = Get-CimInstance -ClassName Win32_PhysicalMemory

            foreach ($MEM in $MEMORIAS) {
    
             Write-Host $MEM.Tag -ForegroundColor Cyan
             Write-Host "-----------------" -ForegroundColor Cyan
    
             Write-Host "Modelo: " -ForegroundColor Cyan -NoNewline
             Write-Host $MEM.Model

             Write-Host "Fabricante: " -ForegroundColor Cyan -NoNewline
             Write-Host $MEM.Manufacturer

             Write-Host "Bits: " -ForegroundColor Cyan -NoNewline
             Write-Host $MEM.DataWidth

             Write-Host "Velocidad: " -ForegroundColor Cyan -NoNewline
              Write-Host $MEM.Speed

             Write-Host "Capacidad: " -ForegroundColor Cyan -NoNewline
              $Capacidad = (($MEM.Capacity / 1024) /1024)
             Write-Host $Capacidad "MB"

             Write-Host "Estado: " -ForegroundColor Cyan -NoNewline
             Write-Host $MEM.Status
            }
            pause;
            break
            }
         4 {
            Clear-Host

$BIOS = Get-CimInstance -ClassName Win32_Bios
$CPU = Get-CimInstance -ClassName Win32_Processor
$PC = Get-CimInstance -ClassName Win32_ComputerSystem
$GRAF = Get-CimInstance -ClassName Win32_VideoController

$DISCOS = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"

Write-Host "BIOS" -ForegroundColor Green
Write-Host "Nombre: " -ForegroundColor Cyan -NoNewline
Write-Host $BIOS.Name
Write-Host "Fabricante: " -ForegroundColor Cyan -NoNewline
Write-Host $BIOS.Manufacturer

Write-Host "PROCESADOR" -ForegroundColor Green
Write-Host "Nombre: " -ForegroundColor Cyan -NoNewline
Write-Host $CPU.Name
Write-Host "Fabricante: " -ForegroundColor Cyan -NoNewline
Write-Host $CPU.Manufacturer

Write-Host "MEMORIA" -ForegroundColor Green
Write-Host "Capacidad: " -ForegroundColor Cyan -NoNewline
$Capacidad = [math]::round(($PC.TotalPhysicalMemory / 1GB),2)
Write-Host $Capacidad "GB"

Write-Host "GRÁFICOS" -ForegroundColor Green
Write-Host "Nombre: " -ForegroundColor Cyan -NoNewline
Write-Host $GRAF.Name
Write-Host "Modo: " -ForegroundColor Cyan -NoNewline
Write-Host $GRAF.VideoModeDescription

Write-Host "Capacidad del disco duro" -ForegroundColor Green
foreach ($DIS in $DISCOS) {
    Write-Host $DIS.DeviceID " " -ForegroundColor Cyan -NoNewline
    $Capacidad = [math]::round(($DIS.Size / 1GB),2)
    Write-Host $Capacidad "GB"
}
            pause;
            break
            }
        5 {"Saliendo del submenú"; break
        default {Write-Host "Fin";pause}
            }


    }
 } until($option -eq "5") 