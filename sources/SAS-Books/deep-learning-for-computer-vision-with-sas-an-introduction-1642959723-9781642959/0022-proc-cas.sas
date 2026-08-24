PROC CAS;
   image.processImages /
         imageFunctions= {{functionOptions=
    {functionType= "GAUSSIAN_FILTER"
    KernelWidth= 5
           KernelHeight= 5}}
         table={name='inputTable'}
         casout={name='outputTable'};
RUN;
