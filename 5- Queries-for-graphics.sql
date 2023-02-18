-- #1
-- Mapa de países y aeropuertos

--Consulta

select p.nombre as "País", a.nombre as " Aeropuerto"
from aeropuerto a join pais p on a.pais_id = p.pais_id
order by p.nombre ASC;

-- #2
-- Cantidad de vuelos según la fecha de llegada

-- Consulta 

--Solo uno
select a.nombre as "Aeropuerto", count (1) 
as "Cantidad de vuelos" from vuelo v
join aeropuerto a on v.aeropuerto_destino_id = a.aeropuerto_id
where v.fecha_llegada = '15-JUN-19' 
group by a.nombre order by a.nombre ASC;

--General

select a.nombre as "Aeropuerto", v.fecha_llegada as "Fecha de llegada",
count (1) as "Cantidad de vuelos" from vuelo v
join aeropuerto a on v.aeropuerto_destino_id = a.aeropuerto_id
group by a.nombre, v.fecha_llegada order by a.nombre ASC;

-- #3
-- Cantidad de vuelos que llegan a cada país

-- Consulta 

select pais.nombre as "Destino",
count(1) as "Cantidad de vuelos" from vuelo
join aeropuerto on vuelo.aeropuerto_destino_id =
aeropuerto.aeropuerto_id join pais on 
aeropuerto.pais_id = pais.pais_id
group by pais.nombre order by pais.nombre
ASC;

-- #4
-- Cantidad de vuelos con mayor cantidad de pasajeros

-- Consulta

select v.vuelo_id as "Vuelo ID", count(1) as "Cantidad"
from tiquete t join vuelo v on t.vuelo_id = v.vuelo_id
group by v.vuelo_id order by "Cantidad" DESC;

-- #5
--Cantidad de vuelos según la fecha de salida

--Consulta

select fecha_llegada as "Fecha de Salida", count(1) as "Cantidad" from vuelo
group by fecha_llegada;

-- #6
-- Destinos más visitados

-- Consulta

select pais.nombre as "Destino",
count(1) as "Cantidad de vuelos" from vuelo
join aeropuerto on vuelo.aeropuerto_destino_id =
aeropuerto.aeropuerto_id join pais on 
aeropuerto.pais_id = pais.pais_id
group by pais.nombre order by "Cantidad de vuelos"
DESC;

-- #7
-- Destinos menos visitados

-- Consulta

select pais.nombre as "Destino",
count(1) as "Cantidad de vuelos" from vuelo
join aeropuerto on vuelo.aeropuerto_destino_id =
aeropuerto.aeropuerto_id join pais on 
aeropuerto.pais_id = pais.pais_id
group by pais.nombre order by "Cantidad de vuelos"
ASC;

---- #8
-- Los primeros 10 destinos más caros

-- Consulta

--General

select p.nombre as "Destino", count(precio) as "Suma" from factura f
join tiquete t on f.tiquete_id = t.tiquete_id
join vuelo v on t.vuelo_id = v.vuelo_id
join aeropuerto a on v.aeropuerto_destino_id = a.aeropuerto_id
join pais p on a.pais_id = p.pais_id
group by p.nombre order by "Suma" DESC;

--Solo uno

select p.nombre as "Destino", count(precio) as "Suma" from factura f
join tiquete t on f.tiquete_id = t.tiquete_id
join vuelo v on t.vuelo_id = v.vuelo_id
join aeropuerto a on v.aeropuerto_destino_id = a.aeropuerto_id
join pais p on a.pais_id = p.pais_id where p.nombre = 'Suiza'
group by p.nombre order by "Suma" DESC;

---- #9
-- Los últimos 10 destinos menos caros

-- Consulta

--General

select p.nombre as "Destino", count(precio) as "Suma" from factura f
join tiquete t on f.tiquete_id = t.tiquete_id
join vuelo v on t.vuelo_id = v.vuelo_id
join aeropuerto a on v.aeropuerto_destino_id = a.aeropuerto_id
join pais p on a.pais_id = p.pais_id 
group by p.nombre order by "Suma" ASC;

--Solo uno 
select p.nombre as "Destino", count(precio) as "Suma" from factura f
join tiquete t on f.tiquete_id = t.tiquete_id
join vuelo v on t.vuelo_id = v.vuelo_id
join aeropuerto a on v.aeropuerto_destino_id = a.aeropuerto_id
join pais p on a.pais_id = p.pais_id where p.nombre = 'Chile'
group by p.nombre order by "Suma" ASC;


