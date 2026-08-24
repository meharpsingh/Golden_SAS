/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0309-data-have.sas --- */
data have ;
format calc_exprsn $50.;
input input1 input2 input3 input4 calc_exprsn $ &;
datalines;
4 6 7 9  INPUT1 * INPUT2 + 100
8 8 6 2  INPUT3 / INPUT2
8 3 90 11  INPUT1 - INPUT3
;
run;

/* --- 0310-data-want.sas --- */
data want;
length name $ 8;
set have ;
drop i name;
macro_exprsn = tranwrd(calc_exprsn, 'INPUT' , '&INPUT'); ➊
array nums {*} input1-input4; ➋
do i = 1 to dim(nums); ➌
  call vname(nums{i}, name); ➍
  call symputx(name, nums{i}); ➎
end;
calc_rslt = resolve('%sysevalf('||macro_exprsn||')'); ➏
calc_rslt2 = compbl(resolve(macro_exprsn)); ➐
run;
