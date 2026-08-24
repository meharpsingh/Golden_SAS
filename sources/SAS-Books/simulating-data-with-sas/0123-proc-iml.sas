proc iml;
/* variance components: diag({var1, var2,..,varN}), var_i>0 */
start VarComp(v);
return( diag(v) );
finish;
vc = VarComp({16,9,4,1});
print vc;
