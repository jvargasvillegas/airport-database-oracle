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