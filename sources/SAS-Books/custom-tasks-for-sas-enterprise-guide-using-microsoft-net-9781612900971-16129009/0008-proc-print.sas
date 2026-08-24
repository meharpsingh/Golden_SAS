proc print data=_summaryCols noobs;
run;
title "Summary of changes in file size (in bytes)";
proc print data=_summarySize noobs;
format filesizeBefore comma12. filesizeAfter comma12.;
run;
title;
