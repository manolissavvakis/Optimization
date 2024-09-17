function [intervals, k_final, calculations] = bisector_method(f, l)
%function [intervals, k_final, calculations] = bisector_method(f, e)

%global a b l
global a b e

% Run the algorithm for the input function.
% Setting the interval to begin with.
a_k = a;
b_k = b;

% Number of steps of the algorithm.
k = 1;

% Number of times f is calculated.
calculations = 0;


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

    calculations = calculations + 2;
    k = k + 1;

end

% The final intervals in which there is the minimum and the number of steps done.
intervals = [a_k, b_k];
k_final = k - 1;

end