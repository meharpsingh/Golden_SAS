data _null_;
 file _webout;
 rc = appsrv_header(
         'Location',
'http://support.sas.com/publishing/bbu/companion_site/home.html'
                   );
 put; n
run;
