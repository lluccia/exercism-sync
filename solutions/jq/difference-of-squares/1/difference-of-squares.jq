def sumOfSquares(n): (n * (n+1) * (2*n + 1) ) / 6;
def squareOfSum(n): pow((n * (n+1)) / 2; 2 );
def differenceOfSquares(n): squareOfSum(n) - sumOfSquares(n);

if .property == "squareOfSum" then
    squareOfSum(.input.number)
elif .property == "sumOfSquares" then
    sumOfSquares(.input.number)
else
    differenceOfSquares(.input.number)
end

