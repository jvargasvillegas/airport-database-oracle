--Triggers

--Inventario
--Tabla 

create table auditoria_Inventario(
  fecha date, 
  usuario varchar2(20),
  tipo_transaccion varchar2(10),
  nombre varchar2(50),
  old_cant number(38),
  new_cant number(38),
  id_modelo varchar2(40)
);

--Trigger

create or replace trigger trigger_Inventario after insert or update or delete on inventario for each row enable
declare
 v_fecha    auditoria_Inventario.fecha%TYPE:= sysdate; 
 v_usuario  auditoria_Inventario.usuario%TYPE; 
 v_tipo_transaccion    auditoria_Inventario.tipo_transaccion%TYPE; 
begin
	select user into v_usuario FROM dual;
	if inserting then
		v_tipo_transaccion := 'INSERT';
        insert into auditoria_Inventario (fecha, usuario, tipo_transaccion, nombre, new_cant, id_modelo) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:new.activo,:new.cantidad,:new.modelo_id);
    	elsif updating then 
		v_tipo_transaccion := 'UPDATE';
        insert into auditoria_Inventario values (v_fecha,v_usuario, v_tipo_transaccion,:old.activo,:old.cantidad,
        :new.cantidad,:old.modelo_id);
	elsif deleting then 
		v_tipo_transaccion := 'DELETE';
        insert into auditoria_Inventario (fecha, usuario, tipo_transaccion, nombre, old_cant, id_modelo) values 
        (v_fecha,v_usuario, v_tipo_transaccion,:old.activo, :old.cantidad, :old.modelo_id);
	end if;
end;
/

--Consultas

select * from auditoria_inventario;

select * from inventario;

update inventario set cantidad = 430 where inventario_id= '34B0BC0C1EBD4932B1DEC15C810E8CF9';

insert into inventario values (sys_guid(), 'Bolsas', 3000, get_randomModelo());

delete inventario where inventario_id = '42CAA21F4D7E49349E52F245E1A4FDEC';


-- Aerolinea 

--Tabla

create table auditoria_Aerolinea(
  fecha date, 
  usuario varchar2(20),
  tipo_transaccion varchar2(10),
  old_nom varchar2(50),
  new_nom varchar2(50)
);

--Trigger

create or replace trigger trigger_Aerolinea after insert or update or delete on aerolinea for each row enable
declare
 v_fecha    auditoria_Aerolinea.fecha%TYPE:= sysdate; 
 v_usuario  auditoria_Aerolinea.usuario%TYPE; 
 v_tipo_transaccion    auditoria_Aerolinea.tipo_transaccion%TYPE; 
begin
	select user into v_usuario FROM dual;
	if inserting then
		v_tipo_transaccion := 'INSERT';
        insert into auditoria_Aerolinea (fecha, usuario, tipo_transaccion, new_nom) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:new.nombre);
    	elsif updating then 
		v_tipo_transaccion := 'UPDATE';
        insert into auditoria_Aerolinea values (v_fecha,v_usuario, v_tipo_transaccion,:old.nombre,
        :new.nombre);
	elsif deleting then 
		v_tipo_transaccion := 'DELETE';
        insert into auditoria_Aerolinea (fecha, usuario, tipo_transaccion, old_nom) values
        (v_fecha, v_usuario, v_tipo_transaccion,:old.nombre);
	end if;
end;
/

--Consultas

select * from aerolinea

select * from auditoria_aerolinea;

insert into aerolinea values (sys_guid(),'Laudamotio');

update aerolinea set nombre = 'Laudamotion' where aerolinea_id = '1404B2E3AC844BECB996C44DAA2B7447';

delete aerolinea where aerolinea_id = '1404B2E3AC844BECB996C44DAA2B7447';

-- Aeropuerto

-- Tabla

create table auditoria_Aeropuerto(
  fecha date, 
  usuario varchar2(20),
  tipo_transaccion varchar2(10),
  nombre varchar2(50),
  old_pistas number(38),
  new_pistas number(38)
);

--Trigger

create or replace trigger trigger_Aeropuerto after insert or update or delete on aeropuerto for each row enable
declare
 v_fecha    auditoria_Aeropuerto.fecha%TYPE:= sysdate; 
 v_usuario  auditoria_Aeropuerto.usuario%TYPE; 
 v_tipo_transaccion    auditoria_Aeropuerto.tipo_transaccion%TYPE; 
