PROC FORMAT;
    VALUE FMTAGE    LOW-12 = 'Child'
                    13,14,15,16,17,18,19 = 'Teen'
                    20-59 = 'Adult'
                    60-HIGH = 'Senior';
VALUE FMTSTAT       1='Lower Class'
                    2='Lower-Middle'
                    3='Middle Class'
                    4='Upper-Middle'
                    5='Upper';
RUN;
