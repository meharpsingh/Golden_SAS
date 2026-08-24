proc template;
define style Styles.MyStyle;
parent = styles.htmlblue;
style GraphData1 from GraphData1 /
color = GraphColors('gdata3')
contrastcolor = GraphColors('gcdata3');
style GraphData2 from GraphData2 /
color = GraphColors('gdata2')
contrastcolor = GraphColors('gcdata2');
style GraphData3 from GraphData3 /
color = GraphColors('gdata1')
contrastcolor = GraphColors('gcdata1');
end;
run;