begin
	select user into v_usuario FROM dual;
	if inserting then
		v_tipo_transaccion := 'INSERT';
        insert into auditoria_Aeropuerto (fecha, usuario, tipo_transaccion, nombre, new_pistas) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:new.nombre,:new.numero_pistas);
    	elsif updating then 
		v_tipo_transaccion := 'UPDATE';
        insert into auditoria_Aeropuerto values (v_fecha,v_usuario, v_tipo_transaccion,:old.nombre,:old.numero_pistas,
        :new.numero_pistas);
	elsif deleting then 
		v_tipo_transaccion := 'DELETE';
        insert into auditoria_Aeropuerto (fecha, usuario, tipo_transaccion, nombre, old_pistas) values 
        (v_fecha,v_usuario, v_tipo_transaccion,:old.nombre, :old.numero_pistas);
	end if;
end;
/

--Consultas

select * from aeropuerto;

select * from auditoria_aeropuerto;

insert into aeropuerto values (sys_guid(), 'Aeropuerto Internacional de Düsseldorf ', '7C0728608E8F4E3B951BDBB5775D41E4',
2,'Lohausen', '43866DBE7F9B45988E72D4DBD053E510');

update aeropuerto set numero_pistas = 1 where aeropuerto_id = 'D5A3C38B477F43A682F30716302A814B';

delete aeropuerto where aeropuerto_id = 'D5A3C38B477F43A682F30716302A814B';

-- Local

--Tabla

create table auditoria_Local(
  fecha date, 
  usuario varchar2(20),
  tipo_transaccion varchar2(10),
  nombre varchar2(50),
  old_tel number(38),
  new_tel number(38),
  old_loca varchar2(40),
  new_loca varchar2(40)
);

-- Trigger

create or replace trigger trigger_Local after insert or update or delete on local for each row enable
declare
 v_fecha    auditoria_Local.fecha%TYPE:= sysdate; 
 v_usuario  auditoria_Local.usuario%TYPE; 
 v_tipo_transaccion  auditoria_Local.tipo_transaccion%TYPE; 
begin
	select user into v_usuario FROM dual;
	if inserting then
		v_tipo_transaccion := 'INSERT';
        insert into auditoria_Local (fecha, usuario, tipo_transaccion, nombre, new_tel, new_loca) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:new.nombre,:new.telefono,:new.localizacion);
    	elsif updating then 
		v_tipo_transaccion := 'UPDATE';
        if (:new.telefono = :old.telefono) then
        insert into auditoria_Local (fecha, usuario, tipo_transaccion, nombre, old_tel, old_loca, new_loca) values 
        (v_fecha,v_usuario, v_tipo_transaccion,:old.nombre,:old.telefono, :old.localizacion, :new.localizacion);
        elsif (:new.localizacion = :old.localizacion) then
        insert into auditoria_Local (fecha, usuario, tipo_transaccion, nombre, old_tel, new_tel, old_loca) values 
        (v_fecha,v_usuario, v_tipo_transaccion,:old.nombre,:old.telefono, :new.telefono, :old.localizacion);
        else 
        insert into auditoria_Local values (v_fecha,v_usuario, v_tipo_transaccion,:old.nombre,:old.telefono,
        :new.telefono, :old.localizacion, :new.localizacion);
        end if;
	elsif deleting then 
		v_tipo_transaccion := 'DELETE';
        insert into auditoria_Local (fecha, usuario, tipo_transaccion, nombre, old_tel, old_loca) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:old.nombre,:old.telefono,:old.localizacion);
	end if;
end;
/

-- Consultas

select * from local;

select * from auditoria_local;

insert into local values (sys_guid(), 'Carls Jr', 'Comida', 'Lado Este del Aeropuerto', 'carlsjr@gmail.com', 12458731, get_randomAirport());

update local set telefono = 87629002 where local_id = '376EE5054912438C9EF1A4699BE55FD5';

delete local where local_id ='376EE5054912438C9EF1A4699BE55FD5';

--Pais

--Tabla

create table auditoria_Pais(
  fecha date, 
  usuario varchar2(20),
  tipo_transaccion varchar2(10),
  nombre varchar2(50),
  old_acro varchar2(4),
  new_acro varchar2(4)
);

