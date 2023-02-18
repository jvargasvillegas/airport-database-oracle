--Pasajero con la información de su tiquete

select  substr(v.vuelo_id,6,6) as "Número de vuelo", initcap(p.nombre || ' ' || p.apellido) 
as "Nombre", v.fecha_salida as "Fecha Salida", o.nombre|| ', ' || a.ciudad || 
' ('||o.ACRONIMO||')' as "Desde", v.fecha_llegada as "Fecha llegada",
l.nombre|| ', ' || b.ciudad || ' ('||l.ACRONIMO||')' as "Destino",
t.numero_asiento as "Asiento", t.clase_alta as "Clase Alta" from tiquete t 
inner join pasajero p on t.pasajero_id = p.pasajero_id
inner join vuelo v on t.vuelo_id = v.vuelo_id 
inner join aeropuerto a on v.aeropuerto_salida_id = a.aeropuerto_id
inner join aeropuerto b on v.aeropuerto_destino_id = b.aeropuerto_id
inner join pais o on a.pais_id = o.pais_id
inner join pais l on b.pais_id = l.pais_id
order by p.nombre asc;

----
SELECT substr(VUELO_ID,6,6) as "Vuelo numero", B.NOMBRE||' | '||B.ciudad||' ('||D.ACRONIMO||')' Desde
    , C.NOMBRE||' | '|| C.ciudad||' ('||e.ACRONIMO||')' Destino, 
    TO_CHAR(FECHA_SALIDA,'YYYY-MM-DD HH24:MI:SS') Salida, TO_CHAR(FECHA_LLEGADA, '	YYYY-MM-DD HH24:MI:SS') Llegada ,
    TO_CHAR ( FLOOR (a.duracion_minutos / 60)) || ':'|| TO_CHAR ( MOD (a.duracion_minutos, 60), 'FM00')||' horas' Duracion
    FROM VUELO A 
    INNER JOIN AEROPUERTO B ON A.AEROPUERTO_SALIDA_ID = B.AEROPUERTO_ID  
    INNER JOIN AEROPUERTO C ON A.AEROPUERTO_DESTINO_ID = C.AEROPUERTO_ID     
    inner join pais d
    on b.pais_id = d.pais_id
    inner join pais e
    on e.pais_id = c.pais_id
    ORDER BY FECHA_SALIDA DESC;
    
    -- Vuelo especifico
    SELECT substr(VUELO_ID,6,6) as "Vuelo numero",
    B.ciudad||' ('||D.ACRONIMO||')' Desde
    , C.ciudad||' ('||e.ACRONIMO||')' Destino, 
    TO_CHAR(FECHA_SALIDA,'YYYY-MM-DD HH24:MI:SS') Salida, TO_CHAR(FECHA_LLEGADA, '	YYYY-MM-DD HH24:MI:SS') Llegada ,
    TO_CHAR ( FLOOR (a.duracion_minutos / 60)) || ':'|| TO_CHAR ( MOD (a.duracion_minutos, 60), 'FM00')||' horas' Duracion
    FROM VUELO A 
    INNER JOIN AEROPUERTO B ON A.AEROPUERTO_SALIDA_ID = B.AEROPUERTO_ID  
    INNER JOIN AEROPUERTO C ON A.AEROPUERTO_DESTINO_ID = C.AEROPUERTO_ID     
    inner join pais d
    on b.pais_id = d.pais_id
    inner join pais e
    on e.pais_id = c.pais_id
    where e.acronimo = 'COL'
    ORDER BY FECHA_SALIDA DESC;


    -- Aerolineas por vuelo
    SELECT substr(VUELO_ID,6,6) as "Vuelo numero",
    B.ciudad||' ('||D.ACRONIMO||')' Desde,
    C.ciudad||' ('||e.ACRONIMO||')' Destino, 
    TO_CHAR ( FLOOR (a.duracion_minutos / 60)) || ':'|| TO_CHAR ( MOD (a.duracion_minutos, 60), 'FM00')||' horas' Duracion,
    f.nombre Aerolinea
    FROM VUELO A 
    INNER JOIN AEROPUERTO B ON A.AEROPUERTO_SALIDA_ID = B.AEROPUERTO_ID  
    INNER JOIN AEROPUERTO C ON A.AEROPUERTO_DESTINO_ID = C.AEROPUERTO_ID     
    inner join pais d
    on b.pais_id = d.pais_id
    inner join pais e
    on e.pais_id = c.pais_id
    inner join aerolinea f
    on a.aerolinea_id = f.aerolinea_id
    ORDER BY FECHA_SALIDA DESC;
    
    -- Lista de paises, su acronimo segun norma ISO, sus aeropuertos, ciudad y zona horaria
    
    select b.nombre Pais, b.acronimo Acronimo, a.ciudad Ciudad, 
    c.nombre Zona_horaria, a.nombre Aeropuerto
    from aeropuerto a
    inner join pais b
    on a.pais_id = b.pais_id
    inner join zona_horaria c
    on a.zona_horaria_id = c.zona_horaria_id
    order by 1,3;


--Datos factura

 SELECT initcap(x.nombre || ' ' || x.apellido || ' ' || x.segundo_apellido) Pasajero, substr(t.tiquete_id,6,6) as 
 "Tiquete numero", substr(a.VUELO_ID,6,6) as 
 "Vuelo numero", B.NOMBRE||' | '||B.ciudad||' ('||D.ACRONIMO||')' Desde
    , C.NOMBRE||' | '|| C.ciudad||' ('||e.ACRONIMO||')' Destino, 
    FECHA_SALIDA Salida, FECHA_LLEGADA Llegada,
    TO_CHAR ( FLOOR (a.duracion_minutos / 60)) || ':'|| TO_CHAR ( MOD (a.duracion_minutos, 60), 'FM00')||' horas' Duracion,
    '$'|| f.precio Precio
    FROM VUELO A
    INNER JOIN TIQUETE T ON T.VUELO_ID = A.VUELO_ID
    INNER JOIN PASAJERO X ON T.PASAJERO_ID = X.PASAJERO_ID
    INNER JOIN AEROPUERTO B ON A.AEROPUERTO_SALIDA_ID = B.AEROPUERTO_ID  
    INNER JOIN AEROPUERTO C ON A.AEROPUERTO_DESTINO_ID = C.AEROPUERTO_ID 
    INNER JOIN FACTURA F ON F.TIQUETE_ID = T.TIQUETE_ID
    inner join pais d
    on b.pais_id = d.pais_id
    inner join pais e
    on e.pais_id = c.pais_id
    ORDER BY FECHA_SALIDA DESC;