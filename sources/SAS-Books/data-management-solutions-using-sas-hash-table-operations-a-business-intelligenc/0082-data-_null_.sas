data _null_;
/* define the lookup hash object tables */
dcl hash players(dataset:"dw.players(rename=(Player_ID=Batter_ID))"
,multidata:"Y");
players.defineKey("Batter_ID");
players.defineData("Batter_ID","Team_SK","Last_Name","First_Name"
,"Start_Date","End_Date");
players.defineDone();
dcl hash teams(dataset:"dw.teams");
teams.defineKey("Team_SK");
teams.defineData("Team_Name");
teams.defineDone();
dcl hash games(dataset:"dw.games");
games.defineKey("Game_SK");
games.defineData("Date","Month","DayOfWeek");
