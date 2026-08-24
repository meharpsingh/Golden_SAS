proc sort data=ScoredOutput
out=l.ScoredOutput(drop=_temp_IDvar_ensure_not_existing_);
    by _temp_IDvar_ensure_not_existing_;
run;
%do i=1 %to &n;
    %do j=&i %to &n;
        proc delete data=ScoredOutput&i._&j;
        run;
    %end;
%end;
%mend MakeScoredDAG;
