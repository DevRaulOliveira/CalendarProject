-- PROCEDURE FERIADOS COM DATA VARIÁVEL

DECLARE
    v_ano NUMBER := EXTRACT(YEAR FROM SYSDATE);
    v_a NUMBER;
    v_b NUMBER;
    v_c NUMBER;
    v_d NUMBER;
    v_e NUMBER;
    v_f NUMBER;
    v_g NUMBER;
    v_h NUMBER;
    v_i NUMBER;
    v_k NUMBER;
    v_l NUMBER;
    v_m NUMBER;
    v_mes NUMBER;
    v_dia NUMBER;
    v_pascoa DATE;
    v_carnaval DATE;
    v_quarta_feira_de_cinzas DATE;
    v_paixao_de_cristo DATE;
    v_corpo_de_cristo DATE;
BEGIN
    v_a := v_ano MOD 19;
    v_b := FLOOR(v_ano / 100);
    v_c := v_ano MOD 100;
    v_d := FLOOR(v_b / 4);
    v_e := v_b MOD 4;
    v_f := FLOOR((v_b + 8) / 25);
    v_g := FLOOR((v_b - v_f + 1) / 3);
    v_h := (19 * v_a + v_b - v_d - v_g + 15) MOD 30;
    v_i := FLOOR(v_c / 4);
    v_k := v_c MOD 4;
    v_l := (32 + 2 * v_e + 2 * v_i - v_h - v_k) MOD 7;
    v_m := FLOOR((v_a + 11 * v_h + 22 * v_l) / 451);
    v_mes := FLOOR((v_h + v_l - 7 * v_m + 114) / 31);
    v_dia := ((v_h + v_l - 7 * v_m + 114) MOD 31) + 1;
    v_pascoa := TO_DATE(v_dia || '/' || v_mes || '/' || v_ano, 'DD/MM/YYYY');
    v_carnaval := v_pascoa - 47;
    v_quarta_feira_de_cinzas := v_pascoa -46;
    v_paixao_de_cristo := v_pascoa - 2;
    v_corpo_de_cristo := v_pascoa + 60;
    
    UPDATE TBL_FERIADO
    SET DATA = v_pascoa
    WHERE FERIADO = 'PASCOA';
    
    UPDATE TBL_FERIADO
    SET DATA = v_carnaval
    WHERE FERIADO = 'CARNAVAL';
    
    UPDATE TBL_FERIADO
    SET DATA = v_quarta_feira_de_cinzas
    WHERE FERIADO = 'QUARTA FEIRA DE CINZAS';
        
    UPDATE TBL_FERIADO
    SET DATA = v_paixao_de_cristo
    WHERE FERIADO = 'PAIXAO DE CRISTO';
    
    UPDATE TBL_FERIADO
    SET DATA = v_corpo_de_cristo
    WHERE FERIADO = 'CORPO DE CRISTO';
    



END;
/
