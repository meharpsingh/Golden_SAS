%macro HR(data=, unit bi1=1, unit bi2=1);
** &unit bi1 and &unit bi2 define the unit
**
** measure of increase for bi1 and bi2 with **
** which to compute the hazard ratio for
**
** the latent random effects bi1 and bi2
**;
data hazards;
set &data;
if Parameter IN ('eta TRT'
'eta Diabetic'
'eta GFR0' 'eta Sex')
then do;
Units=1.0;
HR=exp(estimate*Units);
LCL=exp(lower*Units);
UCL=exp(upper*Units);
end;
if Parameter IN ('eta Age')
then do;
Units=10.0;
HR=exp(estimate*Units);
LCL=exp(lower*Units);
UCL=exp(upper*Units);
end;
if Parameter IN ('eta bi1') then do;
Units=&unit bi1;
HR=exp(estimate*Units);
LCL=exp(lower*Units);
UCL=exp(upper*Units);
end;
if Parameter IN ('eta bi2') then do;
Units=&unit bi2;
HR=exp(estimate*Units);
LCL=exp(lower*Units);
UCL=exp(upper*Units);
end;
%mend;
