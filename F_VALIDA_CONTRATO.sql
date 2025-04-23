-- ============================================================
-- NOME     : F_VALIDA_CONTRATO
-- OBJETIVO : Retorna o tipo de plano com base na idade e contrato
-- AUTOR    : Marcelo Freitas
-- DATA     : 23/04/2025
-- VERSAO   : 1.0
-- HISTÓRICO:
--   1.0 - Criação inicial da função
-- ============================================================

CREATE OR REPLACE FUNCTION F_VALIDA_CONTRATO (
  v_idade NUMBER,
  v_tipo_contrato VARCHAR2
) RETURN VARCHAR2 IS
  v_plano VARCHAR2(50);
BEGIN  
  IF v_idade < 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'IDADE INVALIDA!');
  END IF;  
  
  IF v_tipo_contrato IS NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'CONTRATO NAO INFORMADO');
  END IF;  
  
  IF v_idade < 18 THEN
    v_plano := 'PLANO PLUS';  
  ELSIF v_idade >= 18 AND v_idade < 65 THEN
    CASE v_tipo_contrato
      WHEN 'A' THEN v_plano := 'PLANO EXECUTIVO';         
      WHEN 'B' THEN v_plano := 'PLANO PREMIUM';  
      ELSE
        RAISE_APPLICATION_ERROR(-20001, 'CONTRATO INVALIDO');     
    END CASE;
  ELSE
    v_plano := 'PLANO OURO';        
  END IF;  
  
  RETURN v_plano;
END;
/
