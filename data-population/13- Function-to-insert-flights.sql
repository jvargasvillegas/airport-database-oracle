create or replace function get_randomAirport(countryAcronym varchar2)
        return varchar2
    is
        aeropuerto_id aeropuerto.aeropuerto_id%type;
        begin 
           select aeropuerto_id into aeropuerto_id from 
                        (select aeropuerto_id from aeropuerto a 
                        inner join pais b 
                        on a.pais_id = b.pais_id
                        where b.acronimo <> countryAcronym
                        order by dbms_random.value)
                        where rownum = 1;      
           return aeropuerto_id;             
        end;
    /

--------

create or replace function get_randomAirplane(airline_id varchar2)
        return varchar2
    is
        avion_id avion.avion_id%type;
        begin 
           select avion_id into avion_id from 
                        (select avion_id from avion 
                        where aerolinea_id <> airline_id
                        order by dbms_random.value)
                        where rownum = 1;      
           return avion_id;             
        end;
    /

-------


create or replace function get_randomAirline
        return varchar2
    is
        aerolinea_id aerolinea.aerolinea_id%type;
        begin 
           select aerolinea_id into aerolinea_id from 
                        (select aerolinea_id from aerolinea order by dbms_random.value)
                        where rownum = 1;      
           return aerolinea_id;             
        end;
    /

-------

  create or replace function get_randomPilot
        return varchar2
    is
        piloto_id piloto.piloto_id%type;
        begin 
           select piloto_id into piloto_id from 
                        (select piloto_id from piloto order by dbms_random.value)
                        where rownum = 1;      
           return piloto_id;             
        end;
    /