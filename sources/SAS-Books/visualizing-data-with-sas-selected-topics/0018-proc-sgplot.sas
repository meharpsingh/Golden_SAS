proc sgplot data=ae3s dattrmap=attrmap;
  format stdate date7.;
  refline 0 / axis=x lineattrs=(color=black);
  highlow y=aedecod low=stday high=enday / type=bar group=aesev
          lineattrs=(color=black pattern=solid) barwidth=0.8
          lowlabel=aedecod highcap=highcap attrid=Severity
          nomissinggroup labelattrs=(color=black size=7);
  scatter y=aedecod x=stdate / x2axis markerattrs=(size=0);
