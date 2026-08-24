%macro CompileSurvivalTemplates;
%local outside;
proc template;
%do outside = 0 %to 1;
define statgraph
Stat.Lifetest.Graphics.ProductLimitSurvival%scan(2,2-&outside);
dynamic NStrata xName plotAtRisk
%if %nrbquote(&censored) ne %then plotCensored;
