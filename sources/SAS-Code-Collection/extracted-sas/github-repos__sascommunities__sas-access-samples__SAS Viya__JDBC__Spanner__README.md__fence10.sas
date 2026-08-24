/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-access-samples/SAS Viya/JDBC/Spanner/README.md (fence 10) */

%let database=<database> ;
%let pgadapter_server=<pgadapter_server> ;

options sastrace=',,,d' sastraceloc=saslog nostsuffix msglevel=i;
linesize=132 pagesize=max validvarname=any validmemname=extend noquotelenmax ;

/* Connect: OK */
libname spanner jdbc;
   url="jdbc:postgresql://&pgadapter_server:5432/&database"
   preserve_names=yes
   ;


/* List: OK */
proc datasets lib=spanner ;
quit ;


/* Read: OK */
proc print data=spanner.facilities ;
run ;


/* Create with data step: KO */
/* requires a primary key */
proc delete data=spanner.class ;
run ;
data spanner.class ;
   set sashelp.class ;
run ;


/* Create with proc sql: KO */
/* requires a primary key */
proc delete data=spanner.class2 ;
run ;
proc sql ;
   create table spanner.class2 as select * from sashelp.class ;
quit ;


/* Create with explicit PT OK */
proc delete data=spanner.class ;
run ;
proc sql ;
   connect using spanner ;
   execute (
      CREATE TABLE "class" ("Name" VARCHAR(8),"Sex" VARCHAR(1),"Age" DOUBLE PRECISION,"Height" DOUBLE PRECISION,"Weight" DOUBLE PRECISION, PRIMARY KEY("Name"));
   ) by spanner ;
   disconnect from spanner ;
quit ;
/* Append OK */
proc append base=spanner.class data=sashelp.class ;
run ;


/* Update with proc sql: OK */
proc sql ;
   update spanner.facilities set name='Pickleball Court 2' where name='Tennis Court 2' ;
quit ;


/* Delete rows with proc sql: OK */
proc sql ;
   delete from spanner.facilities where name='Pickleball Court 2' ;
quit ;


/* Insert rows with proc sql: OK */
proc sql ;
   insert into spanner.facilities(facid, name, membercost, guestcost, initialoutlay, monthlymaintenance) values (9, 'PingPong table', 0, 5, 400, 15) ;
quit ;


/* Delete table proc delete: OK */
proc delete data=spanner.class ;
run ;


/* Delete table proc sql: OK */
proc sql ;
   drop table spanner.facilities ;
quit ;


/* Query table proc sql: OK */
proc sql ;
   select membercost **2 from spanner.facilities ;
quit ;
proc sql ;
   select distinct membercost **2 from spanner.facilities ;
quit ;


/* fedSQL: OK */
/* IPTRACE shows the generated query */
options msglevel=n ;
proc fedsql iptrace ;
   select * from spanner."facilities" ;
quit ;


/* CAS connect: OK */
/* Connection happens when "list files" is run */
cas _all_ terminate ;
cas mysession ;

/* Drop caslib if exists */
proc cas ;
   action table.dropCaslib / caslib="casspan" quiet=true ;
quit ;

/* Define a Spanner caslib */
caslib casspan datasource=(srctype="jdbc"
   url="jdbc:postgresql://&pgadapter_server:5432/&database" schema="public"
   ) libref=casspan ;

/* List Spanner tables: OK */
proc casutil incaslib="casspan" ;
   list files ;
quit ;


/* CAS load table: OK */
proc casutil incaslib="casspan" outcaslib="casspan" ;
   load casdata="facilities" casout="facilities" replace ;
quit ;

/* CAS save table: KO */
proc casutil incaslib="casspan" outcaslib="casspan" ;
   save casdata="facilities" casout="facilities2" ;
quit ;

cas _all_ terminate ;
