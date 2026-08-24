proc cas;
mytbl.name  ="Tiny-Yolov2";
table.update /
     table=mytbl
     set = {
       {var="_DLNumVal_", value="4"}};
/* Apply a random cropping mutation */
                                           coordScale
                                           coordType
                                           detectionT
                                           iouThresho
/*                                          randomBoxe
/* Apply horizontal and vertical flipping mutations */
mytbl.where = "'input1' = _DLKey0_ and 'No flipping' =
mytbl.name  ="Tiny-Yolov2";
table.update /
     table=mytbl
     set = {
       {var="_DLNumVal_", value="2"}
     };
mytbl.name  ="Tiny-Yolov2";
mytbl.where = "'dropout' = _DLChrVal_";
table.update /
     table=mytbl
     set = {
       {var="_DLNumVal_", value="0.0176666749"}};
mytbl.name  ="Tiny-Yolov2";
table.update /
     table=mytbl
     set = {
       {var="_DLNumVal_", value="0"}};
mytbl.name  ="Tiny-Yolov2";
