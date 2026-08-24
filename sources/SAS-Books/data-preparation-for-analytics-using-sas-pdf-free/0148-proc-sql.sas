PROC SQL;
CREATE TABLE scores
AS SELECT a.*,
          b.age AS C_age,
          b.weight AS C_weight,
          b.runtime AS C_runtime,
          b.intercept AS Intercept,
          (b.Intercept +
           b.age * a.age +
           b.weight * a.weight +
           b.runtime * a.runtime) AS Score
          FROM NewObs a,
               betas b;
QUIT;
