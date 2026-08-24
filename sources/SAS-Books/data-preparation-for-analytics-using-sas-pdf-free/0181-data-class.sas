DATA class;
 SET sashelp.class;
 ATTRIB NrChildren LABEL  = "Number of children in family"
                    FORMAT = 8.;
 ATTRIB district
LABEL = "Regional district"
                    FORMAT = $10.;
RUN;
