CREATE OR REPLACE PROCEDURE GERAR_TRANSACOES(
    p_qtd IN NUMBER DEFAULT 10  -- Número de transações a serem geradas
) AS 
BEGIN
    FOR i IN 1..p_qtd LOOP
        INSERT INTO LANCAMENTOS (
            CODIGO, NSU_TRANSACAO, HISTORICO, VALOR, MDR, CONCILIACAO_ESTAGIO_ID, 
            FATURA_ID, GERADOR, STATUS, BANDEIRA_ID, MOD_TRANSACAO_ID, 
            NUMERO_PARCELA, TOTAL_PARCELA, NUMERO_CARTAO, DATA_INICIAL_PERIODO, 
            DATA_FINAL_PERIODO, DATA_VENCIMENTO, DATA_AUTORIZACAO, 
            DATA_CONFIRMACAO, DATA_LANCAMENTO, ULTIMA_ATUALIZACAO, 
            CODIGO_TERMINAL, CODIGO_AUTORIZACAO, COD_RETORNO, CLIENTE_ID, 
            CONVENIADA_ID, USUARIO_ID, VALOR_ANTECIPADO, SEQ_OPERACAO_ANTECIPACAO
        ) VALUES (
            i, 
            DBMS_RANDOM.VALUE(100000, 999999), -- NSU_TRANSACAO aleatório
            DBMS_RANDOM.VALUE(100, 200), -- HISTORICO aleatório
            ROUND(DBMS_RANDOM.VALUE(10, 500), 2), -- VALOR aleatório entre 10 e 500
            ROUND(DBMS_RANDOM.VALUE(1.5, 5.0), 3), -- MDR aleatório entre 1.5% e 5%
            ROUND(DBMS_RANDOM.VALUE(1, 5)), -- CONCILIACAO_ESTAGIO_ID aleatório
            ROUND(DBMS_RANDOM.VALUE(1000, 2000)), -- FATURA_ID aleatório
            'TX', -- GERADOR fixo
            CASE WHEN MOD(i, 2) = 0 THEN 'A' ELSE 'P' END, -- STATUS alternando
            ROUND(DBMS_RANDOM.VALUE(1, 5)), -- BANDEIRA_ID aleatório
            ROUND(DBMS_RANDOM.VALUE(1, 3)), -- MOD_TRANSACAO_ID aleatório
            ROUND(DBMS_RANDOM.VALUE(1, 12)), -- NUMERO_PARCELA aleatório
            ROUND(DBMS_RANDOM.VALUE(1, 12)), -- TOTAL_PARCELA aleatório
            DBMS_RANDOM.STRING('X', 16), -- Número de cartão aleatório
            TRUNC(SYSDATE - DBMS_RANDOM.VALUE(1, 30)), -- DATA_INICIAL_PERIODO (últimos 30 dias)
            TRUNC(SYSDATE + DBMS_RANDOM.VALUE(1, 30)), -- DATA_FINAL_PERIODO (próximos 30 dias)
            SYSDATE + DBMS_RANDOM.VALUE(1, 15), -- DATA_VENCIMENTO (entre 1 e 15 dias à frente)
            SYSDATE - DBMS_RANDOM.VALUE(1, 5), -- DATA_AUTORIZACAO (últimos 5 dias)
            SYSDATE - DBMS_RANDOM.VALUE(1, 4), -- DATA_CONFIRMACAO (últimos 4 dias)
            SYSDATE, -- DATA_LANCAMENTO (agora)
            SYSDATE, -- ULTIMA_ATUALIZACAO (agora)
            'T' || ROUND(DBMS_RANDOM.VALUE(100000, 999999)), -- CODIGO_TERMINAL aleatório
            ROUND(DBMS_RANDOM.VALUE(100000, 999999)), -- CODIGO_AUTORIZACAO aleatório
            '00', -- COD_RETORNO fixo
            ROUND(DBMS_RANDOM.VALUE(5000, 9000)), -- CLIENTE_ID aleatório
            ROUND(DBMS_RANDOM.VALUE(7000, 11000)), -- CONVENIADA_ID aleatório
            ROUND(DBMS_RANDOM.VALUE(9000, 13000)), -- USUARIO_ID aleatório
            ROUND(DBMS_RANDOM.VALUE(10, 100), 2), -- VALOR_ANTECIPADO aleatório
            ROUND(DBMS_RANDOM.VALUE(1000, 5000)) -- SEQ_OPERACAO_ANTECIPACAO aleatório
        );
    END LOOP;
    
    COMMIT; -- Confirma os dados inseridos
END GERAR_TRANSACOES;
/



BEGIN 
    GERAR_TRANSACOES(20); -- Gera 20 transações simuladas
END;
/
