function [min_point, k] = steepest_descent(f)

% e parameter.
e = 0.01;

% Initiative points.
global x1_0 x2_0

% Number of steps.
k = 0;

% Gradient of f.
grad = {@(x1, x2) x1, @(x1, x2) x2};

% Gamma values used.
%g = 0.1;
%g = 1;
%g = 2;
%g = 10;

x1_k = x1_0;
x2_k = x2_0;

% Save x1 and x2 values and plot them at the end.
x_values = [x1_k; x2_k];

while norm( [grad{1}(x1_k, x2_k), grad{2}(x1_k, x2_k)] ) >= e
    
    d_k = -[grad{1}(x1_k, x2_k); grad{2}(x1_k, x2_k)];
    
    p = [x1_k; x2_k] + g .* d_k;
    
    x1_k = p(1);
    x2_k = p(2);
    
    x_values = [x_values(1, :) x1_k; x_values(2, :) x2_k];
    
    k = k + 1;
    
end

min_point = [x1_k, x2_k];

figure
plot(0:1:k, x_values(1, :), 0:1:k, x_values(2, :))
title({'Steepest Descent Method';'Transition of x_1 and x_2 depending on the step.'})
xlabel('Step')
ylabel('x')
legend('x_1', 'x_2')

end
