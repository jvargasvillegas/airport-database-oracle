insert into pasajero(pasajero_id, nombre, apellido, segundo_apellido, fecha_nacimiento, pais_id, pasaporte,correo_electronico,telefono)
select 
    sys_guid(),
    name, 
    b.lastname,
    'pendiente',
    sysdate,
    (select pais_id from pais where rownum = 1),
    get_passport(),
    a.name||'.'||b.lastname||'@gmail.com',
    dbms_random.value(10000000,99999999)
from TEMP_NAMES A
cross join TEMP_LASTNAMES B;

---- Updating pasajeros
set serveroutput on;
set verify off;
declare
	
begin
    for rec in (select pasajero_id from pasajero)
    loop
        update pasajero 
        set pasaporte = get_passport(), 
            segundo_apellido = get_lastname(),
            fecha_nacimiento = get_birthDate(),
            pais_id = get_latinCountry()
        where pasajero_id = rec.pasajero_id;
    end loop;
end;
/

