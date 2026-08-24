PROC SQL;
            Select * From Dictionary.Tables
            Where Libname eq "WORK"
And Memname eq "COST_LIVING";
            Select * From Dictionary.Columns
            Where Libname eq "WORK"
            And Memname eq "COST_LIVING";
QUIT;
