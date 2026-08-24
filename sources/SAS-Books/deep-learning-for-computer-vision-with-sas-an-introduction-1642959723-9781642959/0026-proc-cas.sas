proc cas;
   image.processImages /
        imagefunctions= {{functionOptions=
        {functionType="MUTATIONS"
        type="ROTATE_RIGHT"
        }}}
        table={name='inputTable'}
        casout={name='outputTable'};
run;
