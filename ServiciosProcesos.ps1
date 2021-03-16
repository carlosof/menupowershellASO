clear
do{
    Write-Host "1. Lista de procesos"
    write-Host "2. Estado de un proceso"
    Write-Host "3. Lista de servicios"
    write-Host "4. Estado de un servicio"
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
           Get-Process
            pause;
            break
        }
        2 {
Clear-Host

$NOMBRE = Read-Host "Nombre del proceso"
$PROCESO = Get-Process -Name $NOMBRE

Write-Host "Nombre: " -ForegroundColor Cyan -NoNewline
Write-Host $PROCESO.Name

Write-Host "Id: " -ForegroundColor Cyan -NoNewline
Write-Host $PROCESO.Id

Write-Host "Prioridad: " -ForegroundColor Cyan -NoNewline
Write-Host $PROCESO.PriorityClass

Write-Host "Memoria Virtual: " -ForegroundColor Cyan -NoNewline
Write-Host $PROCESO.VirtualMemorySize "MB"

Write-Host "Tiempo de CPU: " -ForegroundColor Cyan -NoNewline
Write-Host $PROCESO.CPU "seg."

Write-Host "Ruta: " -ForegroundColor Cyan -NoNewline
Write-Host $PROCESO.Path

Write-Host "Fabricante: " -ForegroundColor Cyan -NoNewline
Write-Host $PROCESO.Company

Write-Host "Descripción: " -ForegroundColor Cyan -NoNewline
Write-Host $PROCESO.Description

$RESPUESTA = Read-Host "¿Quiere parar el proceso? [s/n]"
if ($RESPUESTA -eq "s") {
    Stop-Process -InputObject $PROCESO
}
            pause; 
            break
        }
        3 {
            Clear-Host
            Get-Service
            pause;
            break
            }
         4 {
           Clear-Host

$NOMBRE = Read-Host "Nombre del servicio"
$SERVICIO = Get-Service -Name $NOMBRE

Write-Host "Nombre: " -ForegroundColor Cyan -NoNewline
Write-Host $SERVICIO.Name

Write-Host "Descripción: " -ForegroundColor Cyan -NoNewline
Write-Host $SERVICIO.DisplayName

Write-Host "Estado: " -ForegroundColor Cyan -NoNewline
Write-Host $SERVICIO.Status

Write-Host "Inicio: " -ForegroundColor Cyan -NoNewline
Write-Host $SERVICIO.StartType

Write-Host "Servicios Requeridos: " -ForegroundColor Yellow
$REQUERIDOS = $SERVICIO.RequiredServices

foreach ($R in $REQUERIDOS) {
    Write-Host $R.Name ":" $R.Status   
}

if ($SERVICIO.Status -eq "Stopped") {
    $RESPUESTA = Read-Host "¿Quiere iniciar los servicios detenidos? [s/n]?"
    if ($RESPUESTA -eq "s") {
        Write-Host "Activando servicios..."

        foreach ($R in $REQUERIDOS) {
            if ($R.Status -eq "Stopped") { Start-Service $R }  
        }

        Start-Service $SERVICIO
    }
}

            pause;
            break
            }
        5 {"Exit"; break
        default {Write-Host "Fin";pause}
            }


    }
 } until($option -eq "5") 
