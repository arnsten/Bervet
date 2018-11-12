x = linspace(0,65,4000);
load('speed_anna');
plot(distance_km, speed_kmph);
hold on
plot(x,velocity(x,'speed_anna'),'--');
xlabel('km');
ylabel('km/h');
hold off