-- #10
-- Cantidad de empleados por local y aeropuerto

-- Consulta

--Solo uno 

select 'En el Aeropuerto Isla San Cristobal hay ' || count(1)
|| ' empleados que son del local Farmacia.' as
"Cantidad de empleados por local y aeropuerto"
from empleado join local 
on empleado.local_id = local.local_id
join aeropuerto on local.aeropuerto_id =
aeropuerto.aeropuerto_id where local.nombre = 'Farmacia'
and aeropuerto.nombre = 'Aeropuerto Isla San Cristobal';

--General

select aeropuerto.nombre as "Aeropuerto", local.nombre as "Local", 
count(1) as "Cantidad" from empleado join local 
on empleado.local_id = local.local_id
join aeropuerto on local.aeropuerto_id =
aeropuerto.aeropuerto_id group by aeropuerto.nombre, 
local.nombre order by "Cantidad" DESC; 

-- #11
-- Los 10 primeros locales y aeropuertos con mayor cantidad de empleados

-- Consulta

--Solo uno 

select 'En el Aeropuerto Internacional Juan Santa Maria hay ' || count(1)
|| ' empleados que son del local Farmacia.' as
"Cantidad de empleados por local y aeropuerto"
from empleado join local 
on empleado.local_id = local.local_id
join aeropuerto on local.aeropuerto_id =
aeropuerto.aeropuerto_id where local.nombre = 'Farmacia'
and aeropuerto.nombre = 'Aeropuerto Internacional JuanSanta Maria';

--General

select aeropuerto.nombre as "Aeropuerto", local.nombre as "Local", 
count(1) as "Cantidad" from empleado join local 
on empleado.local_id = local.local_id
join aeropuerto on local.aeropuerto_id =
aeropuerto.aeropuerto_id group by aeropuerto.nombre, 
local.nombre order by "Cantidad" DESC; 

-- #12
-- Cantidad de empleados por local a nivel mundial

-- Consulta

-- Solo uno 
select 'El local 7 Eleven tiene ' || count(1)
|| ' empleados.' as
"Cantidad de empleados por local"
from empleado join local 
on empleado.local_id = local.local_id
where local.nombre = '7 Eleven';

-- General

select local.nombre, count(1) as "Cantidad"
from empleado join local 
on empleado.local_id = local.local_id
group by local.nombre order by
"Cantidad" ASC;


-- #13
-- Los 10 primeros locales con más empleados

-- Consulta

-- Solo uno 
select 'El local Taco Bell tiene ' || count(1)
|| ' empleados.' as
"Cantidad de empleados por local"
from empleado join local 
on empleado.local_id = local.local_id
where local.nombre = 'Taco Bell';

-- General

select local.nombre, count(1) as "Cantidad"
from empleado join local 
on empleado.local_id = local.local_id
group by local.nombre order by
"Cantidad" DESC;

---- #14
-- Las primeras 10 aerolíneas con más vuelos

-- Consulta

select a.nombre as "Aerolinea", count(1) as "Cantidad"
from vuelo v join aerolinea a on
v.aerolinea_id = a.aerolinea_id
group by a.nombre order by "Cantidad" DESC;

---- #15
-- Las últimas 10 aerolíneas con menos vuelos

-- Consulta

select a.nombre as "Aerolinea", count(1) as "Cantidad"
from vuelo v join aerolinea a on
v.aerolinea_id = a.aerolinea_id
group by a.nombre order by "Cantidad" ASC;

---- #16
-- Los primeros 10 modelos con más aviones

-- Consulta

select modelo.nombre as "Modelo", count(1) as "Cantidad de aviones"
from avion join modelo on avion.modelo_id = modelo.modelo_id
group by modelo.nombre order by "Cantidad de aviones" DESC;

---- #17
-- Los últimas 10 modelos con menos aviones

-- Consulta

select modelo.nombre as "Modelo", count(1) as "Cantidad de aviones" 
from avion join modelo on avion.modelo_id = modelo.modelo_id
group by modelo.nombre order by "Cantidad de aviones" ASC;


-- #18

-- Las primeras 10 aerolíneas con mayor cantidad de tripulantes

--Consulta

select a.nombre as "Aerolinea", count(1) as "Cantidad de tripulantes"
from empleado e join aerolinea a on e.aerolinea_id = a.aerolinea_id
group by a.nombre order by "Cantidad de tripulantes" DESC;