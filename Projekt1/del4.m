C = 10000;
xAnna = reach(C, 'speed_anna')
xElsa = reach(C, 'speed_elsa')


function x = reach(C, route)
    routeData= load([route '.mat']);
    xmax = max(routeData.distance_km);
    Cmax = total_consumption(xmax, route, 2^20);
    if C > Cmax 
        C = Cmax;
    end
    xstart = C * xmax / Cmax;
    hstart = xstart / 10;
    epsilon = 0.001;
    fPrime = @(x) consumption(velocity(x, route));
    f =  @(x) total_consumption(x, route, 2^20) - C; 
    x = newtonSolver(f, fPrime, xstart, hstart, epsilon);
        
    function x = newtonSolver(f, fPrime, xstart, hstart, epsilon)
        x = xstart;
        h = hstart;
        while abs(h) > epsilon
            b = -f(x);
            a = fPrime(x);
            h = b/a;
            x = x + h;
        end    
    end
end