SELECT user FROM dual;

SELECT USERNAME FROM USER_USERS;

SELECT USERNAME FROM ALL_USERS order by 1;

SELECT USERNAME FROM DBA_USERS order by 1;


--resetar a senha
ALTER USER C##MARCELO IDENTIFIED BY marcelo123;


--verificar se tem privilégio DBA
SELECT * FROM user_role_privs WHERE granted_role = 'DBA';

--ver todos os privilégios no banco
SELECT * FROM user_tab_privs;

--ver privilégios do usuario
SELECT * FROM DBA_TAB_PRIVS WHERE GRANTEE = 'C##MARCELO';

--se nao tiver privilegio para ver
SELECT * FROM ALL_TAB_PRIVS WHERE GRANTEE = 'C##MARCELO';

--ver tabelas do usuário
SELECT TABLE_NAME FROM DBA_TABLES WHERE OWNER = 'C##MARCELO';

--se estiver no próprio schema
SELECT TABLE_NAME FROM USER_TABLES;

--ver objetos de um schema
SELECT OBJECT_NAME, OBJECT_TYPE FROM DBA_OBJECTS WHERE OWNER = 'C##MARCELO';

--se estiver no próprio schema
SELECT OBJECT_NAME, OBJECT_TYPE FROM USER_OBJECTS;

--ver o nome do banco de dados
SELECT SYS_CONTEXT('USERENV', 'DB_NAME') FROM DUAL;

--para ver o owner de uma tabela ou objeto específico
SELECT OWNER FROM ALL_TABLES WHERE TABLE_NAME = 'nome_da_tabela';


--comandos típicos de dba
--lista todos os usuários
SELECT username FROM all_users;

--verificar status do banco de dados
SELECT status FROM v$instance;

--ver tablespaces
SELECT tablespace_name, status FROM dba_tablespaces;

--testar permissoes de dba
CREATE USER testuser IDENTIFIED BY testpassword;

--conceder privilégio
GRANT CREATE SESSION TO testuser;