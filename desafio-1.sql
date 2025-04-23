SET SERVEROUTPUT ON;

DECLARE
    v_idade NUMBER;
    v_tipo_contrato VARCHAR2(5);
    
BEGIN
    v_idade := -20;
    v_tipo_contrato := 'E';    
   
    IF v_idade <= 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'IDADE INVÁLIDA');
    END IF;    
    
    IF v_tipo_contrato IS NULL THEN     
        RAISE_APPLICATION_ERROR(-20001, 'Tipo de contrato nao informado');    
    END IF;      
   
    IF v_idade < 18 THEN
        DBMS_OUTPUT.PUT_LINE('Plano Jovem');
    ELSIF
    v_idade >= 18 AND v_idade < 60 THEN 
        IF v_tipo_contrato = 'E' THEN
            DBMS_OUTPUT.PUT_LINE('Plano Executivo');
        ELSIF v_tipo_contrato = 'I' THEN
            DBMS_OUTPUT.PUT_LINE('Plano Padrão');
        ELSE
            RAISE_APPLICATION_ERROR(-20002, 'TIPO DE CONTRATO INVÁLIDO');
        END IF;    
    ELSE
        DBMS_OUTPUT.PUT_LINE('Plano Senior');
    END IF;        
    
END;

