data _null_;
put '***** Before routine call';
call printn('macro3', 'clinics', 3); ➎
put '***** After routine call';
run;
