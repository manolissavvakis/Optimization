function [intervals, k_final, calculations] = golden_section_method(f, l)

global a b

% Set the gamma parameter.
gamma = 0.618;

% Run the algorithm for the input function.
% Setting the interval to begin with.
a_k = a;
b_k = b;

x1_k = a_k + (1-gamma)*(b_k - a_k);
x2_k = a_k + gamma*(b_k - a_k);

% Number of steps of the algorithm.
k = 1;

% Number of times f is calculated.
calculations = 0;

% BThe 2 values of f (for x_11 and x_21) are compared before the execution
% of the method, so calculations are equal to 2.
%calculations = 2;

while b_k - a_k >= l

    if f(x1_k) < f(x2_k)
        
% Which means this is the first run of the algorithm, so f is calculated 2
% times.
        if a_k == a && b_k == b
            calculations = 2;
        else
            calculations = calculations + 1;
        end
        
%		a_k = a_k;
        b_k = x2_k;

        x2_k = x1_k;
        x1_k = a_k + (1-gamma)*(b_k - a_k);
        
    else    
% Which means this is the first run of the algorithm, so f is calculated 2
% times.
        if a_k == a && b_k == b
            calculations = 2;
        else
            calculations = calculations + 1;
        end
        
        a_k = x1_k;
%		b_k = b_k;

        x1_k = x2_k;
        x2_k = a_k + gamma*(b_k - a_k);

    end

    k = k + 1;

end

% The final intervals in which there is the minimum and the number of steps done.
intervals = [a_k, b_k];
k_final = k - 1;

end

