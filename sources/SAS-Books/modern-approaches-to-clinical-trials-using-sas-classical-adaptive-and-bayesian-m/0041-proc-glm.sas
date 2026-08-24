proc glm data=dstcon;
     class group;
     model resp = group ;
     contrast "Trend contrast" group
              -0.47434 -0.31623 -0.15811 0.15811 0.79057;
run;
