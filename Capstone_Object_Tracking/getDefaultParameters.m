function param = getDefaultParameters
  %param.motionModel = 'ConstantVelocity';
  param.initialLocation = 'Same as first detection';
  param.initialEstimateError  = 1E5 * ones(1, 3);
  param.motionNoise  = [25, 10, 1];
  param.measurementNoise = 25;
  
  param.accumulatedImage = 0;
  param.accumulatedDetections = zeros(0, 2);
  param.accumulatedTrackings  = zeros(0, 2);
  
  
  param.motionModel = 'ConstantVelocity'; % switch from ConstantAcceleration
                                        % to ConstantVelocity
    % After switching motion models, drop noise specification entries
    %   corresponding to acceleration.
  param.initialEstimateError = param.initialEstimateError(1:2);
  param.motionNoise          = param.motionNoise(1:2);
end