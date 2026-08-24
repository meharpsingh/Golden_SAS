proc template;
define statgraph ContourPlotParm;
dynamic _X _Y _Z _TITLE;
begingraph;
entrytitle _TITLE;
layout overlay;
contourplotparm x=_X y=_Y z=_Z / nhint=12
contourtype=fill colormodel=twocolorramp name="Contour";
continuouslegend "Contour" / title=_Z;
endlayout;
endgraph;
end;
run;
proc sgrender data=GRF template=ContourPlotParm;
where _ITER_ = 1;
