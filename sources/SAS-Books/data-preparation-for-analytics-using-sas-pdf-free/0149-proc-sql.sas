PROC SQL;
 CREATE VIEW score_view
 AS SELECT   a.*,
            (b.Intercept          +
             b.age     * a.age    +
             b.weight  * a.weight +
             b.runtime * a.runtime) AS Score
       FROM NewObs  a,
            betas       b
 ;
QUIT;
