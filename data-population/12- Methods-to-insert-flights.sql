--- Vuelos -- 2 vuelos cada 15 minutos, desde Mex DF a algun destino del mundo... por el siguiente mes
set serveroutput on;
set verify off;
declare
    aeropuerto_id_origen aeropuerto.aeropuerto_id%type; 
    aeropuerto_id_destino aeropuerto.aeropuerto_id%type;
    hora_vuelo date := sysdate();
    aerolinea_id aerolinea.aerolinea_id%type;
    avion_id avion.avion_id%type;
    vuelo_minutos int;
begin

    select aeropuerto_id into  aeropuerto_id_origen 
    from aeropuerto a inner join pais b on a.pais_id = b.pais_id where b.acronimo = 'MEX' and a.ciudad = 'Ciudad de Mexico';
    for m in reverse 1..2880
    loop
        FOR N IN REVERSE 1..2
        LOOP
            
            select get_randomAirport('MEX') into aeropuerto_id_destino from dual;
            select get_randomAirline() into aerolinea_id from dual;
            select get_randomAirplane(aerolinea_id) into avion_id from dual;
            select round(dbms_random.value(120,700),0) into vuelo_minutos from dual;
            
            insert into vuelo values ((select sys_guid() from dual), 
                     aeropuerto_id_origen,
                     aeropuerto_id_destino,
                     hora_vuelo,
                     hora_vuelo + vuelo_minutos/1440,
                     vuelo_minutos,
                     get_randomPilot(),
                     get_randomPilot(),
                     get_randomPilot(),
                     aerolinea_id,
                     avion_id
                     );
        END LOOP;
        hora_vuelo := hora_vuelo + interval '15' minute;
    end loop;
END;
/

--- Vuelos -- 2 vuelos cada 15 minutos, desde Mex DF a algun destino del mundo para el pasado mes
set serveroutput on;
set verify off;
declare
    aeropuerto_id_origen aeropuerto.aeropuerto_id%type; 
    aeropuerto_id_destino aeropuerto.aeropuerto_id%type;
    hora_vuelo date := add_months(sysdate(),-1);
    aerolinea_id aerolinea.aerolinea_id%type;
    avion_id avion.avion_id%type;
    vuelo_minutos int;
begin

    select aeropuerto_id into  aeropuerto_id_origen 
    from aeropuerto a inner join pais b on a.pais_id = b.pais_id where b.acronimo = 'MEX' and a.ciudad = 'Ciudad de Mexico';
    for m in reverse 1..2880
    loop
        FOR N IN REVERSE 1..2
        LOOP
            
            select get_randomAirport('MEX') into aeropuerto_id_destino from dual;
            select get_randomAirline() into aerolinea_id from dual;
            select get_randomAirplane(aerolinea_id) into avion_id from dual;
            select round(dbms_random.value(120,700),0) into vuelo_minutos from dual;
            
            insert into vuelo values ((select sys_guid() from dual), 
                     aeropuerto_id_origen,
                     aeropuerto_id_destino,
                    hora_vuelo,
                     hora_vuelo + vuelo_minutos/1440,
                     vuelo_minutos,
                     get_randomPilot(),
                     get_randomPilot(),
                     get_randomPilot(),
                     aerolinea_id,
                     avion_id
                     );
        END LOOP;
        hora_vuelo := hora_vuelo + interval '15' minute;
    end loop;
END;
/
