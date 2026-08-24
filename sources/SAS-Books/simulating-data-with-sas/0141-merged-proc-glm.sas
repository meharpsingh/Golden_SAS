/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0141-data-glmdata.sas --- */
%let nCont = 4;
/* number of contin vars
*/
%let nClas = 2;
/* number of class vars
*/
%let nLevels = 3;
/* number of levels for each class var */
%let N = 100;
/* Simulate GLM data with continuous and class variables */
data GLMData(drop=i j);
array x{&nCont} x1-x&nCont;
array c{&nClas} c1-c&nClas;
call streaminit(1);
/* simulate the model */
do i = 1 to &N;
do j = 1 to &nCont;
/* continuous vars for i_th obs */
x{j} = rand("Uniform");
/* uncorrelated uniform
*/
end;
do j = 1 to &nClas;
/* class vars for i_th obs
*/
c{j} = ceil(&nLevels*rand("Uniform"));
/* discrete uniform */
end;
/* specify regression coefficients and magnitude of error term */
y = 2*x{1} - 3*x{&nCont} + c{1} + rand("Normal");
output;
end;
run;

/* --- 0142-proc-glm.sas --- */
proc glm data=GLMData;
class c1-c&nClas;
model y = x1-x&nCont c1-c&nClas / SS3;
ods select ModelANOVA;
quit;
