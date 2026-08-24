PROC MEANS DATA = PointOfSale NOPRINT NWAY;
 CLASS CustID;
 VAR Sale;
 WHERE PromoID NE .;
 OUTPUT OUT = Cust_Promo(DROP = _TYPE_ _FREQ_) SUM(Sale)=Promo_Amount;
RUN;
