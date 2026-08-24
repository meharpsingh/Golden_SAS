PROC CONTENTS DATA = sashelp.citimon
              OUT  = VarList(KEEP = name type length
                                    varnum label format);
RUN;
