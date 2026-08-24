PROC SQL;
CREATE TABLE teens AS
SELECT       name AS FName,
             age
FROM         sashelp.class
WHERE        age>12
;
QUIT;
