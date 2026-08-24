proc fcmp outlib=work.functions.newfuncs;
function tier(val) $;
length newval $ 6;
if val < 20 then newval = 'Low';
else if val <30 then newval='Medium';
else newval='High';
return(newval);
endsub;
quit;
