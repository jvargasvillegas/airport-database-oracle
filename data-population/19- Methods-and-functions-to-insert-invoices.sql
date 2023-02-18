--Funcion

create or replace function get_randomPrecioTiquete
       return number deterministic is 
       begin 
            return floor(dbms_random.value(300,900));
       end;
    /

--Insert

declare
	fechafactura date; 
begin
    for rec in (select tiquete_id from tiquete)
    loop        
    select add_months(b.fecha_salida, -1) into fechafactura from vuelo b inner join tiquete a
    on b.vuelo_id = a.vuelo_id where a.tiquete_id = rec.tiquete_id;
insert into factura values (sys_guid(),fechafactura,rec.tiquete_id, get_randomPrecioTiquete());
    end loop;
end;