-- Trigger

create or replace trigger trigger_Pais after insert or update or delete on pais for each row enable
declare
 v_fecha    auditoria_Pais.fecha%TYPE:= sysdate; 
 v_usuario  auditoria_Pais.usuario%TYPE; 
 v_tipo_transaccion    auditoria_Pais.tipo_transaccion%TYPE; 
begin
	select user into v_usuario FROM dual;
	if inserting then
		v_tipo_transaccion := 'INSERT';
        insert into auditoria_Pais (fecha, usuario, tipo_transaccion, nombre, new_acro) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:new.nombre,:new.acronimo);
    	elsif updating then 
		v_tipo_transaccion := 'UPDATE';
        insert into auditoria_Pais values (v_fecha,v_usuario, v_tipo_transaccion,:old.nombre,:old.acronimo,
        :new.acronimo);
	elsif deleting then 
		v_tipo_transaccion := 'DELETE';
        insert into auditoria_Pais (fecha, usuario, tipo_transaccion, nombre, old_acro) values 
        (v_fecha,v_usuario, v_tipo_transaccion,:old.nombre, :old.acronimo);
	end if;
end;
/

--Consultas

select * from pais;

select * from auditoria_pais;

Insert into pais values ('8C30971261DE4271ABE17EFF75BD1DC3','Afganistán','AFF');

update pais set acronimo = 'AF' where pais_id = '8C30971261DE4271ABE17EFF75BD1DC3';

delete pais where pais_id = '8C30971261DE4271ABE17EFF75BD1DC3';

--Modelo

-- Tabla

create table auditoria_Modelo(
  fecha date, 
  usuario varchar2(20),
  tipo_transaccion varchar2(10),
  old_nom varchar2(50),
  new_nom varchar2(50)
);

-- Trigger

create or replace trigger trigger_Modelo after insert or update or delete on modelo for each row enable
declare
 v_fecha    auditoria_Modelo.fecha%TYPE:= sysdate; 
 v_usuario  auditoria_Modelo.usuario%TYPE; 
 v_tipo_transaccion    auditoria_Modelo.tipo_transaccion%TYPE; 
begin
	select user into v_usuario FROM dual;
	if inserting then
		v_tipo_transaccion := 'INSERT';
        insert into auditoria_Modelo (fecha, usuario, tipo_transaccion, new_nom) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:new.nombre);
    	elsif updating then 
		v_tipo_transaccion := 'UPDATE';
        insert into auditoria_Modelo values (v_fecha,v_usuario, v_tipo_transaccion,:old.nombre,:new.nombre);
	elsif deleting then 
		v_tipo_transaccion := 'DELETE';
        insert into auditoria_Modelo (fecha, usuario, tipo_transaccion, old_nom) values 
        (v_fecha,v_usuario, v_tipo_transaccion,:old.nombre);
	end if;
end;
/

--Consultas

select * from modelo;

select * from auditoria_modelo;

insert into modelo values (sys_guid(),'Túpolev Tu-203');

update modelo set nombre = 'Túpolev Tu-204' where modelo_id = 'E9A8DC235C274B03B103A6C609FFF3F4';

delete modelo where modelo_id = 'E9A8DC235C274B03B103A6C609FFF3F4';

-- Zona Horaria

--Tabla

create table auditoria_ZonaH(
  fecha date, 
  usuario varchar2(20),
  tipo_transaccion varchar2(10),
  nombre varchar2(10),
  old_horas number(2),
  new_horas number(2)
);

-- Trigger

create or replace trigger trigger_ZonaH after insert or update or delete on zona_horaria for each row enable
declare
 v_fecha    auditoria_ZonaH.fecha%TYPE:= sysdate; 
 v_usuario  auditoria_ZonaH.usuario%TYPE; 
 v_tipo_transaccion    auditoria_ZonaH.tipo_transaccion%TYPE; 
begin
	select user into v_usuario FROM dual;
	if inserting then
		v_tipo_transaccion := 'INSERT';
        insert into auditoria_ZonaH (fecha, usuario, tipo_transaccion, nombre, new_horas) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:new.nombre,:new.utc_horas);
    	elsif updating then 
		v_tipo_transaccion := 'UPDATE';
        insert into auditoria_ZonaH values (v_fecha,v_usuario, v_tipo_transaccion,:old.nombre,
        :old.utc_horas,:new.utc_horas);
	elsif deleting then 
		v_tipo_transaccion := 'DELETE';
        insert into auditoria_ZonaH (fecha, usuario, tipo_transaccion, nombre, old_horas) values 
        (v_fecha,v_usuario, v_tipo_transaccion,:old.nombre,:old.utc_horas);
	end if;
