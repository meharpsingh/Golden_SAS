PROC SQL;
CREATE TABLE ratios AS
SELECT       *,
             weight / height AS Ratio
              FORMAT=5.2 LABEL='Weight:Height Ratio'
FROM         preteen
;
QUIT;
