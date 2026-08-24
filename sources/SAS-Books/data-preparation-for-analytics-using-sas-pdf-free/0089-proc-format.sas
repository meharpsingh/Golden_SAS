PROC FORMAT;
 VALUE est LOW -< -1     = '-'
           -1  -  1      = '='
            1   <- HIGH  = '+';
RUN;
