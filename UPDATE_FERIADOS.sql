UPDATE TBL_FERIADO
SET DATA = CASE
              WHEN FERIADO = 'CONFRATERNIZACAO UNIVERSAL' THEN TO_DATE('01/01/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD/MM/YYYY')
              WHEN FERIADO = 'TIRADENTES' THEN TO_DATE('21/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD/MM/YYYY')
              WHEN FERIADO = 'DIA DO TRABALHO' THEN TO_DATE('01/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD/MM/YYYY')
              WHEN FERIADO = 'INDEPENDENCIA DO BRASIL' THEN TO_DATE('07/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD/MM/YYYY')
              WHEN FERIADO = 'DIA DE NOSSA SENHORA APARECIDA' THEN TO_DATE('12/10/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD/MM/YYYY')
              WHEN FERIADO = 'DIA DO SERVIDOR PUBLICO' THEN TO_DATE('28/10' || TO_CHAR(SYSDATE, 'YYYY'), 'DD/MM/YYYY')
              WHEN FERIADO = 'FINADOS' THEN TO_DATE('02/11/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD/MM/YYYY')
              WHEN FERIADO = 'PROCLAMACAO DA REPUBLICA' THEN TO_DATE('15/11/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD/MM/YYYY')
              WHEN FERIADO = 'CONSCIENCIA NEGRA' THEN TO_DATE('20/11/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD/MM/YYYY')
              WHEN FERIADO = 'NATAL' THEN TO_DATE('25/12' || TO_CHAR(SYSDATE, 'YYYY'). 'DD/MM/YYYY')
            ELSE DATA -- Mantém o valor original se a condição não for atendida
           END;
           
UPDATE TBL_FERIADO
SET DIA_SEMANA = TO_CHAR(DATA, 'DAY');
