PROC CAS;
 AugmentImages /
       table={name= "MyInputTable"}
       casOut={name= "MyOutputTable"}
       writeRandomly= true
rotateright= true           }
                      width= 32
                      heigth= 32
             cropList={mutations= {      colorjittering= tru
                      useWholeImage= true};
RUN;
