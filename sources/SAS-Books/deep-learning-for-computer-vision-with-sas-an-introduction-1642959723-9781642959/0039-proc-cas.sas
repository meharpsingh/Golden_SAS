proc cas;
image.extractDetectedObjects /
 casOut={name='ObjectsExtracted', replace=true}
 coordType='YOLO'
 maxObjects=50
        extractType='highlight'
 Table={name='PathwaysScored'};
quit;
