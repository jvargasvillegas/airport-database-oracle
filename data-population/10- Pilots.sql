

insert into piloto(piloto_id, nombre, apellido, segundo_apellido, fecha_nacimiento, pais_id, pasaporte,correo_electronico,telefono)
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
    from (select name from temp_names where rownum <= 20) A
    cross join (select lastname from temp_lastnames where rownum <= 20) B;


---- Updating pilotos
set serveroutput on;
set verify off;
declare
	
begin
    for rec in (select piloto_id from piloto)
    loop
        update piloto 
        set pasaporte = get_passport(), 
            segundo_apellido = get_lastname(),
            fecha_nacimiento = get_birthDate(),
            pais_id = get_latinCountry()
        where piloto_id = rec.piloto_id;
    end loop;
end;
/