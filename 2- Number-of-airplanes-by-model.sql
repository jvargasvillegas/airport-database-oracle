select modelo.nombre as "Modelo", count (1) as "Cantidad de aviones" 
from avion join modelo on avion.modelo_id = modelo.modelo_id
group by modelo.nombre order by
"Cantidad de aviones" ASC;