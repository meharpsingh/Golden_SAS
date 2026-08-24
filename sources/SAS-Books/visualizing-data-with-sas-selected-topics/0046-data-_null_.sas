data _null_;
%let url = //support.sas.com/documentation/onlinedoc/stat/ex_code/142;
infile "http:&url/templft.html" device=url;
file 'macros.tmp';
retain pre 0;
input;
_infile_ = tranwrd(_infile_, '&amp;', '&');
_infile_ = tranwrd(_infile_, '&lt;' , '<');
if index(_infile_, '</pre>') then pre = 0;
if pre then put _infile_;
if index(_infile_, '<pre>')
then pre = 1;
run;
%inc 'macros.tmp' / nosource;
