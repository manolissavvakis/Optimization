function [intervals, k_final, calculations] = fibonacci_method(f, l)

global a b

% Find a proper n value.
n = 3;

while fibonacci(n) <= (b-a)/l
	n = n + 1;
end

fib_seq = fibonacci(1:n);

% Run the algorithm for the input function.
% Setting the interval to begin with.
a_k = a;
b_k = b;	

% Number of steps of the algorithm.
k = 1;

x1_k = a_k + ( fib_seq(n-k-1)/fib_seq(n-k+1) )*(b_k - a_k);
x2_k = a_k + ( fib_seq(n-k)/fib_seq(n-k+1) )*(b_k - a_k);

% If this flag becomes true, algorithm should finish.
flag = false;

while flag ~= true
    if k ~= n - 2
        if f(x1_k) < f(x2_k)
            
% Which means this is the first run of the algorithm, so f is calculated 2
% times.
            if a_k == a && b_k == b
                calculations = 2;
            else
                calculations = calculations + 1;
            end
        
%           a_k = a_k;
            b_k = x2_k;

            x2_k = x1_k;
            x1_k = a_k + ( fib_seq(n-k-2)/fib_seq(n-k) )*(b_k - a_k);
        
        else
           
% Which means this is the first run of the algorithm, so f is calculated 2
% times.
            if a_k == a && b_k == b
                calculations = 2;
            else
                calculations = calculations + 1;
            end
        
            a_k = x1_k;
%           b_k = b_k;

            x1_k = x2_k;
            x2_k = a_k + ( fib_seq(n-k-1)/fib_seq(n-k+1) )*(b_k - a_k);
        
        end

        k = k + 1;
        
    else
        flag = true;
        
% There is gonna be just one more calculation.
        calculations = calculations + 1;
        
        if f(x1_k) > f(x2_k)
            a_k = x1_k;
%           b_k = b_k;

        else
            b_k = x2_k;
%           a_k = a_k;

        end
        
    end

end

    
% The final intervals in which there is the minimum and the number of steps done.
intervals = [a_k, b_k];
k_final = n - 1;

end
