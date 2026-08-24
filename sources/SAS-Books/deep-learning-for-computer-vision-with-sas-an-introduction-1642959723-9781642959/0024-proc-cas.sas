PROC CAS;
   image.processImages /
        imagefunctions= {{functionOptions=
        {functionType="MUTATIONS"
        type="INVERT_PIXELS"
        }}}
        table={name='inputTable'}
        casout={name='outputTable'};
RUN;
