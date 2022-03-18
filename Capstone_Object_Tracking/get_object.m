function y = get_object(I)
    %detected = false;

    persistent detector  param trackInitialized kalmanFilter;
    if isempty(detector)
        trainer = load('detect_object.mat');
        detector = trainer.detector;
    end
    if isempty(param)
        param = getDefaultParameters();
    end
    
    if isempty(trackInitialized)
        trackInitialized = false;
    end 
    
    
    [bboxes,scores,labels] = detect(detector, I,'Threshold',0.3,'MiniBatchSize',32);
    [bboxes,scores,labels] = selectStrongestBboxMulticlass(bboxes,scores,labels,'OverlapThreshold',0.1);
    
    if ~isempty(bboxes)
        detected = true; 
        bboxes = bboxes(1,:);
        centroid = bboxes(1:2);
        centroid(1) = centroid(1) + (bboxes(3)/2);
        centroid(2) = centroid(2) + (bboxes(4)/2);
        scores = scores(1,:);
        labels = cellstr(labels(1,:));
        
        displayLabel = strcat(cellstr(labels),':',num2str(scores));
        disp(labels);
        disp(scores);
        I = insertObjectAnnotation(I,'rectangle',bboxes,displayLabel);
         
    else
        detected = false;
        disp('fail');
    end
    
    if ~trackInitialized
        if detected
            initialLocation = computeInitialLocation(param,centroid);
            kalmanFilter = configureKalmanFilter(param.motionModel,initialLocation, param.initialEstimateError,param.motionNoise, param.measurementNoise);
            trackedLocation = correct(kalmanFilter, centroid);
            stateLabel = 'Initial';
            trackInitialized = true;
        else
            trackedLocation = [];
            stateLabel = '';
        end
    else
        if detected 
            predict(kalmanFilter);
            trackedLocation = correct(kalmanFilter, centroid);
            stateLabel = 'Corrected';
        else
            trackedLocation = predict(kalmanFilter);
            stateLabel = 'Predicted';
        end 
    end
    
    
    if ~isempty(trackedLocation)
        region = trackedLocation;
        region (:,3) = 5;
        I = insertObjectAnnotation(I, 'circle', region,{stateLabel}, 'Color', 'green');
    end 
    
    
    
    y = double(I);

end 