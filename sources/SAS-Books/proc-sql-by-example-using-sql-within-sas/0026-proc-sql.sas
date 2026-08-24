PROC SQL;
CREATE TABLE trip_list AS
SELECT       fname,
             age,
             sex,
             CASE WHEN age=11  THEN 'Zoo'
                  WHEN sex='F' THEN 'Museum'
                  ELSE              '[None]'
                  END
              AS Trip
FROM         preteen
;
QUIT;
