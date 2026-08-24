%Macro Test_Log_Alt;
  Data Test;
    Set Class_Alt;
  Run;
%Mend Test_Log_Alt;
%Test_Log_Alt;
