/*
1 - O que é PL/SQL?
É uma extensão procedural do SQL usada no Oracle, permitindo controle de fluxo e manipulação de variáveis.

2 - Estrutura de um Bloco PL/SQL
DECLARE: Declara variáveis antes da execução.
BEGIN: Contém o código executável.
EXCEPTION: Trata erros.
END: Finaliza o bloco.

3 - Variáveis e Tipos de Dados
NUMBER, VARCHAR2, DATE, BOOLEAN: Tipos básicos para armazenar valores.
%TYPE e %ROWTYPE: Relacionam variáveis com colunas ou registros de tabelas.

4 - Comandos Condicionais
IF...THEN...ELSE: Executa blocos de código baseado em condições.
CASE: Escolhe entre múltiplas condições de forma estruturada.

5 - Estruturas de Repetição
LOOP: Laço genérico com saída programada.
WHILE: Executa enquanto a condição for verdadeira.
FOR: Percorre um intervalo de valores automaticamente.

6 - Exceções e Tratamento de Erros
WHEN OTHERS THEN: Captura qualquer erro e evita falhas inesperadas.
SQLERRM: Retorna a mensagem do erro ocorrido.
*/

SELECT * FROM v$version;

/*
DBMS_OUTPUT é um pacote integrado fornecido pela Oracle para exibir informaçõs, debugar e capturar saídas dentro de um programa
Necessário habilitar com o comando SET SERVEROUTPUT ON;
*/

SET SERVEROUTPUT ON

SET VERIFY OFF;  -- Evita exibição do código alterado antes da execução

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

--Estruturas de controle - comandos condicionais IF/ELSE e CASE/WHEN e laços de repetição LOOP, WHILE e FOR para controle do fluxo.
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

--Tratamento de Exceções - captura erros com EXCEPTION, usa WHEN OTHERS THEN SQLERRM para mensagens e RAISE para exceções personalizadas.
DECLARE
    v_resultado NUMBER;
BEGIN
    v_resultado := 10/0;
EXCEPTION
    WHEN ZERO_DIVIDE THEN--ZERO_DIVIDE é uma exceção pré-definida no PL/SQL
        DBMS_OUTPUT.PUT_LINE('ERRO: Tentativa de dividir por zero');
END;
/
/*
Algumas exceções pré-definidas:
NO_DATA_FOUND	Nenhuma linha é retornada em uma consulta SELECT INTO
TOO_MANY_ROWS	SELECT INTO retorna mais de uma linha
ZERO_DIVIDE	Ocorre uma divisão por zero
VALUE_ERROR	Erro de conversão ou número fora do intervalo permitido
INVALID_NUMBER	Conversão de string para número falha
*/

DECLARE
    v_valor VARCHAR2(50);
BEGIN
    SELECT valor INTO v_valor FROM lancamentos WHERE codigo = 1;
    DBMS_OUTPUT.PUT_LINE('Valor encontrado');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Valor não encontrado');
END;
/
select * from lancamentos where codigo = 1;

--Usando WHEN OTHERS e SQLCODE / SQLERRM
--Para capturar qualquer erro e exibir sua mensagem:
DECLARE
    v_num NUMBER := 10;
BEGIN
    v_num := v_num / 0; -- Gera erro
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);
END;
/
--SQLCODE retorna o código do erro.
--SQLERRM retorna a mensagem associada.

--RAISE - lançar uma uma exceção personalizada
DECLARE
    erro_personalizado EXCEPTION;
    PRAGMA EXCEPTION_INIT(erro_personalizado, -20001);--Esse código de erro pode ser qualquer número entre -20000 e -20999, reservado para erros definidos pelo usuário.
BEGIN
    RAISE erro_personalizado;--O comando RAISE força a execução a interromper e lança a exceção erro_personalizado, ativando o bloco EXCEPTION
EXCEPTION
    WHEN erro_personalizado THEN
        DBMS_OUTPUT.PUT_LINE('Erro personalizado acionado');
END;        
/


BEGIN
    RAISE_APPLICATION_ERROR(-20001, 'Ocorreu um erro específico nesta operação!');
END;
/

DECLARE
    erro_personalizado EXCEPTION;
    PRAGMA EXCEPTION_INIT(erro_personalizado, -20001);
BEGIN
    RAISE_APPLICATION_ERROR(-20001, 'Este é um erro personalizado!');
