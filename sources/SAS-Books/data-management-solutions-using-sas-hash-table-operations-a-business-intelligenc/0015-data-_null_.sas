data _null_ ;
dcl hash H ;
H = _new_ hash() ; *Create instance of H #1;
*...code block #1...;
H = _new_ hash() ; *Create instance of H #2;
*...code block #2...;
*...rest of program...;
run ;
