PROC SQL;
CREATE VIEW  demolib.v_twelve_sql AS
SELECT       *
FROM         subset
WHERE        age=12
;
