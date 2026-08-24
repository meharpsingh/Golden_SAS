%macro reorder(from, to, list);
proc template;
define style styles.&to;
parent=styles.&from;
%do i = 1 %to 12;
%let s = %scan(&list, &i);
%if &s ne %then %do;
style GraphData&i from GraphData&i /
contrastcolor = GraphColors("gcdata&s")
color = GraphColors("gdata&s");
%end;
%end;
end;
run;
%mend;
