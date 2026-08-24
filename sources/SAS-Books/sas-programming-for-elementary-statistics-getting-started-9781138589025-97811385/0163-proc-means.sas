PROC MEANS DATA=beef3 NOPRINT;
BY producer sex;
VAR adg dmi cwt rea backfat;
OUTPUT OUT=beef3means MEAN=ADG_mn DMI_mn CWT_mn REA_mn BackFat_mn;
RUN;