end;
/

--Consultas

select * from zona_horaria;

select * from auditoria_zonah;

insert into zona_horaria values (sys_guid(), 'PST',-7);

update zona_horaria set utc_horas = -8 where zona_horaria_id = '941AACA9572D4CC9ACA87502CA6998FB';

delete zona_horaria where zona_horaria_id = '941AACA9572D4CC9ACA87502CA6998FB';

--Tipo de equipaje

--Tabla

create table auditoria_tipoEquipaje(
  fecha date, 
  usuario varchar2(20),
  tipo_transaccion varchar2(10),
  id_tipo varchar2(40),
  old_kil number(38),
  new_kil number(38)
);

--Trigger

create or replace trigger trigger_tipoEquipaje after insert or update or delete on tipo_equipaje for each row enable
declare
 v_fecha    auditoria_tipoEquipaje.fecha%TYPE:= sysdate; 
 v_usuario  auditoria_tipoEquipaje.usuario%TYPE; 
 v_tipo_transaccion    auditoria_tipoEquipaje.tipo_transaccion%TYPE; 
begin
	select user into v_usuario FROM dual;
	if inserting then
		v_tipo_transaccion := 'INSERT';
        insert into auditoria_tipoEquipaje (fecha, usuario, tipo_transaccion, id_tipo, new_kil) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:new.tipo_equipaje_id,:new.kilos);
    	elsif updating then 
		v_tipo_transaccion := 'UPDATE';
        insert into auditoria_tipoEquipaje values (v_fecha,v_usuario, v_tipo_transaccion,:old.tipo_equipaje_id,
        :old.kilos,:new.kilos);
	elsif deleting then 
		v_tipo_transaccion := 'DELETE';
        insert into auditoria_tipoEquipaje (fecha, usuario, tipo_transaccion, id_tipo, old_kil) values 
        (v_fecha,v_usuario, v_tipo_transaccion,:old.tipo_equipaje_id,:old.kilos);
	end if;
end;
/

--Consultas

select * from tipo_equipaje;

select * from auditoria_tipoEquipaje;

insert into tipo_equipaje values (sys_guid(), 26);

update tipo_equipaje set kilos = 27 where tipo_equipaje_id ='7CEAFF22617E44F5B4B3735AC60D334B';

delete tipo_equipaje where tipo_equipaje_id = '7CEAFF22617E44F5B4B3735AC60D334B';

--Equipaje

--Tabla

create table auditoria_Equipaje(
  fecha date, 
  usuario varchar2(20),
  tipo_transaccion varchar2(10),
  id_equipaje varchar2(40),
  old_tipo varchar2(40),
  new_tipo varchar2(40),
  old_tiquete varchar2(40),
  new_tiquete varchar2(40)
);

--Trigger

create or replace trigger trigger_Equipaje after insert or update or delete on equipaje for each row enable
declare
 v_fecha    auditoria_Equipaje.fecha%TYPE:= sysdate; 
 v_usuario  auditoria_Equipaje.usuario%TYPE; 
 v_tipo_transaccion  auditoria_Equipaje.tipo_transaccion%TYPE; 
