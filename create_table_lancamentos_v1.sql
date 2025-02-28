CREATE TABLE LANCAMENTOS (
    CODIGO                        NUMBER(10)      NOT NULL, -- Identificador único do lançamento
    NSU_TRANSACAO                 NUMBER(10)      NOT NULL, -- Número Sequencial Único da transação
    HISTORICO                     NUMBER(5)       NOT NULL, -- Código do histórico do lançamento
    VALOR                         NUMBER(16,2)    NOT NULL, -- Valor total da transação
    MDR                           NUMBER(17,3)    NOT NULL, -- Taxa MDR aplicada
    CONCILIACAO_ESTAGIO_ID        NUMBER          NOT NULL, -- Estágio da conciliação
    FATURA_ID                     NUMBER(10)      NOT NULL, -- Identificador da fatura
    GERADOR                       VARCHAR2(2)     NOT NULL, -- Identifica quem gerou o lançamento
    STATUS                        VARCHAR2(1)     NOT NULL, -- Status do lançamento
    BANDEIRA_ID                   NUMBER          NOT NULL, -- Identificador da bandeira do cartão
    MOD_TRANSACAO_ID              NUMBER          NOT NULL, -- Modalidade da transação
    NUMERO_PARCELA                NUMBER(2)       NOT NULL, -- Número da parcela atual
    TOTAL_PARCELA                 NUMBER(2)       NOT NULL, -- Total de parcelas
    NUMERO_CARTAO                 VARCHAR2(20)    NOT NULL, -- Número do cartão (mascarado)
    DATA_INICIAL_PERIODO          DATE           NOT NULL, -- Início do período da transação
    DATA_FINAL_PERIODO            DATE           NOT NULL, -- Fim do período da transação
    DATA_VENCIMENTO               DATE           NOT NULL, -- Data de vencimento da fatura
    DATA_AUTORIZACAO              DATE           NOT NULL, -- Data da autorização da transação
    DATA_CONFIRMACAO              DATE           NOT NULL, -- Data da confirmação da transação
    DATA_LANCAMENTO               DATE           NOT NULL, -- Data do lançamento no sistema
    ULTIMA_ATUALIZACAO            DATE           NOT NULL, -- Data da última atualização do registro
    CODIGO_TERMINAL               VARCHAR2(12)    NOT NULL, -- Código do terminal de pagamento
    CODIGO_AUTORIZACAO            NUMBER(6)       NOT NULL, -- Código de autorização da operadora
    COD_RETORNO                   VARCHAR2(3)     NOT NULL, -- Código de retorno da operadora
    CLIENTE_ID                    NUMBER(10)      NOT NULL, -- Identificador do cliente
    CONVENIADA_ID                 NUMBER(10)      NOT NULL, -- Identificador da conveniada
    USUARIO_ID                    NUMBER(10)      NOT NULL, -- Identificador do usuário que registrou o lançamento
    VALOR_ANTECIPADO              NUMBER(16,2)    NOT NULL, -- Valor antecipado da transação
    SEQ_OPERACAO_ANTECIPACAO      NUMBER(10)      NOT NULL, -- Sequência da operação de antecipação
    CONSTRAINT PK_LANCAMENTOS PRIMARY KEY (CODIGO) -- Definição da chave primária
);

-- Comentários para as colunas
COMMENT ON COLUMN LANCAMENTOS.CODIGO IS 'Identificador único do lançamento';
COMMENT ON COLUMN LANCAMENTOS.NSU_TRANSACAO IS 'Número Sequencial Único da transação';
COMMENT ON COLUMN LANCAMENTOS.HISTORICO IS 'Código do histórico do lançamento';
COMMENT ON COLUMN LANCAMENTOS.VALOR IS 'Valor total da transação';
COMMENT ON COLUMN LANCAMENTOS.MDR IS 'Taxa MDR aplicada';
COMMENT ON COLUMN LANCAMENTOS.CONCILIACAO_ESTAGIO_ID IS 'Estágio da conciliação';
COMMENT ON COLUMN LANCAMENTOS.FATURA_ID IS 'Identificador da fatura';
COMMENT ON COLUMN LANCAMENTOS.GERADOR IS 'Identifica quem gerou o lançamento';
COMMENT ON COLUMN LANCAMENTOS.STATUS IS 'Status do lançamento';
COMMENT ON COLUMN LANCAMENTOS.BANDEIRA_ID IS 'Identificador da bandeira do cartão';
COMMENT ON COLUMN LANCAMENTOS.MOD_TRANSACAO_ID IS 'Modalidade da transação';
COMMENT ON COLUMN LANCAMENTOS.NUMERO_PARCELA IS 'Número da parcela atual';
COMMENT ON COLUMN LANCAMENTOS.TOTAL_PARCELA IS 'Total de parcelas';
COMMENT ON COLUMN LANCAMENTOS.NUMERO_CARTAO IS 'Número do cartão (mascarado)';
COMMENT ON COLUMN LANCAMENTOS.DATA_INICIAL_PERIODO IS 'Início do período da transação';
COMMENT ON COLUMN LANCAMENTOS.DATA_FINAL_PERIODO IS 'Fim do período da transação';
COMMENT ON COLUMN LANCAMENTOS.DATA_VENCIMENTO IS 'Data de vencimento da fatura';
COMMENT ON COLUMN LANCAMENTOS.DATA_AUTORIZACAO IS 'Data da autorização da transação';
COMMENT ON COLUMN LANCAMENTOS.DATA_CONFIRMACAO IS 'Data da confirmação da transação';
COMMENT ON COLUMN LANCAMENTOS.DATA_LANCAMENTO IS 'Data do lançamento no sistema';
COMMENT ON COLUMN LANCAMENTOS.ULTIMA_ATUALIZACAO IS 'Data da última atualização do registro';
COMMENT ON COLUMN LANCAMENTOS.CODIGO_TERMINAL IS 'Código do terminal de pagamento';
COMMENT ON COLUMN LANCAMENTOS.CODIGO_AUTORIZACAO IS 'Código de autorização da operadora';
COMMENT ON COLUMN LANCAMENTOS.COD_RETORNO IS 'Código de retorno da operadora';
COMMENT ON COLUMN LANCAMENTOS.CLIENTE_ID IS 'Identificador do cliente';
COMMENT ON COLUMN LANCAMENTOS.CONVENIADA_ID IS 'Identificador da conveniada';
COMMENT ON COLUMN LANCAMENTOS.USUARIO_ID IS 'Identificador do usuário que registrou o lançamento';
COMMENT ON COLUMN LANCAMENTOS.VALOR_ANTECIPADO IS 'Valor antecipado da transação';
COMMENT ON COLUMN LANCAMENTOS.SEQ_OPERACAO_ANTECIPACAO IS 'Sequência da operação de antecipação';
