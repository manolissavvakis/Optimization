function [min_point, k] = steepest_descent(f, flag)

% e parameter.
e = 1e-6;

% Initiative points.
global x_0 y_0

% Number of steps.
k = 1;

% Gradient of f.
grad = {@(x, y) 3*x^2*exp(- x^2 - y^4) - 2*x^4*exp(- x^2 - y^4), @(x, y) -4*x^3*y^3*exp(- x^2 - y^4)};

% Flag input declares what will happen with gamma variable.
% Flag = 1 --> gamma is a constant value,
% Flag = 2 --> gamma minimizes f(x_k - gamma * grad).
% Flag = 3 --> Armijo.
if flag == 1
    g = 0.1;
    
elseif flag == 2
    a = 0.001;
    b = 0.5;
    e_bis = 1e-4;

else
    s = 0.5;
    a = 1e-5;
    b = 0.5;
        
end
    
x_k = x_0;
y_k = y_0;

while norm( [grad{1}(x_k, y_k), grad{2}(x_k, y_k)] ) >= e
    
    d_k = -[grad{1}(x_k, y_k); grad{2}(x_k, y_k)];

%   Find the g value that minimizes the function.
%   Bisector method will be used to find the minimum gamma
%   value.
    if flag == 2
        
        h = @(g) f(x_k + g * d_k(1), y_k + g * d_k(2));
        
        l = 0.001;
        min_interval = bisector_method(h, a, b, e_bis, l);
        
        g = min_interval(1);
        
    elseif flag == 3
        
        m = 1;
        g = s*b^m;
        
        
        while f(x_k, y_k) - f(x_k + g * d_k(1), y_k + g * d_k(2)) < -a * g * d_k' * [grad{1}(x_k, y_k); grad{2}(x_k, y_k)]
            
            m = m + 1;
            g = s*b^m;
            
        end
        
% In case the previous loop returned a value greater than 1, it should be
% reduced by 1.
        if m ~= 1
            m = m - 1;
            g = s*b^m;
        end
        
    end    
    
    p = [x_k; y_k] + g .* d_k;
    
    x_k = p(1);
    y_k = p(2);
    
    k = k + 1;
    
end

min_point = [x_k, y_k];
k = k - 1;

end
