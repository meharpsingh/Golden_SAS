proc fcmp outlib=pg3.funcs.weather;
function FtoC(TempF);
TempC=round((TempF-32)*5/9,.01);