EXCEPTION
    WHEN erro_personalizado THEN
        DBMS_OUTPUT.PUT_LINE('Erro capturado: Este é um erro personalizado!');
END;
/
--RAISE apenas lança a exceção
--RAISE_APPLICATION_ERROR permite adicionar uma mensagem personalizada, tornando os erros mais informativos
--Ambos lançam exceções, mas RAISE_APPLICATION_ERROR permite incluir mensagens explicativas, enquanto RAISE precisa de uma declaração separada.
--Se precisar personalizar o erro e gerar logs, RAISE_APPLICATION_ERROR é mais útil.
--Se quiser tratar exceções dentro do código sem gerar mensagens externas, RAISE pode ser suficiente.


--manipulação de cursores (são usados para manipular dados linhas por linha de forma sequencial)
--exemplo de cursor explícito
DECLARE
   CURSOR c_lancamentos IS--declaração do cursor
       SELECT historico, valor FROM lancamentos;
   v_historico lancamentos.historico%TYPE;--%type garante que a variável tenha o mesmo tipo de dado das colunas da tabela
   v_valor lancamentos.valor%TYPE;
BEGIN
   OPEN c_lancamentos;--abre o cursor
   LOOP--para percorrer os registros
       FETCH c_lancamentos INTO v_historico, v_valor;--fetch busca o próximo registro do cursor e coloca os valores nas variáveis associadas.
       EXIT WHEN c_lancamentos%NOTFOUND;--encerra o loop se não forem encontrados mais registros
       DBMS_OUTPUT.PUT_LINE('Histórico do lançamento ' || v_historico || ' = R$ ' || v_valor);--imprime os dados concatenando os valores com a string
   END LOOP;--finaliza o loop
   CLOSE c_lancamentos;--fecha o cursor liberando os dados extraídos
END;
/

--cursor implícito (é declarado sem a necessidade de um open e close explícitos)
DECLARE
    v_total NUMBER;
BEGIN
    --a oracle cria automaticamente um cursor implícito para essa consulta
    SELECT
        COUNT(*)
    INTO v_total
    FROM
        lancamentos
    WHERE
        bandeira_id = 3;
    dbms_output.put_line('Total de lançamentos: ' || v_total);
END;
/

   
--Usando FETCH Manualmente (Sem loop direto)
--Você pode abrir o cursor, buscar um único registro e fechar manualmente.
DECLARE
    CURSOR c_exemplo IS SELECT nome FROM clientes;
    v_nome clientes.nome%TYPE;
BEGIN
    OPEN c_exemplo;
    FETCH c_exemplo INTO v_nome;  -- Busca apenas um registro
    IF c_exemplo%FOUND THEN
        DBMS_OUTPUT.PUT_LINE(v_nome);
    END IF;
    CLOSE c_exemplo;
END;
/

--Usando FOR CURSOR (Mais Simples e Limpo)
--O Oracle gerencia o OPEN, FETCH e CLOSE automaticamente.
BEGIN
    FOR r IN (SELECT nome FROM clientes) LOOP
        DBMS_OUTPUT.PUT_LINE(r.nome);
    END LOOP;
END;
/

--Loops são muito usados, mas FETCH pode ser feito manualmente.
--O FOR CURSOR é mais limpo e evita OPEN e CLOSE manuais.
--Se precisar de apenas um registro, FETCH sem loop pode ser suficiente.


/*
Objetos que Podemos Programar no PL/SQL
1 - Blocos Anônimos
Código PL/SQL sem nome, executado diretamente no SQL Developer ou no banco, sem ser armazenado.

2 - Procedures (Procedimentos)
Blocos armazenados no banco que executam operações sem retornar valores diretamente.

3 - Functions (Funções)
Semelhantes a procedures, mas retornam um valor específico ao serem chamadas.

4 - Packages (Pacotes)
Conjunto de procedures, functions e variáveis agrupadas em um único módulo para melhor organização.

5 - Triggers (Gatilhos)
Código que executa automaticamente em resposta a eventos (INSERT, UPDATE, DELETE) em uma tabela.

6 - Cursors (Cursores)
Estruturas que manipulam conjuntos de dados linha a linha dentro de um bloco PL/SQL.

7 - Views (Visões)
Consultas pré-definidas armazenadas no banco para facilitar a reutilização e a segurança dos dados.

8 - Sequences (Sequências)
Objetos que geram números automaticamente, geralmente usados para chaves primárias.
*/
