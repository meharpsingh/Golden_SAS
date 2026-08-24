data casuser.&ds.;
set &libds.;
where ParkName ne "&_name." and State ne "&_state." and
Acres ne &_acres. and Latitude ne &_lat. and
Longitude ne &_lon.;
run;
/*****************************************************************/
/* Drop existing CAS table and add table with new data
*/
/*****************************************************************/
proc casutil;
droptable incaslib="&lib." casdata="&ds.";
promote incaslib="casuser" outcaslib="&lib." casdata="&ds.";
save casdata="&ds." incaslib="&lib." outcaslib="&lib." replace;
run;
