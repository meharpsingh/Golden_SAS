PROC SQL;
CREATE TABLE subset(DROP=height weight) AS
SELECT       *
FROM         preteen
;
QUIT;
