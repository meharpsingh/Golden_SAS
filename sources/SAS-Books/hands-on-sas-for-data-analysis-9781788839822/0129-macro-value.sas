Options NOMREPLACE SYMBOLGEN MPRINT;
%Macro Value;
  %Let Target = Class;
  Data Test;
    Set &Target;
  Run;
