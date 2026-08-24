%let lib = jobs;
%let ds = NATIONAL_PARKS;
%let libds = &lib..&ds.;
%let _name=White Sands;
%let _state=nm;
%let _acres=146344;
%let _lat=32.78;
%let _lon=-106.17;
%let _name_o=White Sands;
%let _state_o=nm;
%let _acres_o=1463;
%let _lat_o=32.78;
%let _lon_o=-106.17;
/****************************************************************
*/
/*  Update data in casuser.parks table                           */
/****************************************************************
*/
data casuser.&ds.;
     set &libds.;
     if ParkName="&_name_o." and State="&_state_o." and Acres=&_acres_o.
         and Latitude=&_lat_o. and Longitude=&_lon_o. then do;
           if "&_name." = '' then ParkName = "&_name_o.";
           else ParkName = "&_name.";
           if "&_state."= '' then State="&_state_o.";
           else State="&_state.";
           if "&_acres." = "" then Acres="&_acres_o.";
           else Acres="&_acres.";
           if "&_lat." = "" then Latitude="&_lat_o.";
           else Latitude="&_lat.";
           if "&_lon." = "" then Longitude="&_lon_o.";
           else Longitude="&_lon.";
     end;
run;
