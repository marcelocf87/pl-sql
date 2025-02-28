BEGIN
   FOR r IN (SELECT object_name, object_type FROM user_objects WHERE object_type IN ('TABLE', 'VIEW', 'SEQUENCE', 'INDEX')) LOOP
      EXECUTE IMMEDIATE 'DROP ' || r.object_type || ' ' || r.object_name || ' CASCADE CONSTRAINTS';
   END LOOP;
END;
/

SELECT table_name FROM user_tables;


