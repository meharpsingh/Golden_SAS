/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/scottbass__SAS/Presentations/SNUG/SNUG Q4 2016.egp (egp_code 10) */

﻿/*=====================================================================
Program Name            : libname_sqlsvr.sas
Purpose                 : Allocate a SQL Server library via ODBC
SAS Version             : SAS 9.3
Input Data              : N/A;
Output Data             : N/A;

Macros Called           : parmv
                          dump_mvars

Originally Written by   : Scott Bass;
Date                    : 12AUG2016
Program Version #       : 1.0

=======================================================================

Modification History    :

=====================================================================*/

/*---------------------------------------------------------------------
Usage:

%libname_sqlsvr(libref=RLDXHosp);

Allocates the libref RLDXHosp, 
with defaults of database=<libref>, schema=dbo, and options as coded;
in the macro.;

Note that this only works if the database name is a valid SAS libref,

METAPORT option (i.e. which profile is active in EG)

=======================================================================

%libname_sqlsvr(libref=mylib, database=RLDXHosp_prod);

Allocates the libref MYLIB,
with the explicit database=RLDXHosp_prod, schema=dbo, and options as
coded in the macro.;

=======================================================================

%libname_sqlsvr(libref=TMP, database=RLDXHosp_dev, schema=tmp);

Allocates the libref TMP,
with the explicit database=RLDXHosp_dev, schema=tmp, and options as
coded in the macro.;

=======================================================================

%libname_sqlsvr(;
   libref=RLDXHosp, 
   options=;
      bulkload=yes 
      schema=dbo
      reread_exposure=yes 
      DBINDEX=YES 
      UPDATE_LOCK_TYPE=NOLOCK 
      IGNORE_READ_ONLY_COLUMNS=YES
)

Allocates the libref RLDXHosp,
with defaults of database=<libref>, and overridden options from those;
coded in the macro.;

Note that the explicit options completely override the options in the;
macro, rather than augmenting the options in the macro.;

=======================================================================

%libname_sqlsvr(libref=RLDXHosp, server=FOO, port=12345);

Allocates the libref RLDXHosp,
with defaults of database=<libref>, schema=dbo,

-----------------------------------------------------------------------
Notes:


%let lev = %sysfunc(ifc(%sysfunc(getoption(METAPORT)) eq 8561,Lev1,Lev2));
%let env = %sysfunc(ifc(%sysfunc(getoption(METAPORT)) eq 8561,prod,dev));

So, if METAPORT=8561 then lev=Lev1 and env=prod.;

If the DATABASE parameter is blank, then database parameter will;

Otherwise, the DATABASE parameter will be used, irrespective of the 
EG environment.  IOW, you can allocate a production database from
Lev2 by explicitly specifying the database.;



---------------------------------------------------------------------*/

%macro libname_sqlsvr;
/*---------------------------------------------------------------------
Allocate a SQL Server library via ODBC
---------------------------------------------------------------------*/
(LIBREF=       /* Libref to allocate (REQ)                           */
,DATABASE=     /* Database to use (Opt).                             */
               /* If blank then LIBREF_<env> is used.                */
,SCHEMA=dbo    /* Default database schema (REQ).  Default is dbo.    */
,OPTIONS=      /* Libref options (Opt).  If specified, the options   */;
               /* completely override (as opposed to augment) the    */
               /* options embedded in this macro.                    */
,SERVER=DOHNSCLDBSASBI 
               /* SQL Server machine name (REQ).                     */
,PORT=54491    /* SQL Server machine port (REQ).                     */

);

%local macro parmerr lev env;
%let macro = &sysmacroname;

%* check input parameters ;
%parmv(LIBREF,       _req=1,_words=0,_case=N);
%parmv(DATABASE,     _req=0,_words=0,_case=N);
%parmv(SCHEMA,       _req=1,_words=0,_case=N);
%parmv(OPTIONS,      _req=0,_words=1,_case=N);
%parmv(SERVER,       _req=1,_words=0,_case=N);
%parmv(PORT,         _req=1,_words=0,_case=N,_val=POSITIVE);

%if (&parmerr) %then %goto quit;

%* set the correct environment ;
%let lev = %sysfunc(ifc(%sysfunc(getoption(METAPORT)) eq 8561,Lev1,Lev2));
%let env = %sysfunc(ifc(%sysfunc(getoption(METAPORT)) eq 8561,prod,dev));

%* If the database was not specified, set it to the <libref>_<env> ;
%if (&DATABASE eq ) %then %let database=&libref._&env;

%* set the connection string ;
%let connect = NOPROMPT="Driver={SQL Server Native Client 10.0};Server=&SERVER,&PORT;Database=&database;Trusted_Connection=yes;";
/* %let connect = NOPROMPT="Driver={ODBC Driver 11 for SQL Server};Server=&SERVER,&PORT;Database=&database;Trusted_Connection=yes;"; */

%* set any libname options ;
%if (&OPTIONS eq ) %then %do;
%*let options = bulkload=yes schema=&schema insertbuff=100 readbuff=1000 direct_exe=delete connection=global autocommit=yes dbcommit=50;
%*let options = bulkload=yes schema=&schema reread_exposure=yes DBINDEX=YES UPDATE_LOCK_TYPE=NOLOCK IGNORE_READ_ONLY_COLUMNS=YES;
%*let options = bulkload=yes schema=&schema reread_exposure=yes DBINDEX=YES UPDATE_LOCK_TYPE=NOLOCK;
%*let options = bulkload=yes schema=&schema insertbuff=100 readbuff=1000 direct_exe=delete connection=global;
%*let options = bulkload=yes schema=&schema direct_exe=delete connection=global;
%*let options = bulkload=yes schema=&schema connection=global;
%let options = bulkload=yes schema=&schema;
%*let options = schema=&schema;
%end;

%* issue the libname statement ;
%put %sysfunc(repeat(=,80));
%put LIBREF:  %upcase(&libref);
%put CONNECT: &connect;
%put OPTIONS: %sysfunc(compbl(&options));
%put %sysfunc(repeat(=,80));
%put;
libname &libref odbc &connect &options;

%quit:;

%mend;

/******* END OF FILE *******/
