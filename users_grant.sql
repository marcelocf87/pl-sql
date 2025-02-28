show user;

SELECT USERNAME FROM USER_USERS;

SELECT USERNAME FROM DBA_USERS;

SELECT USERNAME FROM ALL_USERS;

--ver privilégios do usuario
SELECT * FROM DBA_TAB_PRIVS WHERE GRANTEE = 'SYSTEM';

--se nao tiver privilegio para ver
SELECT * FROM ALL_TAB_PRIVS WHERE GRANTEE = 'SYSTEM';

--ver tabelas do usuário
SELECT TABLE_NAME FROM DBA_TABLES WHERE OWNER = 'nome_do_usuario';

--se estiver no próprio schema
SELECT TABLE_NAME FROM USER_TABLES;

--ver objetos de um schema
SELECT OBJECT_NAME, OBJECT_TYPE FROM DBA_OBJECTS WHERE OWNER = 'SYSTEM';

--se estiver no próprio schema
SELECT OBJECT_NAME, OBJECT_TYPE FROM USER_OBJECTS;

--ver o nome do banco de dados
SELECT SYS_CONTEXT('USERENV', 'DB_NAME') FROM DUAL;

--para ver o owner de uma tabela ou objeto específico
SELECT OWNER FROM ALL_TABLES WHERE TABLE_NAME = 'nome_da_tabela';


--verificar em qual PDB você está conectado para saber requisitos de senha de user
show con_name; 

--criar um usuario comum (precisa iniciar com C## se estiver num CDB)
CREATE USER C##marcelo IDENTIFIED BY marcelo;

--dar permissoes ao usuario conecte ao banco de dados
GRANT CREATE SESSION TO C##marcelo;

--conceder permissões para criação de objetos
GRANT CREATE TABLE, CREATE VIEW TO C##marcelo;

--dar permissao de administrador
GRANT DBA TO C##marcelo;

--dar permissao para criar trigger e procedure
GRANT CREATE PROCEDURE, CREATE TRIGGER TO nome_do_usuario;

--dar permissão de acesso a uma tabela
GRANT SELECT, INSERT, UPDATE ON nome_da_tabela TO nome_do_usuario;

--revogar permissoes
REVOKE SELECT, INSERT ON nome_da_tabela FROM nome_do_usuario;









