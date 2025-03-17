set serveroutput on;

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




