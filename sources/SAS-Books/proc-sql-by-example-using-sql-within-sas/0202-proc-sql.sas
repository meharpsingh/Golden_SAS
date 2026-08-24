PROC SQL;
CREATE TABLE from_scratch
             (
               First  CHARACTER(10)
                      LABEL='Label for 1st column',
               Second NUMERIC
                      FORMAT=7.2
             )
;
QUIT;
