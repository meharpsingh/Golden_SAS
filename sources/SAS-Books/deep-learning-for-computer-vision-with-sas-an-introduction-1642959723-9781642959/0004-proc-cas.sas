PROC CAS;
   dlTrain /
      table=' CAS-libref.data-table '
                                          model weights' }
      inputs={' List of ALL input variables '}
     modeltable= ' model name, specified in buildmodel actio
     bestweights={name= 'Name of output table containing bes
      nominals={' List of nominal input variables '}
      validtable={name= ' Name of validation data table' }
      target={' list of target variables'};
Quit;
