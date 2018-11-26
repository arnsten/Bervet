function E = total_consumption(x, route, n)
%TOTAL_CONSUMPTION Uppskattad elkonsumtion.
%   n - antal deliterval i trapetsmetod.
%   Uppskattning anv�nder trapetsmetod f�r att l�sa integral 
%   E(x) = (0,x) S c(v(s)) ds

    routeData = load([route '.mat']);
    isValidRange = (x >= 0) & (x <= max(routeData.distance_km));
    if all(isValidRange) == false
        error('Fel. \nX x m�ste vara st�rre �n 0 och mindre �n st�rsta k�rstr�cka.');
    end
    s = linspace(0, x, n);
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

