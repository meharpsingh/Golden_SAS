data replicates;
  set uniqueXs (drop=_type_ _freq_);
  do i=1 to n;
    set complementaryXs point=i nobs=n;
%include "&scoreCodeFile.";
    output;
  end;
run;
