load('roadster.mat');
%fprintf(readme);
plot(speed_kmph, consumption_Whpkm);
hold on
v = linspace(2,200,1000);
plot(v,consumption(v),'--');
xlabel('km/h');
ylabel('Wh/km');
hold off


[minSpeed,minCons] = lowest_consumption();
%disp(minCons);

[km,maxSpeed] = highest_speed('speed_anna');

function [x,v] = highest_speed(route)
    % 
    load([route,'.mat']);
    maxSpeedIndex=1;
    for i =1:length(speed_kmph)
        currentSpeed = speed_kmph(i);
         maxSpeed = speed_kmph(maxSpeedIndex);
         if currentSpeed > maxSpeed
         maxSpeedIndex = i;
        end
    end
    x= distance_km(maxSpeedIndex);
    v= speed_kmph(maxSpeedIndex);
end


function [v,c] = lowest_consumption()
    % Läs in konsumtionsdata
    load('roadster.mat');
    minValueIndex = 1;
    for i = 1:length(consumption_Whpkm)
        currentValue = consumption_Whpkm(i);
        minValue = consumption_Whpkm(minValueIndex);
        if currentValue < minValue
            minValueIndex = i;
        end
    end
    v = speed_kmph(minValueIndex);
    c = consumption_Whpkm(minValueIndex);
end