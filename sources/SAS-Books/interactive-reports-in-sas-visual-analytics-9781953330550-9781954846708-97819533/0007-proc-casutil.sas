proc casutil;
     droptable incaslib="&lib." casdata="&ds.";
     promote incaslib="casuser" outcaslib="&lib." casdata="&ds.";
     save casdata="&ds." incaslib="&lib." outcaslib="&lib." replace;
run;
