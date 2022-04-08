create or replace NONEDITIONABLE package p_destinos as
---------Cursor global---------------------------
CURSOR cursor_des RETURN destinos%ROWTYPE;
----------Agregar un destino----------------------
procedure insert_destino (
    v_id destinos.id_destinos%TYPE,
    v_nombre destinos.nombre%TYPE,
    v_ciudad destinos.ciudad%TYPE,
    v_pais destinos.pais%TYPE,
    v_costo destinos.costo%TYPE,
    v_calificacion destinos.calificacion%TYPE);
    
---------eliminar un destino-------------------------
procedure eliminar_destino (v_id destinos.id_destinos%TYPE);

---------cambiar nombre------------------------------
procedure mod_nombre (v_id destinos.id_destinos%TYPE, v_nombre destinos.nombre%TYPE);
---------cambiar ciudad------------------------------
procedure mod_ciudad (v_id destinos.id_destinos%TYPE, v_ciudad destinos.ciudad%TYPE);
---------cambiar pais--------------------------------
procedure mod_pais (v_id destinos.id_destinos%TYPE, v_pais destinos.pais%TYPE);
---------cambiar costo-------------------------------
procedure mod_costo (v_id destinos.id_destinos%TYPE, v_costo destinos.costo%TYPE);
---------cambiar calificacion------------------------
procedure mod_cal (v_id destinos.id_destinos%TYPE, v_cal destinos.calificacion%TYPE);

---------Buscar destinos acordes a un presupuesto--------------
procedure busc_pres (v_pres destinos.costo%TYPE);

---------Visualizar datos de un destino por id------------------
procedure vis_d(v_id destinos.id_destinos%TYPE);

---------Visualizar datos de un destino por nombre------------------
procedure vis_d(v_nombre destinos.nombre%TYPE);

-------- aplicar descuento por pais-------------------------------
procedure descuento_pais(v_pais destinos.pais%TYPE, v_descu Number);

END p_destinos;