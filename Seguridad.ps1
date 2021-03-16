clear
do{
    Write-Host "1. Log de errores y avisos del sistema"
    write-Host "2. Activar firewall"
    Write-Host "3. Desactivar firewall (Cuidado!!)"
    write-Host "4. Estado del firewall"
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
            $today = Get-Date
            Get-EventLog -LogName system -EntryType Error, Warning
            pause;
            break
        }
        2 {
            Clear-Host
            Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled true;
            Write-Host "Firewall activado" -ForegroundColor Green;
            pause; 
            break
        }
        3 {
            Clear-Host
            Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False;
            Write-Host "Firewall desactivado" -ForegroundColor Red;
            pause;
            break
            }
         4 {
            Clear-Host
            netsh advfirewall show allprofiles state;
            pause;
            break
            }
        5 {"Exit"; break
        default {Write-Host "Fin";pause}
            }


    }
 } until($option -eq "5") 
