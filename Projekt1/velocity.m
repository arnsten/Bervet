function v = velocity(x, route)
% VELOCITY Returns speed after speciefied distance.
    speedData = load([route '.mat']);
    isValidDistance = (x>=0) & (x <= max(speedData.distance_km));
    if isValidDistance == false
        error('Error. X must be between 0 and the largest distance in specified file.');
    end
    s = spline(speedData.distance_km, speedData.speed_kmph, x);    
    v = s;
end