begin
	select user into v_usuario FROM dual;
	if inserting then
		v_tipo_transaccion := 'INSERT';
        insert into auditoria_Equipaje (fecha, usuario, tipo_transaccion, id_equipaje, new_tipo, new_tiquete) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:new.equipaje_id,:new.tipo_equipaje_id,:new.tiquete_id);
    	elsif updating then 
		v_tipo_transaccion := 'UPDATE';
        if (:new.tiquete_id = :old.tiquete_id) then
        insert into auditoria_Equipaje (fecha, usuario, tipo_transaccion, id_equipaje, old_tiquete, old_tipo, new_tipo) values 
        (v_fecha,v_usuario, v_tipo_transaccion,:old.equipaje_id,:old.tiquete_id, :old.tipo_equipaje_id, 
        :new.tipo_equipaje_id);
        elsif (:new.tipo_equipaje_id = :old.tipo_equipaje_id) then
        insert into auditoria_Equipaje (fecha, usuario, tipo_transaccion, id_equipaje, old_tipo, new_tiquete, old_tiquete) values 
        (v_fecha,v_usuario, v_tipo_transaccion,:old.equipaje_id,:old.tipo_equipaje_id, :new.tiquete_id, :old.tiquete_id);
        else 
        insert into auditoria_Equipaje values (v_fecha,v_usuario, v_tipo_transaccion,:old.equipaje_id,:old.tipo_equipaje_id,
        :new.tipo_equipaje_id, :old.tiquete_id, :new.tiquete_id);
        end if;
	elsif deleting then 
		v_tipo_transaccion := 'DELETE';
        insert into auditoria_Equipaje (fecha, usuario, tipo_transaccion, id_equipaje, old_tipo, old_tiquete) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:old.equipaje_id,:old.tipo_equipaje_id,:old.tiquete_id);
	end if;
end;
/

-- Consultas

select * from equipaje;

select * from auditoria_equipaje;

select * from tiquete;

insert into equipaje values (sys_guid(), get_randomTipo_Equipaje, get_randomTiquete);

update equipaje set tiquete_id =  'C6B18DF18E034428BA538D2633BE8E2D' where equipaje_id = '04DA1DF7046A4C47BDEFB23BE94F4D47';

delete equipaje where equipaje_id = '04DA1DF7046A4C47BDEFB23BE94F4D47';

--Empleado

--Tabla

create table auditoria_Empleado(
  fecha date, 
  usuario varchar2(20),
  tipo_transaccion varchar2(10),
  id_empleado varchar2(40),
  old_tel varchar2(40),
  new_tel varchar2(40),
  old_depa varchar2(40),
  new_depa varchar2(40)
);

--Trigger

create or replace trigger trigger_Empleado after insert or update or delete on empleado for each row enable
declare
 v_fecha    auditoria_Empleado.fecha%TYPE:= sysdate; 
 v_usuario  auditoria_Empleado.usuario%TYPE; 
 v_tipo_transaccion  auditoria_Empleado.tipo_transaccion%TYPE; 
begin
	select user into v_usuario FROM dual;
	if inserting then
		v_tipo_transaccion := 'INSERT';
        insert into auditoria_Empleado (fecha, usuario, tipo_transaccion, id_empleado, new_tel, new_depa) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:new.empleado_id,:new.telefono,:new.departamento_id);
    	elsif updating then 
		v_tipo_transaccion := 'UPDATE';
        if (:new.telefono = :old.telefono) then
        insert into auditoria_Empleado (fecha, usuario, tipo_transaccion, id_empleado, old_tel, 
        old_depa, new_depa) values (v_fecha,v_usuario, v_tipo_transaccion,:old.empleado_id,:old.telefono, 
        :old.departamento_id, :new.departamento_id);
        elsif (:new.departamento_id = :old.departamento_id) then
        insert into auditoria_Empleado (fecha, usuario, tipo_transaccion, id_empleado, old_depa, new_tel, old_tel) 
        values (v_fecha,v_usuario, v_tipo_transaccion,:old.empleado_id,:old.departamento_id, :new.telefono, 
        :old.telefono);
        else 
        insert into auditoria_Empleado values (v_fecha,v_usuario, v_tipo_transaccion,:old.empleado_id,:old.telefono,
        :new.telefono, :old.departamento_id, :new.departamento_id);
        end if;
	elsif deleting then 
		v_tipo_transaccion := 'DELETE';
        insert into auditoria_Empleado (fecha, usuario, tipo_transaccion, id_empleado, old_tel, old_depa) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:old.empleado_id,:old.telefono,:old.departamento_id);
	end if;
end;
/

--Consultas

select * from empleado;

select * from departamento; 

select * from auditoria_empleado;

insert into empleado values (sys_guid(),9000227951,'SOFIA','CORDERO','CASTRO','De lunes a viernes, de 8am a 9pm',
'SOFIA.CORDERO@gmail.com',887612435,'E9BCC0A6AF524009A174D8C767B68870',null,null);

update empleado set telefono = 76541234 where empleado_id = '441DFEED826C4A2786C091D041CBCA85';

