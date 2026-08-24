PROC SQL;
CREATE TABLE girls AS
SELECT       *
FROM         preteen
WHERE        sex='F'
;
QUIT;
