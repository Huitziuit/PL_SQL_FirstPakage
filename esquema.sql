CREATE TABLE destinos (
    id_destinos INT PRIMARY KEY,
    nombre VARCHAR(50),
    ciudad VARCHAR(50),
    pais VARCHAR(50),
    costo NUMBER(7,2),
    calificacion NUMBER(2,1)
);


BEGIN
    INSERT INTO destinos VALUES (1, 'Torre Eiffel','Paris','Francia',50000,8.9);
    INSERT INTO destinos VALUES (2, 'Piramide de Giza', 'Giza','Egipto',25000,9.5);
    INSERT INTO destinos VALUES (3, 'Acropolis','Atenas','Grecia',49000,9.6);
    INSERT INTO destinos VALUES (4, 'Coliseo','Roma','Italia',45000,8.2);
    INSERT INTO destinos VALUES (5, 'Taj Mahal','Agra','India',32000,7.9);
    INSERT INTO destinos VALUES (6, 'Fuerte rojo','Agra','India',30000,7.2);
    INSERT INTO destinos VALUES (7, 'Lago azul','Grindavik','Islandia',36000,8.1);
END;

select * from destinos;