delete empleado where empleado_id = '441DFEED826C4A2786C091D041CBCA85';

--Pasajero 

--Tabla


create table auditoria_Pasajero(
  fecha date, 
  usuario varchar2(20),
  tipo_transaccion varchar2(10),
  id_pasajero varchar2(40),
  old_tel varchar2(40),
  new_tel varchar2(40),
  old_correo varchar2(40),
  new_correo varchar2(40)
);

--Trigger

create or replace trigger trigger_Pasajero after insert or update or delete on pasajero for each row enable
declare
 v_fecha    auditoria_Pasajero.fecha%TYPE:= sysdate; 
 v_usuario  auditoria_Pasajero.usuario%TYPE; 
 v_tipo_transaccion  auditoria_Pasajero.tipo_transaccion%TYPE; 
begin
	select user into v_usuario FROM dual;
	if inserting then
		v_tipo_transaccion := 'INSERT';
        insert into auditoria_Pasajero (fecha, usuario, tipo_transaccion, id_pasajero, new_tel, new_correo) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:new.pasajero_id,:new.telefono,:new.correo_electronico);
    	elsif updating then 
		v_tipo_transaccion := 'UPDATE';
        if (:new.telefono = :old.telefono) then
        insert into auditoria_Pasajero (fecha, usuario, tipo_transaccion, id_pasajero, old_tel, 
        old_correo, new_correo) values (v_fecha,v_usuario, v_tipo_transaccion,:old.pasajero_id,:old.telefono, 
        :old.correo_electronico, :new.correo_electronico);
        elsif (:new.correo_electronico = :old.correo_electronico) then
        insert into auditoria_Pasajero (fecha, usuario, tipo_transaccion, id_pasajero, old_correo, new_tel, old_tel) 
        values (v_fecha,v_usuario, v_tipo_transaccion,:old.pasajero_id,:old.correo_electronico, :new.telefono, 
        :old.telefono);
        else 
        insert into auditoria_Pasajero values (v_fecha,v_usuario, v_tipo_transaccion,:old.pasajero_id,:old.telefono,
        :new.telefono, :old.correo_electronico, :new.correo_electronico);
        end if;
	elsif deleting then 
		v_tipo_transaccion := 'DELETE';
        insert into auditoria_Pasajero (fecha, usuario, tipo_transaccion, id_pasajero, old_tel, old_correo) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:old.pasajero_id,:old.telefono,:old.correo_electronico);
	end if;
end;
/

--Consultas

select * from pasajero where correo_electronico = 'PABLO.CORDERO@gmail.com';

select * from auditoria_pasajero;

insert into pasajero values (sys_guid(),'92BCC0F08022471DABAAB115F26CFB07',9000227221,'PABLO','CORDERO',
'CASTRO','09-AUG-90','PABLO.CORDERO@gmail.com',88786534);

update pasajero set correo_electronico = 'PABLO@gmail.com' where pasajero_id = '04A49D328D444A8B9C58C03DE260E901';

delete pasajero where pasajero_id = '04A49D328D444A8B9C58C03DE260E901';

--Piloto

--Tabla

create table auditoria_Piloto(
  fecha date, 
  usuario varchar2(20),
  tipo_transaccion varchar2(10),
  id_piloto varchar2(40),
  old_tel varchar2(40),
  new_tel varchar2(40),
  old_correo varchar2(40),
  new_correo varchar2(40)
);

--Trigger

create or replace trigger trigger_Piloto after insert or update or delete on piloto for each row enable
declare
 v_fecha    auditoria_Piloto.fecha%TYPE:= sysdate; 
 v_usuario  auditoria_Piloto.usuario%TYPE; 
 v_tipo_transaccion  auditoria_Piloto.tipo_transaccion%TYPE; 
