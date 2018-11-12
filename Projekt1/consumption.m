function c = consumption(v)
% CONSUMPTION Returns consumption for specified speed.
    isValidRange = (v >= 2) & (v <= 200);
    if all(isValidRange) == false
        error('Error. \nVelocity must be between 2 - 200');
    end
    consumptionData = load('roadster.mat');
    s = spline(consumptionData.speed_kmph, consumptionData.consumption_Whpkm, v);    
    c = s;
end