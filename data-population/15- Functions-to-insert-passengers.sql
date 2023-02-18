  create or replace function get_latinCountry
        return varchar2
    is
        id_pais pais.pais_id%type;
        begin 
           
           select pais_id into id_pais from 
                        (select pais_id from pais where acronimo NOT IN ('USA','CAN') order by dbms_random.value)
                        where rownum = 1;      
           return id_pais;
        end;
    /

-----

    create or replace function get_passport 
       return number deterministic is 
       begin 
            return floor(dbms_random.value(1000000,15000000000));
       end;
    /

------

 create or replace function get_birthDate
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
        /
    
-------

create or replace function get_lastname
        return varchar2
    is
        apellido temp_lastnames.lastname%type;
        begin 
           
           select lastname into apellido from 
                        (select lastname from temp_lastnames order by dbms_random.value)
                        where rownum = 1;
           return apellido;
        end;
    /