begin
	select user into v_usuario FROM dual;
	if inserting then
		v_tipo_transaccion := 'INSERT';
        insert into auditoria_Piloto (fecha, usuario, tipo_transaccion, id_piloto, new_tel, new_correo) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:new.piloto_id,:new.telefono,:new.correo_electronico);
    	elsif updating then 
		v_tipo_transaccion := 'UPDATE';
        if (:new.telefono = :old.telefono) then
        insert into auditoria_Piloto (fecha, usuario, tipo_transaccion, id_piloto, old_tel, 
        old_correo, new_correo) values (v_fecha,v_usuario, v_tipo_transaccion,:old.piloto_id,:old.telefono, 
        :old.correo_electronico, :new.correo_electronico);
        elsif (:new.correo_electronico = :old.correo_electronico) then
        insert into auditoria_Piloto (fecha, usuario, tipo_transaccion, id_piloto, old_correo, new_tel, old_tel) 
        values (v_fecha,v_usuario, v_tipo_transaccion,:old.piloto_id,:old.correo_electronico, :new.telefono, 
        :old.telefono);
        else 
        insert into auditoria_Piloto values (v_fecha,v_usuario, v_tipo_transaccion,:old.piloto_id,:old.telefono,
        :new.telefono, :old.correo_electronico, :new.correo_electronico);
        end if;
	elsif deleting then 
		v_tipo_transaccion := 'DELETE';
        insert into auditoria_Piloto (fecha, usuario, tipo_transaccion, id_piloto, old_tel, old_correo) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:old.piloto_id,:old.telefono,:old.correo_electronico);
	end if;
end;
/

--Consultas

select * from piloto where correo_electronico = 'JAIRO.CORTES@gmail.com';

select * from auditoria_piloto;

insert into piloto values (sys_guid(),'92BCC0F08022471DABAAB115F26CFB07',9000227221,'JAIRO','CORTES',
'CASTRO','09-AUG-90','JAIRO.CORTES@gmail.com',88781114);

update piloto set correo_electronico = 'JAIRO@gmail.com' where piloto_id = '0BFB0AA6D3854184B1BAB210A0ADBD0E';

delete piloto where piloto_id = '0BFB0AA6D3854184B1BAB210A0ADBD0E';

-- Departamento

-- Tabla

create table auditoria_Departamento(
  fecha date, 
  usuario varchar2(20),
  tipo_transaccion varchar2(10),
  nombre varchar2(40),
  old_desc varchar2(40),
  new_desc varchar2(40)
);

-- Trigger


create or replace trigger trigger_Departamento after insert or update or delete on departamento for each row enable
declare
 v_fecha    auditoria_Departamento.fecha%TYPE:= sysdate; 
 v_usuario  auditoria_Departamento.usuario%TYPE; 
 v_tipo_transaccion    auditoria_Departamento.tipo_transaccion%TYPE; 
begin
	select user into v_usuario FROM dual;
	if inserting then
		v_tipo_transaccion := 'INSERT';
        insert into auditoria_Departamento (fecha, usuario, tipo_transaccion, nombre, new_desc) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:new.nombre,:new.descripcion);
    	elsif updating then 
		v_tipo_transaccion := 'UPDATE';
        insert into auditoria_Departamento values (v_fecha,v_usuario, v_tipo_transaccion,:old.nombre,
        :old.descripcion,:new.descripcion);
	elsif deleting then 
		v_tipo_transaccion := 'DELETE';
        insert into auditoria_Departamento (fecha, usuario, tipo_transaccion, nombre, old_desc) values 
        (v_fecha,v_usuario, v_tipo_transaccion,:old.nombre,:old.descripcion);
	end if;
end;
/

--Consultas

select * from departamento;

select * from auditoria_departamento;

insert into departamento values (sys_guid(),'Limpieza','Departamento encargado de la limpieza'); 

update departamento set descripcion = 'Departamento encargado de limpieza'
where departamento_id = 'A6117B349063464EAED4E1F6AF94D6C0';

delete departamento where departamento_id = 'A6117B349063464EAED4E1F6AF94D6C0';

-- Vuelo

--Tabla

create table auditoria_Vuelo(
  fecha date, 
  usuario varchar2(20),
  tipo_transaccion varchar2(10),
  id_vuelo varchar2(40),
  old_fecha_sal date,
  new_fecha_sal date,
  old_fecha_lleg date,
  new_fecha_lleg date
);

--Trigger

create or replace trigger trigger_Vuelo after insert or update or delete on vuelo for each row enable
declare
 v_fecha    auditoria_Vuelo.fecha%TYPE:= sysdate; 
 v_usuario  auditoria_Vuelo.usuario%TYPE; 
 v_tipo_transaccion  auditoria_Vuelo.tipo_transaccion%TYPE; 
