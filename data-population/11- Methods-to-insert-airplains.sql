declare
id_747 modelo.modelo_id%TYPE;
id_777 modelo.modelo_id%TYPE;
id_A340 modelo.modelo_id%TYPE;
id_767 modelo.modelo_id%TYPE;
id_A330 modelo.modelo_id%TYPE;
id_757 modelo.modelo_id%TYPE;
id_747_8 modelo.modelo_id%TYPE;
id_737_MAX8 modelo.modelo_id%TYPE;
id_717_exMD95 modelo.modelo_id%TYPE;
id_A320_neo8 modelo.modelo_id%TYPE;
id_A350 modelo.modelo_id%TYPE;
id_A380 modelo.modelo_id%TYPE;
begin
select modelo_id into id_747 from modelo where nombre = 'Boeing 747';
select modelo_id into id_777 from modelo where nombre = 'Boeing 777';
select modelo_id into id_A340 from modelo where nombre = 'Airbus A340';
select modelo_id into id_767 from modelo where nombre = 'Boeing 767';
select modelo_id into id_A330 from modelo where nombre = 'Airbus A330';
select modelo_id into id_757 from modelo where nombre = 'Boeing 757';
select modelo_id into id_747_8 from modelo where nombre = 'Boeing 747-8';
select modelo_id into id_737_MAX8 from modelo where nombre = 'Boeing 737 MAX 8';
select modelo_id into id_717_exMD95 from modelo where nombre = 'Boeing 717 ex MD95';
select modelo_id into id_A320_neo8 from modelo where nombre = 'Airbus A320 neo 8';
select modelo_id into id_A350 from modelo where nombre = 'Airbus A350';
select modelo_id into id_A380 from modelo where nombre = 'Airbus A380';
    for rec in (select aerolinea_id from aerolinea) 
    loop
        for x in reverse 1..20
        loop
            insert into avion values(sys_guid(), 416, rec.aerolinea_id, id_747);
        end loop;
        for x in reverse 1..25
        loop
            insert into avion values(sys_guid(), 300, rec.aerolinea_id, id_777);
        end loop;
        for x in reverse 1..32
        loop
            insert into avion values(sys_guid(), 375, rec.aerolinea_id, id_A340);
        end loop;
        for x in reverse 1..52
        loop
            insert into avion values(sys_guid(), 375, rec.aerolinea_id, id_767);
        end loop;
        for x in reverse 1..48
        loop
            insert into avion values(sys_guid(), 335, rec.aerolinea_id, id_A330);
        end loop;
        for x in reverse 1..20
        loop
            insert into avion values(sys_guid(), 289, rec.aerolinea_id, id_757);
        end loop;
        for x in reverse 1..20
        loop
            insert into avion values(sys_guid(), 289, rec.aerolinea_id, id_747_8);
        end loop;
        for x in reverse 1..20
        loop
            insert into avion values(sys_guid(), 289, rec.aerolinea_id, id_737_MAX8);
        end loop;
        for x in reverse 1..20
        loop
            insert into avion values(sys_guid(), 289, rec.aerolinea_id, id_717_exMD95);
        end loop;
        for x in reverse 1..20
        loop
            insert into avion values(sys_guid(), 289, rec.aerolinea_id, id_A320_neo8);
        end loop;
         for x in reverse 1..20
        loop
            insert into avion values(sys_guid(), 289, rec.aerolinea_id, id_A350);
        end loop;
         for x in reverse 1..20
        loop
            insert into avion values(sys_guid(), 289, rec.aerolinea_id, id_A380);
        end loop;
    end loop;
end;
/