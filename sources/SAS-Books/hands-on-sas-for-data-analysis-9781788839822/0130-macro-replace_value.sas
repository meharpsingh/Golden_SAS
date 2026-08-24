%Macro Replace_Value;
  %Let Target = Alt;
  Data Test;
    Set &Target;
  Run;
%Mend Replace_Value;
%Replace_Value;
