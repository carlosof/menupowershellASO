clear
do{
    Write-Host "1. Información de red"
    write-Host "2. Información de hardware"
    Write-Host "3. Servicios/Procesos"
    write-Host "4. Seguridad"
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
            & '.\Desktop\Scripts menu\Red.ps1';
            Clear-Host
            pause;
            break
        }
        2 {
            Clear-Host
            & '.\Desktop\Scripts menu\Hardware.ps1';
             Clear-Host
            pause; 
            break
        }
        3 {
            Clear-Host
            & '.\Desktop\Scripts menu\ServiciosProcesos.ps1';
            Clear-Host
            pause;
            break
            }
         4 {
            Clear-Host
            & '.\Desktop\Scripts menu\Seguridad.ps1';
            Clear-Host
            pause;
            break
            }
        5 {"Saliendo del menú"; break
        default {Write-Host "Fin";pause}
            }


    }
 } until($option -eq "5") 
