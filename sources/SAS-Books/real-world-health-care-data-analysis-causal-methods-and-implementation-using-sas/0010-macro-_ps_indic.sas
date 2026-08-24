%MACRO _ps_indic (in =, out =, full = NO);
  PROC CONTENTS DATA = &in (KEEP = &classvars) NOPRINT OUT = _cont;  RUN;
  DATA _NULL_;
       SET _cont (KEEP = name label type format) END = last;
       CALL SYMPUT(COMPRESS('_cvar'||PUT(_N_, BEST.)), TRIM(LEFT(name)));
       IF label ^= '' THEN
        CALL SYMPUT(COMPRESS('_clab'||PUT(_N_, BEST.)), TRIM(LEFT(label)));
              ELSE CALL SYMPUT(COMPRESS('_clab'||PUT(_N_, BEST.)),
                     TRIM(LEFT(name)));
         CALL SYMPUT(COMPRESS('_ctype'||PUT(_N_, BEST.)), type);
         CALL SYMPUT(COMPRESS('_cfmt'||PUT(_N_, BEST.)), format);
         IF last THEN
           CALL SYMPUT('_ncvar', COMPRESS(PUT(_n_, BEST.)));  RUN;
