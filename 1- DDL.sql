
    drop table conexiones;
    drop table equipaje;
    drop table factura;
    drop table empleado;
    drop table local;
    drop table departamento;
    drop table tiquete;
    drop table tipo_equipaje;
    drop table vuelo;
    drop table itinerario;
    drop table inventario;
    drop table avion;
    drop table modelo;
    drop table aerolinea;
    drop table aeropuerto;
    drop table zona_horaria;
    drop table piloto;
    drop table pasajero;
    drop table pais;
    drop table temp_names;
    drop table temp_lastnames;
    drop table TEMP_NAMES_NORTHAMERICA;
    drop table TEMP_LASTNAMES_NORTHAMERICA;
    drop table asiento;

    CREATE TABLE ASIENTO
   (	ID NUMBER GENERATED ALWAYS AS IDENTITY (START with 1 INCREMENT by 1), 
	ASIENTO VARCHAR2(50)
   );
   
   create table temp_names
    (
       id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
       NAME VARCHAR2(50)
    );
    
    
    CREATE TABLE TEMP_LASTNAMES
    (
       ID  NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
       LASTNAME VARCHAR2(50)
    );
    
     CREATE TABLE TEMP_NAMES_NORTHAMERICA
    (
       ID  NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
       NAME VARCHAR2(50)
    );
    
    
    CREATE TABLE TEMP_LASTNAMES_NORTHAMERICA
    (
       ID  NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
       LASTNAME VARCHAR2(50)
    );
    
    create table aerolinea
    (
        aerolinea_id varchar2(40) NOT NULL,
        nombre varchar2(100),
        constraint aerolinea_pk PRIMARY KEY (aerolinea_id)
    );
    
   create table modelo
    (
        modelo_id varchar2(40) NOT NULL,
        nombre varchar2(20),
        constraint modelo_pk PRIMARY KEY (modelo_id)
    );

 create table avion
    (
        avion_id varchar2(40),
        cantidad_pasajeros integer,
        aerolinea_id varchar2(40),
        modelo_id varchar2(40),
        constraint avion_id primary key (avion_id),
        constraint avion_aerolinea_fk foreign key (aerolinea_id) references aerolinea(aerolinea_id),
      constraint avion_modelo_fk foreign key (modelo_id) references modelo(modelo_id)
    );
    
    create table inventario
    (
        inventario_id varchar(40),
        activo varchar2(100),
        cantidad integer,
        modelo_id varchar2(40),
        constraint inventario_pk primary key (inventario_id),
        constraint inventario_modelo_fk foreign key (modelo_id) references modelo(modelo_id)
    );
    
    create table pais
    (
        pais_id varchar2(40) not null,
        nombre varchar2(100),
        acronimo varchar2(4),
        constraint pais_pk primary key (pais_id)
    );
    
    create table zona_horaria
    (
        zona_horaria_id varchar2(40),
        nombre varchar2(10),
        utc_horas number(2),
        constraint zona_horaria_pk primary key (zona_horaria_id)
    );
    
    create table aeropuerto
    (
        aeropuerto_id varchar2(40) not null,
        nombre varchar2(100) not null,
        pais_id varchar2(40) not null,
        numero_pistas int,
        ciudad varchar2(100) not null,
        zona_horaria_id varchar2(40),
        constraint aeropuerto_pk primary key (aeropuerto_id),
        constraint aeropuerto_pais_fk foreign key (pais_id) references pais(pais_id),
        constraint aeropuerto_zona_horaria_fk foreign key (zona_horaria_id) references zona_horaria(zona_horaria_id)
    );
    
     create table local
    (
        local_id varchar2(40) not null,
        nombre varchar2(40),
        tipo varchar2(40),
        localizacion varchar2(40),
        correo varchar2(20),
        telefono number(15),
        aeropuerto_id varchar2(40),
        constraint local_pk primary key (local_id),
    constraint aeropuerto_id foreign key (aeropuerto_id) references aeropuerto(aeropuerto_id)
    );

    create table departamento
    (
        departamento_id varchar2(40) not null,
        nombre varchar2(40),
        descripcion varchar2(100),
        constraint departamento_pk primary key (departamento_id)
    );

   create table empleado
    (
        empleado_id varchar2(40) not null,
        pasaporte numeric(11) not null,
        nombre varchar2(100) not null,
        apellido varchar2(100) not null,
        segundo_apellido varchar2(100) not null,
        horario varchar2(40),
        correo_electronico varchar2(100),
        telefono number(15),
        departamento_id varchar2(40),  
        aerolinea_id varchar2(40),
        local_id varchar2(40),
        constraint empleado_pk primary key (empleado_id),
        constraint departamento_id foreign key (departamento_id) references departamento(departamento_id),
        constraint empleado_aerolinea_fk foreign key (aerolinea_id) references aerolinea(aerolinea_id),
        constraint empleado_local_fk foreign key (local_id) references local(local_id)
    );
    
    
    create table piloto
    (
        piloto_id varchar2(40) not null,
        pais_id varchar2(40) not null,
        pasaporte numeric(11) not null,
        nombre varchar2(100) not null,
        apellido varchar2(100) not null,
        segundo_apellido varchar2(100) not null,
        fecha_nacimiento date,
        correo_electronico varchar2(100),
        telefono number(15),
        constraint piloto_pk primary key (piloto_id),
        constraint piloto_pais_fk foreign key (pais_id) references pais(pais_id)
    );
    
    create table vuelo
    (
        vuelo_id varchar2(40) not null,
        aeropuerto_salida_id varchar2(40) not null,
        aeropuerto_destino_id varchar2(40) not null,
        fecha_salida date,
        fecha_llegada date,
        duracion_minutos numeric,
        piloto_id varchar2(40),
        piloto2_id varchar2(40),
        piloto3_id varchar2(40),
        aerolinea_id varchar2(40),
        avion_id varchar2(40),
        constraint vuelo_pk primary key (vuelo_id),
        constraint vuelo_aeropuerto_salida_fk foreign key (aeropuerto_salida_id) references aeropuerto(aeropuerto_id),
        constraint vuelo_aeropuerto_destino_fk foreign key (aeropuerto_destino_id) references aeropuerto(aeropuerto_id),
        constraint vuelo_piloto_fk foreign key (piloto_id) references piloto(piloto_id),
        constraint vuelo_piloto2_fk foreign key (piloto2_id) references piloto(piloto_id),
        constraint vuelo_piloto3_fk foreign key (piloto3_id) references piloto(piloto_id),
        constraint vuelo_aerolinea_fk foreign key (aerolinea_id) references aerolinea(aerolinea_id),
        constraint vuelo_avion_fk foreign key (avion_id) references avion(avion_id)
    );
    
    
    
    create table pasajero
    (
        pasajero_id varchar2(40) not null,
        pais_id varchar2(40) not null,
        pasaporte numeric(11) not null,
        nombre varchar2(100) not null,
        apellido varchar2(100) not null,
        segundo_apellido varchar2(100) not null,
        fecha_nacimiento date,
        correo_electronico varchar2(100),
        telefono number(15),
        constraint pasajero_pk primary key (pasajero_id),
        constraint pais_id foreign key (pais_id) references pais(pais_id)
    );
    
    create table tiquete
    (
        tiquete_id varchar2(40) not null,
        clase_alta char(1) not null,
        numero_asiento number(4),
        pasajero_id varchar2(40),
        vuelo_id varchar2(40),
        constraint tiquete_pk primary key (tiquete_id),
        constraint tiquete_pasajero_fk foreign key (pasajero_id) references pasajero(pasajero_id),
        constraint tiquete_vuelo_fk foreign key (vuelo_id) references vuelo(vuelo_id)
    );
    
    
    
    create table tipo_equipaje
    (
        tipo_equipaje_id varchar2(40),
        kilos int,
        constraint tipo_equipaje_pk primary key (tipo_equipaje_id)
    );
    
    create table equipaje
    (
        equipaje_id varchar2(40),
        tipo_equipaje_id varchar2(40),
        tiquete_id varchar2(40),
        constraint equipaje_pk primary key (equipaje_id),
        constraint equipaje_tiquete_fk foreign key (tiquete_id) references tiquete(tiquete_id),
        constraint equipaje_tipo_equipaje_fk foreign key (tipo_equipaje_id) references tipo_equipaje(tipo_equipaje_id)  
    );
    
   CREATE TABLE itinerario (
    itinerario_id VARCHAR2(40),
    CONSTRAINT itinerario_pk PRIMARY KEY ( itinerario_id )
);

CREATE TABLE conexiones (
    conexiones_id   VARCHAR2(40),
    itinerario_id   VARCHAR2(40),
    vuelo_id        VARCHAR2(40),
    CONSTRAINT conexiones_pk PRIMARY KEY ( conexiones_id ),
    CONSTRAINT conexiones_itinerario_fk FOREIGN KEY ( itinerario_id )
        REFERENCES itinerario ( itinerario_id ),
    CONSTRAINT conexiones_vuelo_fk FOREIGN KEY ( vuelo_id )
        REFERENCES vuelo ( vuelo_id )
);
    
    create table factura
    (
        factura_id varchar2(40),
        fecha date,
        precio numeric(10),
        tiquete_id varchar2(40),
        constraint factura_pk primary key(factura_id),
        constraint factura_tiquete_fk foreign key(tiquete_id) references tiquete(tiquete_id)
    );