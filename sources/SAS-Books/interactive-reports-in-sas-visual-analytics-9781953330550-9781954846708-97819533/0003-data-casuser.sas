%let lib = jobs;
%let ds = NATIONAL_PARKS;
%let libds = &lib..&ds.;
%let _name=Gateway Arch;
%let _state=mo;
%let _acres=193;
%let _lat=38.63;
%let _lon=-90.19;
/****************************************************************
*/
/*  Add new data to casuser.parks table                          */
/****************************************************************
*/
data casuser.&ds.;
     length ParkName varchar(46) State varchar(10) Acres Latitude
            Longitude 8.;
     ParkName="&_name.";
     State="&_state.";
     Acres=&_acres.;
     Latitude=&_lat.;
     Longitude=&_lon.;
run;
/****************************************************************
*/
/*  Append data from CAS to table with new data                  */
/****************************************************************
*/
data casuser.&ds. (append=yes);
     set &libds.;
run;
/****************************************************************
*/
/*  Drop existing CAS table and add table with new data          */
/****************************************************************
*/
proc casutil;
     droptable incaslib="&lib." casdata="&ds.";
     promote incaslib="casuser" outcaslib="&lib." casdata="&ds.";
     save casdata="&ds." incaslib="&lib." outcaslib="&lib." replace;
run;
