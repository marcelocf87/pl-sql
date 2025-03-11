SELECT * FROM v$version;

/*
DBMS_OUTPUT é um pacote integrado fornecido pela Oracle para exibir informaçõs, debugar e capturar saídas dentro de um programa
Necessário habilitar com o comando SET SERVEROUTPUT ON;
*/

SET SERVEROUTPUT ON

--testando o pacote DBMS
DECLARE
    mensagem VARCHAR(5) := 'PL-SQL';
BEGIN
    dbms_output.put_line(mensagem);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Erro encontrado: ' || sqlerrm);
END;
/

--variáveis e tipos de Dados
DECLARE
    v_numero NUMBER := 100;
    v_nome VARCHAR(50) := 'PL-SQL';
    v_data DATE := SYSDATE;
    v_valido BOOLEAN := TRUE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Número: ' || v_numero);
    DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome);
    DBMS_OUTPUT.PUT_LINE('Data: ' || TO_CHAR(V_DATA, 'DD/MM/YYYY'));    
END;
/


--estruturas de controle de fluxo
--condicionais if/else
declare
    v_idade NUMBER := 20;
begin
    if v_idade >= 18 then
        dbms_output.put_line('Maior de idade');
    else
        dbms_output.put_line('É menor de idade');
    end if;    
end;
/


--case
DECLARE
    v_status CHAR(1) := 'A';
BEGIN
    CASE V_STATUS
        WHEN 'A' THEN DBMS_OUTPUT.PUT_LINE('Ativo');
        WHEN 'I' THEN DBMS_OUTPUT.PUT_LINE('Inativo');
        ELSE DBMS_OUTPUT.PUT_LINE('Desconhecido');
    END CASE;
END;    
/

--laços de repetição (loop, while, for)
declare
    v_contador NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('Contador: ' || v_contador);
        v_contador := v_contador + 1;
        EXIT WHEN v_contador > 5;
    end loop;    
END;
/


DECLARE
    v_numero NUMBER := 1;
BEGIN
    WHILE v_numero <= 5 LOOP
        dbms_output.put_line('Número: ' || v_numero);
        v_numero := v_numero + 1;
    END LOOP;
END;
/


BEGIN
    FOR i IN 1..5 LOOP
        dbms_output.put_line('Iteração ' || i);
    END LOOP;
END;
/


--manipulação de cursores (são usados para manipular dados linhas por linha)
--exemplo de cursor explícito
DECLARE
   CURSOR c_lancamentos IS--declaração do cursor
       SELECT historico, valor FROM lancamentos;
   v_historico lancamentos.historico%TYPE;--%type garante que a variável tenha o mesmo tipo de dado das colunas na tabela
   v_valor lancamentos.valor%TYPE;
BEGIN
   OPEN c_lancamentos;--abre o cursor
   LOOP--para percorrer os registros
       FETCH c_lancamentos INTO v_historico, v_valor;--extrai a linha do cursor e armazena nas variáveis
       EXIT WHEN c_lancamentos%NOTFOUND;--encerra o loop se não forem encontrados mais registros
       DBMS_OUTPUT.PUT_LINE('Histórico do lançamento ' || v_historico || ' = R$ ' || v_valor);--imprime os dados concatenando os valores com a string
   END LOOP;--finaliza o loop
   CLOSE c_lancamentos;--fecha o cursos liberando os dados extraídos
END;
/
   
--Modularização com Procedures e Functions
--Tratamento de Erros


