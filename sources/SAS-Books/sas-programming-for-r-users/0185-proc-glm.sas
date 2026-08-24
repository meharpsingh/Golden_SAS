proc glm data=ameshousing;
    ...
    lsmeans heating_qc / adjust=tukey;
run;quit;
