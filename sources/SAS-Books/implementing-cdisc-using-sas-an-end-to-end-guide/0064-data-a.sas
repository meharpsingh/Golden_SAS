data a b c;
  length x y z $200 ;
        x = 'CDISC, SDTM, ADaM';
        y = 'Y';
        z = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
        output;
        x = 'hi';
        output;
run;
