declare
	tiquetes int;
    numero_asiento int := 1;
    total_recorridos int := 0;
    pasajero_id pasajero.pasajero_id%type;
begin
    for rec in (select vuelo_id from vuelo where fecha_salida > '14-06-19' and fecha_salida < '20-06-19')
    loop        
    
        select round(dbms_random.value(30,40),0) into tiquetes from dual;
        numero_asiento := 1;
        for x in reverse 1..tiquetes
        loop
            pasajero_id := get_ramdonPasajero();
             insert into tiquete (vuelo_id, pasajero_id, numero_asiento, tiquete_id,CLASE_ALTA) 
                          values (rec.vuelo_id,pasajero_id,numero_asiento,sys_guid(), 0);
             numero_asiento := numero_asiento + 1;
        end loop;
        commit;
    end loop;
end;
/

select count(1) from vuelo where fecha_salida > '14-06-19' and fecha_salida < '20-06-19'

select count(distinct(pasajero_id)) from tiquete;

select count(1) from tiquete;

select min(fecha_salida) from vuelo;

select min(fecha_salida) from tiquete a inner join vuelo b
on a.vuelo_id = b.vuelo_id





  