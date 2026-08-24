OPTIONS MEXECNOTE NOSYMBOLGEN NOMPRINT;
%Macro Test_Log;
  Data Test;
    Set Class;
  Run;
%Mend Test_Log;
%Test_Log;
