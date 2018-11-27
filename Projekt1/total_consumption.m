function E = total_consumption(x, route, n)
%TOTAL_CONSUMPTION Uppskattad elkonsumtion.
%   n - antal deliterval i trapetsmetod.
%   Uppskattning använder trapetsmetod för att lösa integral 
%   E(x) = (0,x) S c(v(s)) ds

    routeData = load([route '.mat']);
    isValidRange = (x >= 0) & (x <= max(routeData.distance_km));
    if all(isValidRange) == false
        error('Fel. \nX x måste vara större än 0 och mindre än största körsträcka.');
    end
    s = linspace(0, x, n+1);
    Vs = velocity(s, route);
    Cs = consumption(Vs);
    
    A = 0;
    for i = 1:length(Cs)-1
        y1 = Cs(i);
        y2 = Cs(i+1);
        h = s(i+1) - s(i);
        A = A + (y1*h + (y2-y1)*h*1/2);
    end
    E = A;
end

