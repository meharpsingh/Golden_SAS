%macro secretsql(dbname, username);
  %local dd uu pp; n
  Proc SQL noprint nofeedback;
    (
      SELECT dsn, uid, pwd into :dd, :uu, :pp
      FROM advrpt.passtab(read=readpwd) o
        WHERE dsn=trim(symget('dbname')) p
            AND uid=trim(symget('username'))
    );
    connect to odbc(dsn=%superq(dd) uid=%superq(uu) pwd=%superq(pp)); q
    create table mylib.mytable as select * from connection to odbc(
      %passthru r /* contains your pass-thru SQL statement(s) */
    );
    disconnect from odbc;
    quit;
%mend secretsql;
