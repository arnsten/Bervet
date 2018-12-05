format SHORT;
routeAnna = load('speed_anna.mat');
routeElsa = load('speed_elsa.mat');

route = 'speed_anna';
x = max(routeAnna.distance_km)
N = 2.^(10:20);
H = x ./ (N-1);
E = [];
err = [];
for i = 1:length(N)
    E(i) = total_consumption(x, route, N(i));    
end

for i = 1:length(E)-1
    err(i) = abs(E(i)-E(i+1))
end
loglog( H(1:end-1), err);
% noggrannhetsordning p
% lämplig konstant C
p = 2;
C = err(9)/ (H(9)^p);
hlpl = C * H.^p;
hold on;
loglog (H, hlpl);
hold off;
%annaConsTotal = total_consumption(max(routeAnna.distance_km), 'speed_anna', 10)
%elsaConsTotal = total_consumption(max(routeElsa.distance_km), 'speed_elsa', 10)