%MACRO makewide_ds(DATA=,OUT=,COPY=,ID=,VAR=,
                   TIME=Measurement);
*** Part 1 - Creating a list of Measurement IDs;
PROC FREQ DATA = &data NOPRINT;
 TABLE &time / OUT = distinct (DROP = count percent);
RUN;
