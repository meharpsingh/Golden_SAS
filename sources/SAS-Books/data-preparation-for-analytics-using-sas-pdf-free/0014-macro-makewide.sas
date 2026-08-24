%MACRO MAKEWIDE (DATA=,OUT=out,COPY=,ID=,
                 VAR=, TIME=time);
PROC TRANSPOSE DATA   = &data
               PREFIX = &var
               OUT    = &out(DROP = _name_);
 BY  &id &copy;
 VAR &var;
 ID  &time;
RUN;
%MEND;
