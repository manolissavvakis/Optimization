function [intervals, k_final, calculations] = bisector_method_derivative(f, l)

syms x
global a b

% Derivative of the function given.
df = diff(f, x);

% Find a proper n value.
n = 1;

while (1/2)^n > l/(b-a)
	n = n + 1;
end

% Run the algorithm for the input function.
% Setting the interval to begin with.
a_k = a;
b_k = b;	

% Number of steps of the algorithm.
k = 1;

% Number of times f is calculated.
calculations = 0;

% If this flag becomes true, algorithm should finish.
flag = false;

while flag ~= true
    
    x_k = (a_k + b_k)/2;

    if double(subs(df, x_k)) > 0
%       a_k = a_k;
        b_k = x_k;

    elseif double(subs(df, x_k)) < 0
%       b_k = b_k;
        a_k = x_k;
        
    else
        flag = true;
        
    end
  
    if k ~= n && flag == false
        k = k + 1;
        
    else
        flag = true;
        
    end
    
end

% The final intervals in which there is the minimum.
intervals = [a_k b_k];
k_final = n - 1;
calculations = n - 1;

end