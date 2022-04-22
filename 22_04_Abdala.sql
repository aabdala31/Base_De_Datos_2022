-- 1

select * from Mascotas group by(edad); 

-- 2

select * from Mascotas group by(peso);

-- 3

select count(id_mascotas) from mascotas group by edad; 

-- 4

select count(id_mascotas) from mascotas group by peso; 

-- 5

select sum(peso) from mascotas where edad = (select edad where edad > 5 && edad < 10);

-- 6

select avg(peso) from mascotas;

-- 7

DELIMITER $$ 

create procedure CantidadMascotas (in idAmo int) 
begin
	select count(id_mascotas) from mascotas where id_mascota in (select id_mascota where idAmo = id_dueño);
end $$

DELIMITER ;

-- 8

DELIMITER $$

create procedure PesaMasDe15 (in idMascotaPedida int) 
begin

	declare respuesta bool default false;
	if((select peso from mascotas where id_mascota = idMascotaPedida) > 15) then
    set respuesta = true;
    end if;
    select respuesta;
    
end $$

DELIMITER ;

-- 9

DELIMITER $$

create procedure infoVeterinario (in id int)
begin
	select * from veterinarios where id_vet = id;
end $$

DELIMITER ;

-- 10

DELIMITER $$

create procedure pesoIndicado (in pesoAPedir int)
begin
	select * from mascotas where peso = (select peso from mascotas where peso >= pesoAPedir); 
end $$

DELIMITER ;

call pesoIndicado (6);


