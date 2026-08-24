%MACRO AlertNumericMissing (data=,vars=_NUMERIC_,alert=0.2);
PROC MEANS DATA = &data NMISS NOPRINT;
 VAR &vars;
 OUTPUT OUT = miss_value NMISS=;
RUN;
