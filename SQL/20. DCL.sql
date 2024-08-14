# DCL

use indexx ;


create user "sagar"@"localhost" identified by "sagar1" ;

grant select on indexx.c1 to "sagar"@"localhost"  ;

revoke select on indexx.c1 from "sagar"@"localhost" ;



SHOW GRANTS FOR "sagar"@"localhost" ;

grant all on indexx.* to "sagar"@"localhost" ;

REVOKE ALL PRIVILEGES ON indexx.* FROM "sagar"@"localhost";


SHOW GRANTS FOR "amittt"@"localhost" ;


REVOKE ALL PRIVILEGES ON indexx.c1 FROM 'amittt'@'localhost';


---------------------------------------------------

BEGIN;

INSERT INTO course (course_name, course_tag) VALUES ('Mathematics', 'MATH');
INSERT INTO course (course_name, course_tag) VALUES ('Science', 'SCI');

-- Check the data
SELECT * FROM course;

-- Decide to commit or rollback
COMMIT;



BEGIN;

UPDATE course SET course_tag = 'NEW_TAG' WHERE course_name = 'History';

-- Decide to discard changes
ROLLBACK;


-- Create a new user with a password
CREATE USER 'john_doe'@'localhost' IDENTIFIED BY 'password123';

-- Grant specific privileges
GRANT INSERT, UPDATE ON indexx.c1 TO 'john_doe'@'localhost';

-- Check the privileges
SHOW GRANTS FOR 'john_doe'@'localhost';


-- Revoke all privileges on a specific table
REVOKE ALL PRIVILEGES ON indexx.c1 FROM 'amittt'@'localhost';

-- Revoke specific privilege
REVOKE DELETE ON indexx.* FROM 'amittt'@'localhost';



