
function x = newtonSolver(f, xstart, hstart, epsilon)
    fPrimeExp = diff(f);
    fPrime = matlabFunction(fPrimeExp);
    fFunc = matlabFunction(f);
    x = xstart;
    h = hstart;
    while abs(h) > epsilon
        b = -fFunc(x);
        a = fPrime(x);
        h = b/a;
        x = x + h;
    end    
end

function x = reach(C, route)
    
end