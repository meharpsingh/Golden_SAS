proc glm data=ameshousing;
    ... n
    estimate 'mu1 vs the rest'
        heating_qc 3 -1 -1 -1 / divisor=3; o
run;quit;
