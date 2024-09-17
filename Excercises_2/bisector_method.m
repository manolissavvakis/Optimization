function intervals = bisector_method(f, a, b, e, l)

% Run the algorithm for the input function.
% Setting the interval to begin with.
a_k = a;
b_k = b;

while b_k - a_k >= l
    x1_k = (a_k + b_k)/2 - e;
    x2_k = (a_k + b_k)/2 + e;

    if f(x1_k) < f(x2_k)
%		a_k = a_k;
        b_k = x2_k;        
        
    else
        a_k = x1_k;
%		b_k = b_k;

    end

end

% The final intervals in which there is the minimum and the number of steps done.
intervals = [a_k, b_k];

end