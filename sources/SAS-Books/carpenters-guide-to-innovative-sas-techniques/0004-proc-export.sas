PROC EXPORT DATA= sashelp.class
            OUTFILE= "&path\data\class.csv"
            DBMS=csv
            REPLACE;
   RUN;
PROC EXPORT DATA= WORK.A n
            OUTFILE= "C:\temp\junk.xls"o
            DBMS=EXCELp
            REPLACEq;
     SHEET="junk";r
RUN;
