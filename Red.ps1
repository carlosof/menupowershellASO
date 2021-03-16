clear
do{
    Write-Host "1. IP Pública"
    write-Host "2. Adaptadores de red"
    Write-Host "3. Salir"
   [int]$option = Read-Host "Selecciona una opcion"

   if ($option -gt "3"){
   Write-Host "-------"
   Write-Host "ERROR! Las Opciones validas son:"
   Write-Host "-------"
   }

switch($option){
        1 {
            Clear-Host
            (Invoke-WebRequest -uri "http://ipinfo.io/ip").Content
            pause;
            break
        }
        2 {
            Clear-Host
            gip
            pause; 
            break
        }

        3 {"Exit"; break
        default {Write-Host "Fin";pause}
            }


    }
 } until($option -eq "3") 
