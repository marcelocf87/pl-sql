set serveroutput on;

declare
   v_verdade VARCHAR2(20) := 'SÓ JESUS SALVA';
begin
   DBMS_OUTPUT.PUT_LINE('A verdade é: ' || v_verdade);
end;
/
SET VERIFY OFF;  -- Evita exibição do código alterado antes da execução

--1 Declare uma variável do tipo NUMBER, atribua um valor e exiba na saída depois altere para exibir um número informado pelo usuário
ACCEPT numero NUMBER PROMPT 'Digite um número: '--Exibe uma mensagem pedindo para o usuário digitar um número que ficará armazenado como uma variável global &numero
declare
     v_numero NUMBER := &numero;
begin   
    dbms_output.put_line('O número é: ' || v_numero);
end;
/
--as vezes pode não pedir a entrada do usuário corretamente porque ACCEPT funciona melhor em scripts SQL, então pode não funcionar como esperado dentro de blocos PL/SQL anônimos utilizando &

--2 Peça para o usuário inserir um numero e verifique se um número é par ou ímpar
ACCEPT numero NUMBER PROMPT 'Digite um numero: ';
DECLARE
    v_numero NUMBER;
BEGIN
    v_numero := &numero;
    if mod(v_numero,2) = 0 then
        dbms_output.put_line('Número par');
    else
        dbms_output.put_line('Número impar');    
    end if;    
end;            
/


ACCEPT numero NUMBER PROMPT 'Digite um número: ';
define v_numero = &numero;
DECLARE
    v_numero NUMBER := &v_numero; -- Agora usando a variável definida
BEGIN
    IF MOD(v_numero, 2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_numero || ' é par');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_numero || ' é ímpar');    
    END IF;    
END;
/

 
--if/else
set serveroutput on;

DECLARE 
    v_idade NUMBER := 25;
BEGIN
    if v_idade >= 18 then
        dbms_output.put_line('É maior de idade');
    else
        dbms_output.put_line('É menor de idade');
    end if;    
END;
/

--loop
DECLARE
    i NUMBER := 1;
BEGIN
    WHILE i < 5 LOOP
        DBMS_OUTPUT.PUT_LINE('Valor: ' ||i);
        i := i + 1;
    END LOOP;
END;
/

--Crie um bloco que receba um número v_num e: Se for par, exiba "Número par". Se for ímpar, exiba "Número ímpar"
--Faça um FOR LOOP de 1 a 10 que exiba os números e a soma acumulada
DECLARE
    v_num NUMBER := 11;
BEGIN
    if mod(v_num,2) = 0 then
        DBMS_OUTPUT.PUT_LINE('É par');
    else
        DBMS_OUTPUT.PUT_LINE('É Impar');
    end if;
END;
/

--for 
BEGIN
    for i in 1..10 loop
        DBMS_OUTPUT.PUT_LINE('Numero: '||i);
    end loop;
END;
/


DECLARE
    v_soma NUMBER := 0;
BEGIN
    FOR i IN 1..10 LOOP
        v_soma := v_soma + i;
        DBMS_OUTPUT.PUT_LINE('Número: ' || i || ' | Soma dos números: ' || v_soma);
    END LOOP;     
END;
/
