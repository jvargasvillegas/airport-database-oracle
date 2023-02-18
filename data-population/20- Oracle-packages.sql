--Paquete para guardar 10 funciones 

create or replace package paquete_Funciones is
function get_birthDate return date;
function get_lastname return varchar2;
function get_lastnameNorthAmerica return varchar2;
function get_latinCountry return varchar2;
function get_norhtAmericaCountry return varchar2;
function get_passport return number deterministic;
function get_ramdonAsiento return varchar2;
function get_ramdonPasajero return varchar2;
function get_ramdonPasajero2 return varchar2;
function get_ramdonPrecioTiquete return number deterministic;
end paquete_Funciones;

create or replace package body paquete_Funciones is

function get_birthDate
        return date
    is
        nacimiento pasajero.fecha_nacimiento%type;
        begin 

           with t as
            (select add_months(sysdate,-1200) start_date, add_months(sysdate,-196) end_date from dual)
            select start_date +
            trunc(dbms_random.value(0,(end_date-start_date+1)))
            into nacimiento
            from t;

           return nacimiento;
        end;
        
function get_lastname
        return varchar2
    is
        apellido temp_lastnames.lastname%type;
        begin 

           select lastname into apellido from 
                        (select lastname from temp_lastnames order by dbms_random.value)
                        where rownum = 1;
           return apellido;
        end;
        
function get_lastnameNorthAmerica
        return varchar2
    is
        apellido temp_lastnames.lastname%type;
        begin 

           select lastname into apellido from 
                        (select lastname from temp_lastnames_northamerica order by dbms_random.value)
                        where rownum = 1;
           return apellido;
        end;
        
function get_latinCountry
        return varchar2
    is
        id_pais pais.pais_id%type;
        begin 

           select pais_id into id_pais from 
                        (select pais_id from pais where acronimo NOT IN ('USA','CAN') order by dbms_random.value)
                        where rownum = 1;      
           return id_pais;
        end;   
        
function get_norhtAmericaCountry
        return varchar2
    is
        id_pais pais.pais_id%type;
        begin 

           select pais_id into id_pais from 
                        (select pais_id from pais where acronimo IN ('USA','CAN') order by dbms_random.value)
                        where rownum = 1;      
           return id_pais;
        end;    
        
function get_passport 
       return number deterministic is 
       begin 
            return floor(dbms_random.value(1000000,15000000000));
       end;   
      
function get_ramdonAsiento
        return varchar2
    is
        asiento_nombre asiento.asiento%type;
        begin 

           select asiento into asiento_nombre from 
                        (select asiento from asiento order by dbms_random.value)
                        where rownum = 1;
           return asiento_nombre;
        end;     
        
function get_ramdonPasajero
        return varchar2
    is
        pasajero_id pasajero.pasajero_id%type;
        begin 

           select pasajero_id into pasajero_id from 
                        (select pasajero_id from pasajero order by dbms_random.value)
                        where rownum = 1;
           return pasajero_id;
        end;

function get_ramdonPasajero2
        return varchar2
    is
        pasajero_id pasajero.pasajero_id%type;
        begin 

           select pasajero_id into pasajero_id from 
                        (select a.pasajero_id from pasajero a left join tiquete b on a.pasajero_id = b.pasajero_id and b.pasajero_id is null order by dbms_random.value)
                        where rownum = 1;
           return pasajero_id;
        end; 
        
function get_ramdonPrecioTiquete
       return number deterministic is 
       begin 
            return floor(dbms_random.value(300,900));
       end;        
end;

-- Paquete para guardar otras 10 funciones

create or replace package paquete_Funciones2 is
function get_ramdonVueloFull return varchar2;
function get_randomAirline return varchar2;
function get_randomAirplane(airline_id varchar2) return varchar2;
function get_randomAirport (countryAcronym varchar2) return varchar2;
function get_randomDepartamento return varchar2;
function get_randomLocal return varchar2;
function get_randomModelo return varchar2;
function get_randomPilot return varchar2;
function get_randomTipo_Equipaje return varchar2;
function get_randomTiquete return varchar2;
end paquete_Funciones2;

create or replace package body paquete_Funciones2 is

function get_ramdonVueloFull
    return varchar2
    is
        vuelo_id vuelo.vuelo_id%type;
        begin 

           select vuelo_id into vuelo_id from 
                            (select a.vuelo_id from vuelo a 
                            inner join tiquete b 
                            on a.vuelo_id = b.vuelo_id
                            order by dbms_random.value)
                        where rownum = 1;
           return vuelo_id;
        end;
   
function get_randomAirline
        return varchar2
    is
        aerolinea_id aerolinea.aerolinea_id%type;
        begin 
           select aerolinea_id into aerolinea_id from 
                        (select aerolinea_id from aerolinea order by dbms_random.value)
                        where rownum = 1;      
           return aerolinea_id;             
        end;

function get_randomAirplane(airline_id varchar2)
        return varchar2
    is
        avion_id avion.avion_id%type;
        begin 
           select avion_id into avion_id from 
                        (select avion_id from avion 
                        order by dbms_random.value)
                        where rownum = 1;      
           return avion_id;             
        end;

function get_randomAirport (countryAcronym varchar2)
        return varchar2
    is
        aeropuerto_id aeropuerto.aeropuerto_id%type;
        begin 
           select aeropuerto_id into aeropuerto_id from 
                        (select aeropuerto_id from aeropuerto a 
                        order by dbms_random.value)
                        where rownum = 1;      
           return aeropuerto_id;             
        end;     
        
function get_randomDepartamento
        return varchar2
    is
        departamento_id departamento.departamento_id%type;
        begin 
           select departamento_id into departamento_id from 
                        (select departamento_id from departamento
                        order by dbms_random.value)
                        where rownum = 1;      
           return departamento_id;
        end;  
        
function get_randomLocal
        return varchar2
    is
        local_id local.local_id%type;
        begin 
           select local_id into local_id from 
                        (select local_id from local
                        order by dbms_random.value)
                        where rownum = 1;      
           return local_id;
        end;      
        
function get_randomModelo
        return varchar2
    is
        modelo_id modelo.modelo_id%type;
        begin 
           select modelo_id into modelo_id from 
                        (select modelo_id from modelo
                        order by dbms_random.value)
                        where rownum = 1;      
           return modelo_id;
        end;    
        
function get_randomPilot
        return varchar2
    is
        piloto_id piloto.piloto_id%type;
        begin 
           select piloto_id into piloto_id from 
                        (select piloto_id from piloto order by dbms_random.value)
                        where rownum = 1;      
           return piloto_id;             
        end;

function get_randomTipo_Equipaje
        return varchar2
    is
        tipo_equipaje_id tipo_equipaje.tipo_equipaje_id%type;
        begin 
           select tipo_equipaje_id into tipo_equipaje_id from 
                        (select tipo_equipaje_id from tipo_equipaje
                        order by dbms_random.value)
                        where rownum = 1;      
           return tipo_equipaje_id;
        end;   

function get_randomTiquete
        return varchar2
    is
        tiquete_id tiquete.tiquete_id%type;
        begin 
           select tiquete_id into tiquete_id from 
                        (select tiquete_id from tiquete
                        order by dbms_random.value)
                        where rownum = 1;      
           return tiquete_id;
        end;        
end;

