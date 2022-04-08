DELIMITER $$
CREATE PROCEDURE areaRectangulo(IN altura INT, in base INT)
BEGIN
	declare area int;
    set area = base * altura;
    select area;
END$$
DELIMITER ;

CALL areaRectangulo(5,8);

DELIMITER $$
Create procedure EsPositivo(IN valor int)
BEGIN
	declare confirmacion BOOLEAN default false;
	if(valor > 100) then
		set confirmacion = true;
	END IF;
    
    select confirmacion;
END $$
DELIMITER ;

CALL EsPositivo(101);

DELIMITER $$
CREATE PROCEDURE promedio (IN valor1 INT, IN valor2 INT, IN valor3 INT)
BEGIN
	declare promedio float;
    set promedio = (valor1 + valor2 + valor3)/3;
    select promedio;
END $$
DELIMITER ;

CALL promedio(1,10,5);
    