PROC SQL;
CREATE TABLE thirteens AS
SELECT       name AS FName,
             height FORMAT=6.1,
             weight FORMAT=6.1
FROM         sashelp.class
WHERE        age=13
;
QUIT;
