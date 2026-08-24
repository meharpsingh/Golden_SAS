PROC SQL;
CREATE TABLE demolib.fifteenups AS
SELECT       name AS FName, sex, age, height, weight
FROM         sashelp.class
WHERE        age GE 15
;
QUIT;
%MEND refresh_example;
