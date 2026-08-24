data market;
length AdSource $ 9. ;
input car $ AdSource $ count @@;
datalines;
sporty
paper 3 sporty
radio 4 sporty
tv 0 sporty
magazine 3
sedan
paper 0 sedan
radio 2 sedan
tv 4 sedan
magazine 0
;
