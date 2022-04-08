create or replace NONEDITIONABLE package body p_destinos as

    -----------Cursor global------------------------------
    CURSOR cursor_des return destinos%ROWTYPE is select * from destinos;
    -----------Agregar destino----------------------------
    procedure insert_destino(
    v_id destinos.id_destinos%TYPE,
    v_nombre destinos.nombre%TYPE,
    v_ciudad destinos.ciudad%TYPE,
    v_pais destinos.pais%TYPE,
    v_costo destinos.costo%TYPE,
    v_calificacion destinos.calificacion%TYPE) is
    
    BEGIN
        INSERT INTO destinos VALUES (v_id, v_nombre, v_ciudad, v_pais, v_costo, v_calificacion);
        DBMS_OUTPUT.PUT_LINE('Destino: <' || v_nombre || '> agregado a la tabla');
    END insert_destino;
    
    ------------Eliminar destino---------------------
    procedure eliminar_destino (v_id destinos.id_destinos%TYPE) is
    BEGIN
        DELETE FROM destinos WHERE id_destinos = v_id;
    END eliminar_destino;
    
    -----------cambiar nombre-----------------------
    procedure mod_nombre (v_id destinos.id_destinos%TYPE, v_nombre destinos.nombre%TYPE)
        IS
    BEGIN
        UPDATE destinos SET nombre = v_nombre WHERE id_destinos = v_id;
    END mod_nombre;
    
    -----------cambiar ciudad-----------------------
    procedure mod_ciudad (v_id destinos.id_destinos%TYPE, v_ciudad destinos.ciudad%TYPE)
        IS
    BEGIN
        UPDATE destinos SET ciudad = v_ciudad WHERE id_destinos = v_id;
    END mod_ciudad;
    
    -----------cambiar pais-----------------------
    procedure mod_pais (v_id destinos.id_destinos%TYPE, v_pais destinos.pais%TYPE)
        IS
    BEGIN
        UPDATE destinos SET pais = v_pais WHERE id_destinos = v_id;
    END mod_pais;
    
    -----------cambiar costo-----------------------
    procedure mod_costo (v_id destinos.id_destinos%TYPE, v_costo destinos.costo%TYPE)
        IS
    BEGIN
        UPDATE destinos SET costo = v_costo WHERE id_destinos = v_id;
    END mod_costo;
    
    -----------cambiar calificacion-----------------------
    procedure mod_cal (v_id destinos.id_destinos%TYPE, v_cal destinos.calificacion%TYPE)
        IS
    BEGIN
        UPDATE destinos SET calificacion = v_cal WHERE id_destinos = v_id;
    END mod_cal;
    
    -----------Ver determinado destino por id---------------------
    procedure vis_d(v_id destinos.id_destinos%TYPE) is
    BEGIN
        FOR r_destinos IN cursor_des LOOP
            IF r_destinos.id_destinos = v_id THEN
                DBMS_OUTPUT.PUT_LINE('Para el id = '|| v_id);
                DBMS_OUTPUT.PUT_LINE('Destino       -> '|| r_destinos.nombre);
                DBMS_OUTPUT.PUT_LINE('Ubicacion     -> '|| r_destinos.ciudad|| ', ' || r_destinos.pais);
                DBMS_OUTPUT.PUT_LINE('Costo         -> $'|| r_destinos.costo);
                DBMS_OUTPUT.PUT_LINE('Calificacion  -> '|| r_destinos.calificacion);
            end if;
        END LOOP;
    END vis_d;
        
    -----------Ver determinado destino por nombre---------------------
    procedure vis_d(v_nombre destinos.nombre%TYPE) is
    BEGIN
        FOR r_destinos IN cursor_des LOOP
            IF r_destinos.nombre = v_nombre THEN
                DBMS_OUTPUT.PUT_LINE('Para el destino: '|| v_nombre);
                DBMS_OUTPUT.PUT_LINE('id            -> '|| r_destinos.id_destinos);
                DBMS_OUTPUT.PUT_LINE('Ubicacion     -> '|| r_destinos.ciudad|| ', ' || r_destinos.pais);
                DBMS_OUTPUT.PUT_LINE('Costo         -> $'|| r_destinos.costo);
                DBMS_OUTPUT.PUT_LINE('Calificacion  -> '|| r_destinos.calificacion);
            end if;
        END LOOP;
    END vis_d;
    ----------- buscar destinos que no superen el presupuesto-----
    procedure busc_pres (v_pres destinos.costo%TYPE) is
    BEGIN
        FOR r_destinos IN cursor_des LOOP
            IF r_destinos.costo <= v_pres THEN
                DBMS_OUTPUT.PUT_LINE('Destino -> '|| r_destinos.nombre || ' por $' || r_destinos.costo);
            end if;
        END LOOP;
    END busc_pres;
    ------------Cambiar precio por pais---------------------------------

    procedure descuento_pais(v_pais destinos.pais%TYPE, v_descu number) is
    BEGIN
        UPDATE destinos SET costo = costo * (v_descu / 100) WHERE pais = v_pais;
    end descuento_pais;
    
END p_destinos;