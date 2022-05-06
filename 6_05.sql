-- 1

DELIMITER //
CREATE PROCEDURE precioMayorAlPromedio()
BEGIN
	select * from products where buyPrice > avg(buyPrice); 
END //


-- 2

DELIMITER //
CREATE PROCEDURE borrarOrden(IN orderNumberRecibido int)
BEGIN
	 delete from orderdetail where orderNumberRecibido = ordernumber;
END //

-- 3

DELIMITER //
CREATE PROCEDURE borrarProductLine(in productLineEntrante varchar(50))
BEGIN
    if (productLineEntrante = (select productCode from products)) then
		select "La linea de productos no pudo ser borrada ya que contien productos asociados";
	else
		delete from productLines where productline = productLineEntrante;
        select "La line de producto fue borrada";
	end if;
END //

-- 4

DELIMITER //
CREATE PROCEDURE mostrarOrdenes()
BEGIN
	select * from orders group by status;
END //

-- 5

DELIMITER //
CREATE PROCEDURE mostrarOrdenes2(in dateOrderDesde date, in dateOrderHasta date)
BEGIN
	select * from orders where orderDate between dateOrderDesde and dateOrderHasta group by status;
END //

-- 6

DELIMITER //
CREATE PROCEDURE cantidadDeGenteSubordinada(in employeeNumber int)
BEGIN
	select count(reportsTo) from employees where reportsTo = employeeNumber;
END //

-- 7

DELIMITER //
CREATE PROCEDURE listarOrdenYPrecio()
BEGIN
	select orderNumber, sum(priceEach) from orderDetails; 
END //

-- 8

DELIMITER //
CREATE PROCEDURE listarOrdenYPrecio(in costumerNumberEntrante int)
BEGIN
	select costumerNumber, costumerName, costumerLastName, orderNumber, sum(priceEach) from costumers, orderDetails where orderNumber = (select orderNumber from orders where costumerNumber = costumerNumberEntrante); 
END //

-- 9

DELIMITER //
CREATE PROCEDURE cambiarComentario(in orderNumberEntrante int, in comentario text)
BEGIN
	declare comprobante text;
    set comprobante = (select comments from orders where orderNumber = orderNumberEntrante);
	update orders set comments = comentario where orderNumber = orderNumberEntrante;
    
    if (comprobante = (select comments from orders where orderNumber = orderNumberEntrante)) then
		return 1;
	else 
		return 0;
    end if;
END //