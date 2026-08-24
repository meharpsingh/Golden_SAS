  proc cas;
    table.fetch  /
     table="Tiny-Yolov2"
    to=500;
   loadactionset 'deeplearn';
   loadactionset 'image';
   loadactionset 'table';
quit;