begin
	select user into v_usuario FROM dual;
	if inserting then
		v_tipo_transaccion := 'INSERT';
        insert into auditoria_Vuelo (fecha, usuario, tipo_transaccion, id_vuelo, new_fecha_sal, new_fecha_lleg) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:new.vuelo_id,:new.fecha_salida,:new.fecha_llegada);
    	elsif updating then 
		v_tipo_transaccion := 'UPDATE';
        if (:new.fecha_salida = :old.fecha_salida) then
        insert into auditoria_Vuelo (fecha, usuario, tipo_transaccion, id_vuelo, old_fecha_sal, 
        old_fecha_lleg, new_fecha_lleg) values (v_fecha,v_usuario, v_tipo_transaccion,:old.vuelo_id,:old.fecha_salida, 
        :old.fecha_llegada, :new.fecha_llegada);
        elsif (:new.fecha_llegada = :old.fecha_llegada) then
        insert into auditoria_Vuelo (fecha, usuario, tipo_transaccion, id_vuelo, old_fecha_lleg, new_fecha_sal, old_fecha_sal) 
        values (v_fecha,v_usuario, v_tipo_transaccion,:old.vuelo_id,:old.fecha_llegada, :new.fecha_salida, 
        :old.fecha_salida);
        else 
        insert into auditoria_Vuelo values (v_fecha,v_usuario, v_tipo_transaccion,:old.vuelo_id,:old.fecha_salida,
        :new.fecha_salida, :old.fecha_llegada, :new.fecha_llegada);
        end if;
	elsif deleting then 
		v_tipo_transaccion := 'DELETE';
        insert into auditoria_Vuelo (fecha, usuario, tipo_transaccion, id_vuelo, old_fecha_sal, old_fecha_lleg) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:old.vuelo_id,:old.fecha_salida,:old.fecha_llegada);
	end if;
end;
/

--Consultas

select * from vuelo;

select * from auditoria_vuelo;

insert into vuelo values (sys_guid(), get_randomAirport ('MEX'),
get_randomAirport ('GTM'), '14-JUL-19','15-JUL-19',300, get_randomPilot(),
get_randomPilot(), get_randomPilot(), get_randomAirline(),
get_randomAirplane('2145DB350FEC405A81E067B770B63245'));

update vuelo set fecha_salida = '15-JUL-19' where vuelo_id = '56536DED94F942FBA0CF446A6522F57E';

delete vuelo where vuelo_id = '56536DED94F942FBA0CF446A6522F57E';

--Avion

--Tabla

create table auditoria_Avion(
  fecha date, 
  usuario varchar2(20),
  tipo_transaccion varchar2(10),
  id_avion varchar2(40),
  old_cant number(38),
  new_cant number(38)
);

--Trigger

create or replace trigger trigger_Avion after insert or update or delete on avion for each row enable
declare
 v_fecha    auditoria_Avion.fecha%TYPE:= sysdate; 
 v_usuario  auditoria_Avion.usuario%TYPE; 
 v_tipo_transaccion    auditoria_Avion.tipo_transaccion%TYPE; 
begin
	select user into v_usuario FROM dual;
	if inserting then
		v_tipo_transaccion := 'INSERT';
        insert into auditoria_Avion (fecha, usuario, tipo_transaccion, id_avion, new_cant) values 
        (v_fecha, v_usuario, v_tipo_transaccion,:new.avion_id,:new.cantidad_pasajeros);
    	elsif updating then 
		v_tipo_transaccion := 'UPDATE';
        insert into auditoria_Avion values (v_fecha,v_usuario, v_tipo_transaccion,:old.avion_id,
        :old.cantidad_pasajeros,:new.cantidad_pasajeros);
	elsif deleting then 
		v_tipo_transaccion := 'DELETE';
        insert into auditoria_Avion (fecha, usuario, tipo_transaccion, id_avion, old_cant) values 
        (v_fecha,v_usuario, v_tipo_transaccion,:old.avion_id,:old.cantidad_pasajeros);
	end if;
end;
/

--Consultas

select * from avion;

select * from auditoria_avion;

insert into avion values (sys_guid(), 140, get_randomAirline(),
get_randomModelo());

update avion set cantidad_pasajeros = 200 where avion_id = 'DF0FD866795642A8A7A38C6B350F25BD';

delete avion where avion_id = 'DF0FD866795642A8A7A38C6B350F25BD';