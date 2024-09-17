function [min_point, k] = levenberg_marquardt(f, flag)

% e parameter.
e = 1e-4;

% Number of steps.
k = 1;

% Initiative points.
global x_0 y_0

% Gradient of f.
grad = {@(x, y) 3*x^2*exp(- x^2 - y^4) - 2*x^4*exp(- x^2 - y^4), @(x, y) -4*x^3*y^3*exp(- x^2 - y^4)};

% Laplacian of f.
lap = {@(x, y) 6*x*exp(- x^2 - y^4) - 14*x^3*exp(- x^2 - y^4) + 4*x^5*exp(- x^2 - y^4), @(x, y) 16*x^3*y^6*exp(- x^2 - y^4) - 12*x^3*y^2*exp(- x^2 - y^4)};
lap_xy = @(x, y) 8*x^4*y^3*exp(- x^2 - y^4) - 12*x^2*y^3*exp(- x^2 - y^4);

% Flag input declares what will happen with gamma variable.
% Flag = 1 --> gamma is a constant value,
% Flag = 2 --> gamma minimizes f(x_k - gamma * grad).
% Flag = 3 --> Armijo.
if flag == 1
    g = 0.1;
    
elseif flag == 2
% [a, b] are bisector intervals.
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
    
    lap_m = [lap{1}(x_k, y_k), lap_xy(x_k, y_k); lap_xy(x_k, y_k), lap{2}(x_k, y_k)];
    
    % mi is equal to the absolute value of the greatest eigenvalue of
    % lap_m + 1e-4.
    mi = abs(eigs(lap_m, 1)) + 0.0001;
    I = eye(2);
    
    c = lap_m + mi.*I;
    
    d_k = -inv(c) * [grad{1}(x_k, y_k); grad{2}(x_k, y_k)]; 
    
    if flag == 2
        
        h = @(g) f(x_k + g * d_k(1), y_k + g * d_k(2));
        
        l = 0.001;
        min_interval = bisector_method(h, a, b, e_bis, l);
        
        g = min_interval(1);
        
    elseif flag == 3
        
        m = 1;
        g = s*b^m;
    
        while f(x_k + g * d_k(1), y_k + g * d_k(2)) > f(x_k, y_k) + a * g * d_k' * [grad{1}(x_k, y_k); grad{2}(x_k, y_k)]
            
            m = m + 1;
            g = s*b^m;
            
        end
        
    end

    p = [x_k; y_k] + g .* d_k;
    
    x_k = p(1);
    y_k = p(2);
    
    k = k + 1;
    
end

k = k - 1;
min_point = [x_k, y_k];


end