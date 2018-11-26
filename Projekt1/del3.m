format SHORT;
routeAnna = load('speed_anna.mat');
routeElsa = load('speed_elsa.mat');

route = 'speed_anna';
x = max(routeAnna.distance_km)
N = 2.^(10:20);
E = [];
err = [];
for i = 1:length(N)
    E(i) = total_consumption(x, route, N(i));    
end

for i = 1:length(E)-1
    err(i) = abs(E(i)-E(i+1))
end
loglog( N(1:end-1), err);
% noggrannhetsordning p
% lämplig konstant C
p = 0.0001;
C = err(1) / (N(1)^-p);
hlpl = C*N(1:end-1).^-p;
hold on;
plot (hlpl);
hold off;
%annaConsTotal = total_consumption(max(routeAnna.distance_km), 'speed_anna', 10)
%elsaConsTotal = total_consumption(max(routeElsa.distance_km), 'speed_elsa', 10)