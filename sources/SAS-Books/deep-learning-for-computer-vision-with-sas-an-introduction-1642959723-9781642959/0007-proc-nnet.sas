proc nnet data=MYCAS.Train_DEVELOP standardize=std;
   target Ins / level=nominal;
   input AcctAge DDABal CashBk
        Checks NSFAmt Phone
        Teller SavBal ATMAmt
        POS POSAmt CDBal
        IRABal LOCBal ILSBal
        MMBal MMCred MTGBal
        CCBal CCPurc Income
     LORes HMVal Age
        CRScore Dep DepAmt InvBal / level=interval;
   input DDA DirDep NSF
       Sav ATM CD
       IRA LOC ILS
       MM MTG CC
       SDB HMOwn Moved
       InArea Inv / level=nominal;
   hidden 30;
   hidden 20;
   hidden 10;
   hidden 5;
   hidden 10;
   hidden 20;
   hidden 30;
run;
