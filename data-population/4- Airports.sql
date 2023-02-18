BEGIN
 -- Aeropuertos Europa
    insert into aeropuerto values (sys_guid(), 'Aeropuerto de Frankfurt', (select pais_id from pais where acronimo = 'DEU'), 1, 'Frankfurt', (select zona_horaria_id from zona_horaria where nombre = 'GMT+2')); 
    insert into aeropuerto values (sys_guid(), 'Aeropuerto de Berlin Schönefeld', (select pais_id from pais where acronimo = 'DEU'), 1, 'Berling', (select zona_horaria_id from zona_horaria where nombre = 'GMT+2')); 
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Munich', (select pais_id from pais where acronimo = 'DEU'), 1, 'Munich', (select zona_horaria_id from zona_horaria where nombre = 'GMT+2'));   
 
    insert into aeropuerto values (sys_guid(), 'Aeropuerto de Zurich', (select pais_id from pais where acronimo = 'CHE'), 1, 'Zurich', (select zona_horaria_id from zona_horaria where nombre = 'GMT+2')); 
    insert into aeropuerto values (sys_guid(), 'Aeropuerto de Génova', (select pais_id from pais where acronimo = 'CHE'), 1, 'Génova', (select zona_horaria_id from zona_horaria where nombre = 'GMT+2')); 
    
    insert into aeropuerto values (sys_guid(), 'Aeropuerto de Bruselas', (select pais_id from pais where acronimo = 'BEL'), 1, 'Bruselas', (select zona_horaria_id from zona_horaria where nombre = 'GMT+2')); 
     
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Leonardo da Vinci', (select pais_id from pais where acronimo = 'ITA'), 1, 'Bruselas', (select zona_horaria_id from zona_horaria where nombre = 'GMT+2')); 
     
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Viena', (select pais_id from pais where acronimo = 'AUT'), 1, 'Viena', (select zona_horaria_id from zona_horaria where nombre = 'GMT+2')); 
    
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Roskilde', (select pais_id from pais where acronimo = 'DNK'), 1, 'Copenhagen', (select zona_horaria_id from zona_horaria where nombre = 'GMT+2')); 
   
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Adolfo Suárez', (select pais_id from pais where acronimo = 'ESP'), 1, 'Madrid', (select zona_horaria_id from zona_horaria where nombre = 'GMT+2')); 
   
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Helsinki', (select pais_id from pais where acronimo = 'FIN'), 1, 'Helsinki', (select zona_horaria_id from zona_horaria where nombre = 'GMT+3')); 
       
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Charles de Gaulle', (select pais_id from pais where acronimo = 'FRA'), 1, 'Paris', (select zona_horaria_id from zona_horaria where nombre = 'GMT+2')); 
       
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Atenas', (select pais_id from pais where acronimo = 'GRC'), 1, 'Atenas', (select zona_horaria_id from zona_horaria where nombre = 'GMT+3')); 
   
    insert into aeropuerto values (sys_guid(), 'Aeropuerto de Dublin', (select pais_id from pais where acronimo = 'IRL'), 1, 'Dublin', (select zona_horaria_id from zona_horaria where nombre = 'GMT+1')); 
   
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Keflavík', (select pais_id from pais where acronimo = 'ISL'), 1, ' Keflavík', (select zona_horaria_id from zona_horaria where nombre = 'GMT')); 
   
    insert into aeropuerto values (sys_guid(), 'Aeropuerto de Oslo', (select pais_id from pais where acronimo = 'NOR'), 1, 'Oslo', (select zona_horaria_id from zona_horaria where nombre = 'GMT+2')); 
   
    insert into aeropuerto values (sys_guid(), 'Aeropuerto de Amsterdam', (select pais_id from pais where acronimo = 'HOL'), 1, 'Amsterdam', (select zona_horaria_id from zona_horaria where nombre = 'GMT+2')); 
   
    insert into aeropuerto values (sys_guid(), 'Aeropuerto de Lisboa', (select pais_id from pais where acronimo = 'POR'), 1, 'Lisboa', (select zona_horaria_id from zona_horaria where nombre = 'GMT+1')); 
    
    insert into aeropuerto values (sys_guid(), 'Aeropuerto de Heathrow', (select pais_id from pais where acronimo = 'ENG'), 1, 'London', (select zona_horaria_id from zona_horaria where nombre = 'GMT+1')); 
   
    insert into aeropuerto values (sys_guid(), 'Aeropuerto de Estocolmo Arlanda', (select pais_id from pais where acronimo = 'SWE'), 1, 'Estocolmo', (select zona_horaria_id from zona_horaria where nombre = 'GMT+2')); 
    --Aeropuerto centro america y caribe.
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional V. C. Bird', (select pais_id from pais where acronimo = 'ATG'), 1, 'St Johns', (select zona_horaria_id from zona_horaria where nombre = 'EDT')); -- Antigua
    insert into aeropuerto values (sys_guid(), 'Grand Bahama International Airport', (select pais_id from pais where acronimo = 'BHS'), 1, 'Freeport', (select zona_horaria_id from zona_horaria where nombre = 'EDT')); -- Bahamas
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Lynden Pindling', (select pais_id from pais where acronimo = 'BHS'), 1, 'Nassau', (select zona_horaria_id from zona_horaria where nombre = 'EDT')); -- Bahamas
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Grantley Adams', (select pais_id from pais where acronimo = 'BRB'), 1, 'Seawell', (select zona_horaria_id from zona_horaria where nombre = 'EDT')); -- Barbados
    insert into aeropuerto values (sys_guid(), 'Philip S.W. Goldson International Airport', (select pais_id from pais where acronimo = 'BLZ'), 1, 'Ciudad de Belice', (select zona_horaria_id from zona_horaria where nombre = 'GMT-6')); -- Belice
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional JuanSanta Maria', (select pais_id from pais where acronimo = 'CRC'), 1, 'San Jose', (select zona_horaria_id from zona_horaria where nombre = 'CST')); -- Costa Rica
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Daniel Oduber Quiros', (select pais_id from pais where acronimo = 'CRC'), 1, 'Guanacaste', (select zona_horaria_id from zona_horaria where nombre = 'UTC-6')); -- Costa Rica
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Jose Marti', (select pais_id from pais where acronimo = 'CUB'), 1, 'La Habana', (select zona_horaria_id from zona_horaria where nombre = 'EDT')); -- Cuba
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Douglas-Charles', (select pais_id from pais where acronimo = 'DMA'), 1, 'Marigot', (select zona_horaria_id from zona_horaria where nombre = 'GMT-6')); -- Dominica
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Oscar Arr', (select pais_id from pais where acronimo = 'SLV'), 1, 'San Salvador', (select zona_horaria_id from zona_horaria where nombre = 'EDT')); -- El Salvador
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Maurice Bishop', (select pais_id from pais where acronimo = 'GRE'), 1, 'St. George', (select zona_horaria_id from zona_horaria where nombre = 'GMT-6')); -- Grenada
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional La Aurora', (select pais_id from pais where acronimo = 'GTM'), 1, 'Ciudad de Guatemala', (select zona_horaria_id from zona_horaria where nombre = 'GMT-6')); -- Guatemala
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Toussaint Louverture', (select pais_id from pais where acronimo = 'HTI'), 1, 'Port-au-Prince', (select zona_horaria_id from zona_horaria where nombre = 'EDT')); -- Haitit
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Toncontin', (select pais_id from pais where acronimo = 'HND'), 1, 'Tegucigalpa', (select zona_horaria_id from zona_horaria where nombre = 'GMT-6')); -- Honduras
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Sangster', (select pais_id from pais where acronimo = 'JAM'), 1, 'Montego Bay', (select zona_horaria_id from zona_horaria where nombre = 'EST')); -- Jamaica
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Augusto Cesar Sandino', (select pais_id from pais where acronimo = 'NIC'), 1, 'Managua', (select zona_horaria_id from zona_horaria where nombre = 'GMT-6')); -- Nicaragua
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Tocumen', (select pais_id from pais where acronimo = 'PAN'), 1, 'Ciudad de Panama', (select zona_horaria_id from zona_horaria where nombre = 'EST')); -- Panama
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Luis Munoz Marin', (select pais_id from pais where acronimo = 'PRI'), 1, 'San Juan', (select zona_horaria_id from zona_horaria where nombre = 'AST')); -- Puerto Rico
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de las Americas', (select pais_id from pais where acronimo = 'DOM'), 1, 'Santo Domingo', (select zona_horaria_id from zona_horaria where nombre = 'AST')); -- Republica Dominicana
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Isla San Cristobal', (select pais_id from pais where acronimo = 'KNA'), 1, 'Galapagos', (select zona_horaria_id from zona_horaria where nombre = 'AST')); -- San Cristobal
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional E T Joshua', (select pais_id from pais where acronimo = 'VCT'), 1, 'Kingstown', (select zona_horaria_id from zona_horaria where nombre = 'CST')); -- San Vincente y Granadinas
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional A.N.R Robinson', (select pais_id from pais where acronimo = 'TAB'), 1, 'Scarborough', (select zona_horaria_id from zona_horaria where nombre = 'AST')); -- Trinidad y Tobago
    
    -- USA
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Los Angeles', (select pais_id from pais where acronimo = 'USA'), 1, 'Los Angeles, California', (select zona_horaria_id from zona_horaria where nombre = 'PDT')); -- USA
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional O''Hare', (select pais_id from pais where acronimo = 'USA'), 1, 'Chicago, Illinois', (select zona_horaria_id from zona_horaria where nombre = 'CDT')); -- USA
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Miami', (select pais_id from pais where acronimo = 'USA'), 1, 'Miami, Florida', (select zona_horaria_id from zona_horaria where nombre = 'EDT')); -- USA
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional John F. Kennedy', (select pais_id from pais where acronimo = 'USA'), 1, 'New York City, New York', (select zona_horaria_id from zona_horaria where nombre = 'EDT')); -- USA
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional George Bush', (select pais_id from pais where acronimo = 'USA'), 1, 'Houston, Texas', (select zona_horaria_id from zona_horaria where nombre = 'CDT')); -- USA
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Hartsfield–Jackson', (select pais_id from pais where acronimo = 'USA'), 1, 'Atlanta, Georgia', (select zona_horaria_id from zona_horaria where nombre = 'EDT')); -- USA
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Dallas/Fort Worth', (select pais_id from pais where acronimo = 'USA'), 1, 'Dallas, Texas', (select zona_horaria_id from zona_horaria where nombre = 'CDT')); -- USA
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Salt Lake City ', (select pais_id from pais where acronimo = 'USA'), 1, 'Salt Lake City, Utah', (select zona_horaria_id from zona_horaria where nombre = 'MDT')); -- USA
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional San Francisco', (select pais_id from pais where acronimo = 'USA'), 1, 'San Francisco, California', (select zona_horaria_id from zona_horaria where nombre = 'PDT')); -- USA
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Ronald Reagan', (select pais_id from pais where acronimo = 'USA'), 1, 'Arlington, Washington', (select zona_horaria_id from zona_horaria where nombre = 'EDT')); -- USA
              
    -- Canada
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Toronto Pearson', (select pais_id from pais where acronimo = 'CAN'), 1, 'Mississauga, Ontario', (select zona_horaria_id from zona_horaria where nombre = 'EDT')); -- Canadá
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Vancouver', (select pais_id from pais where acronimo = 'CAN'), 1, 'Richmond, Columbia Británica', (select zona_horaria_id from zona_horaria where nombre = 'PDT')); -- Canadá
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Pierre Elliott Trudeau', (select pais_id from pais where acronimo = 'CAN'), 1, 'Dorval, Quebec', (select zona_horaria_id from zona_horaria where nombre = 'EDT')); -- Canadá
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Calgary', (select pais_id from pais where acronimo = 'CAN'), 1, 'Calgary, Alberta', (select zona_horaria_id from zona_horaria where nombre = 'MDT')); -- Canadá
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Edmonton', (select pais_id from pais where acronimo = 'CAN'), 1, 'Edmonton, Alberta', (select zona_horaria_id from zona_horaria where nombre = 'MDT')); -- Canadá
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Ottawa Macdonald-Cartier', (select pais_id from pais where acronimo = 'CAN'), 1, 'Ottawa', (select zona_horaria_id from zona_horaria where nombre = 'EDT')); -- Canadá
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Winnipeg James Armstrong Richardson', (select pais_id from pais where acronimo = 'CAN'), 1, 'Winnipeg, Manitoba',  (select zona_horaria_id from zona_horaria where nombre = 'CDT')); -- Canadá
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Halifax Stanfield', (select pais_id from pais where acronimo = 'CAN'), 1, 'Enfield, Nueva Escocia', (select zona_horaria_id from zona_horaria where nombre = 'GMT-3')); -- Canadá

    -- México    
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Benito Juárez', (select pais_id from pais where acronimo = 'MEX'), 1, 'Ciudad de México', (select zona_horaria_id from zona_horaria where nombre = 'GMT-5')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Cancún', (select pais_id from pais where acronimo = 'MEX'), 1, 'Cancún', (select zona_horaria_id from zona_horaria where nombre = 'GMT-5')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Guadalajara “Don Miguel Hidalgo y Costilla”', (select pais_id from pais where acronimo = 'MEX'), 1, 'Guadalajara', (select zona_horaria_id from zona_horaria where nombre = 'GMT-5')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Monterrey “Mariano Escobedo”', (select pais_id from pais where acronimo = 'MEX'), 1, 'Monterrey', (select zona_horaria_id from zona_horaria where nombre = 'GMT-5')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Tijuana “General Abelardo L. Rodríguez”', (select pais_id from pais where acronimo = 'MEX'), 1, 'Tijuana', (select zona_horaria_id from zona_horaria where nombre = 'GMT-7')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Licenciado Adolfo López Mateos', (select pais_id from pais where acronimo = 'MEX'), 1, 'Toluca', (select zona_horaria_id from zona_horaria where nombre = 'GMT-5')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Licenciado Gustavo Díaz Ordaz', (select pais_id from pais where acronimo = 'MEX'), 1, 'Puerto Vallarta', (select zona_horaria_id from zona_horaria where nombre = 'GMT-5')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Los Cabos', (select pais_id from pais where acronimo = 'MEX'), 1, 'Baja California Sur', (select zona_horaria_id from zona_horaria where nombre = 'GMT-7')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional General Ignacio Pesqueira García', (select pais_id from pais where acronimo = 'MEX'), 1, 'Hermosillo, Sonora', (select zona_horaria_id from zona_horaria where nombre = 'GMT-5')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Federal de Culiacán', (select pais_id from pais where acronimo = 'MEX'), 1, 'Culiacán, Sinaloa', (select zona_horaria_id from zona_horaria where nombre = 'GMT-7')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Hermanos Serdán', (select pais_id from pais where acronimo = 'MEX'), 1, 'Puebla', (select zona_horaria_id from zona_horaria where nombre = 'GMT-5')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Guanajuato', (select pais_id from pais where acronimo = 'MEX'), 1, 'Silao, Guanajuato', (select zona_horaria_id from zona_horaria where nombre = 'GMT-5')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Carlos Rovirosa Pérez', (select pais_id from pais where acronimo = 'MEX'), 1, 'Villahermosa, Tabasco', (select zona_horaria_id from zona_horaria where nombre = 'GMT-5')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Mérida Manuel Crescencio Rejón (MID)', (select pais_id from pais where acronimo = 'MEX'), 1, 'Mérida, Yucatán', (select zona_horaria_id from zona_horaria where nombre = 'GMT-5')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional General Heriberto Jara', (select pais_id from pais where acronimo = 'MEX'), 1, 'Veracruz', (select zona_horaria_id from zona_horaria where nombre = 'GMT-5')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Lic. Jesús Terán Peredo', (select pais_id from pais where acronimo = 'MEX'), 1, 'Aguascalientes', (select zona_horaria_id from zona_horaria where nombre = 'GMT-5')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional General Francisco Mujica', (select pais_id from pais where acronimo = 'MEX'), 1, 'Morelia, Michoacán', (select zona_horaria_id from zona_horaria where nombre = 'GMT-5')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Acapulco', (select pais_id from pais where acronimo = 'MEX'), 1, 'Acapulco', (select zona_horaria_id from zona_horaria where nombre = 'GMT-5')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Chihuahua', (select pais_id from pais where acronimo = 'MEX'), 1, 'Chihuahua', (select zona_horaria_id from zona_horaria where nombre = 'GMT-6')); -- México
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Guaymas', (select pais_id from pais where acronimo = 'MEX'), 1, 'Guaymas, Sonora', (select zona_horaria_id from zona_horaria where nombre = 'GMT-7')); -- México
    
    -- Venezuela
    
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Maiquetía Simón Bolívar', (select pais_id from pais where acronimo = 'VEN'), 1, 'Caracas', (select zona_horaria_id from zona_horaria where nombre = 'GMT-4')); -- Venezuela
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de La Chinita', (select pais_id from pais where acronimo = 'VEN'), 1, 'Maracaibo', (select zona_horaria_id from zona_horaria where nombre = 'GMT-4')); -- Venezuela
  
    -- Brasil
    insert into aeropuerto values (sys_guid(), 'Aeropuerto de Sao Paulo', (select pais_id from pais where acronimo = 'BRA'), 1, 'Sao Paulo', (select zona_horaria_id from zona_horaria where nombre = 'GMT-3')); 
    
    -- Argentina
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Ezeiza', (select pais_id from pais where acronimo = 'ARG'), 1, 'Buenos Aires', (select zona_horaria_id from zona_horaria where nombre = 'GMT-3')); -- Argentina

    
    --Chile
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Santiago', (select pais_id from pais where acronimo = 'CHL'), 1, 'Santiago', (select zona_horaria_id from zona_horaria where nombre = 'GMT-4')); -- Chile
    
    -- Peru
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Jorge Chavez', (select pais_id from pais where acronimo = 'PER'), 1, 'Callao, Lima', (select zona_horaria_id from zona_horaria where nombre = 'GMT-5')); -- Peru
    
    --Bolivia
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Viru Viru', (select pais_id from pais where acronimo = 'BOL'), 1, 'Santa Cruz de la Sierra', (select zona_horaria_id from zona_horaria where nombre = 'GMT-4')); -- Bolivia
    
    -- Ecuador
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional Mariscal Sucre', (select pais_id from pais where acronimo = 'BOL'), 1, 'Quito', (select zona_horaria_id from zona_horaria where nombre = 'GMT-5')); -- Ecuador
    
    -- Colombia
    insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional El Dorado', (select pais_id from pais where acronimo = 'COL'), 1, 'Bogotá', (select zona_horaria_id from zona_horaria where nombre = 'GMT-5')); -- Colombia
    
END