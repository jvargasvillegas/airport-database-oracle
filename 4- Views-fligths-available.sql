-- vuelos_USA: Para mostrar todos los vuelos que salen de Miami, Florida. 

create view vuelos_USA as
     SELECT VUELO_ID,
    B.ciudad||' ('||D.ACRONIMO||')' Desde
    , C.ciudad||' ('||e.ACRONIMO||')' Destino, 
    FECHA_SALIDA Salida, FECHA_LLEGADA Llegada ,
    TO_CHAR ( FLOOR (a.duracion_minutos / 60)) || ':'|| TO_CHAR ( MOD (a.duracion_minutos, 60), 'FM00')||' horas' Duracion
    FROM VUELO A 
    INNER JOIN AEROPUERTO B ON A.AEROPUERTO_SALIDA_ID = B.AEROPUERTO_ID  
    INNER JOIN AEROPUERTO C ON A.AEROPUERTO_DESTINO_ID = C.AEROPUERTO_ID     
    inner join pais d
    on b.pais_id = d.pais_id
    inner join pais e
    on e.pais_id = c.pais_id
    where b.ciudad = 'Miami, Florida' 
    ORDER BY FECHA_SALIDA DESC;

select * from vuelos_USA;

-- vuelos_MEXUSA: Para ver los vuelos de México a Miami.

   create view vuelos_MEXUSA as
     SELECT VUELO_ID,
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
    where c.ciudad = 'Miami, Florida' and d.acronimo = 'MEX'
    ORDER BY FECHA_SALIDA DESC;

select * from vuelos_MEXUSA

-- itinerario_MEX_MIAMI: Para mostrar las conexiones. 

create view itinerario_MEX_MIAMI as
    SELECT substr(A.VUELO_ID,6,6) as "Numero de vuelo", substr(x.itinerario_id,6,6) 
     as "Numero de itinerario",
    B.ciudad||' ('||D.ACRONIMO||')' Desde
    , C.ciudad||' ('||e.ACRONIMO||')' Destino, 
    A.FECHA_SALIDA Salida, A.FECHA_LLEGADA Llegada,
    TO_CHAR ( FLOOR (A.duracion_minutos / 60)) || ':'|| TO_CHAR ( MOD (A.duracion_minutos, 60), 'FM00')||' horas' Duracion
    FROM CONEXIONES X
    INNER JOIN VUELO A ON X.VUELO_ID = A.VUELO_ID
    INNER JOIN AEROPUERTO B ON A.AEROPUERTO_SALIDA_ID = B.AEROPUERTO_ID  
    INNER JOIN AEROPUERTO C ON A.AEROPUERTO_DESTINO_ID = C.AEROPUERTO_ID     
    inner join pais d
    on b.pais_id = d.pais_id
    inner join pais e
    on e.pais_id = c.pais_id
    ORDER BY X.ITINERARIO_ID, B.CIUDAD ASC;

select * from itinerario_mex_miami;