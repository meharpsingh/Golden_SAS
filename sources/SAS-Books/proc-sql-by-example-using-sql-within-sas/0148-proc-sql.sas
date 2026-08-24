PROC SQL;
CREATE TABLE twelves AS
SELECT       name as FName,
             sex,
             height,
             weight
FROM         sashelp.class
WHERE        age=12
;
QUIT;
