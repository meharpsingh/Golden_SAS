proc glimmix;
 class gender edu;
  model pdc = gender age edu refill / dist=beta link=logit;
run;
