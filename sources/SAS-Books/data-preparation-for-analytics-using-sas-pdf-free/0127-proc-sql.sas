PROC SQL;
 CREATE TABLE prdsale_sum
 AS SELECT month FORMAT = yymmp6.,
           product,
           SUM(actual) as Actual
    FROM sashelp.prdsale
 WHERE year(month) = 1993
 GROUP BY month, product
    ORDER BY product, month;
QUIT;
