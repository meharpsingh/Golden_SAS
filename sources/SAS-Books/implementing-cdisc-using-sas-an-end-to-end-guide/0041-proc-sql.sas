          proc sql noprint;
           select count(distinct rdomain)
             into :domn
             from %if &suppqual %then &sourcelib..suppqual; %else
                members;
             ;
           select distinct rdomain
             into :domain1 - :domain%left(&domn)
             from %if &suppqual %then &sourcelib..suppqual; %else
                members;
             ;
          %do _i=1 %to &domn;
            %domainx(domain=&&domain&_i,suppqual=&suppqual);
          %end;
      %end; %* if domains not specified explicitly...;
%mend mergsupp;
