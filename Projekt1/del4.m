

plussa(1, 3)

f1 = @(a, b) a + b;
f2 = @(f1, c) f1 - c;
f3 = @plussa;


function summa = plussa(a, b)
    summa = a + b;
end