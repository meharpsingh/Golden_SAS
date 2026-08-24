DATA FAMILY;
INFILE datalines delimiter=',';
INPUT RELATION $ FIRSTNAME $;
DATALINES;
son,Adams,
;
RUN;
