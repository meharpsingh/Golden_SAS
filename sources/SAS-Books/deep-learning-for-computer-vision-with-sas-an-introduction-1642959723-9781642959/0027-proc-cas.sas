PROC CAS;
   image.processImages /
        imagefunctions={{functionOptions=
        {functionType="MUTATIONS"
          type="VERTICAL_FLIP"
        }}}
        table={name='inputTable'}
        casout={name='outputTable'};
run;
