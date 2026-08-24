proc template;
  define style AllTextFont&FamilyForStyle.&Size.pt&Weight;
  parent=styles.&Parent;
class GraphFonts
/
     'GraphValueFont' = ("&Family",&Size.pt,&Weight)
     'GraphLabelFont' = ("&Family",&Size.pt,&Weight)
     'GraphDataFont'  = ("&Family",&Size.pt,&Weight)
     'GraphTitleFont' = ("&Family",&Size.pt,&Weight)
     'GraphFootnoteFont' = ("&Family",&Size.pt,&Weight);
/* All below are for non-graph output */
class Fonts /
'TitleFont'   = ("&Family",&Size.pt,&Weight)  /* table titles
and footnotes */
'headingFont' = ("&Family",&Size.pt,&Weight)  /* column headers
and row headers */
'docFont'     = ("&Family",&Size.pt,&Weight); /* table cells  */
end;
run;
%mend AllTextSetup;
