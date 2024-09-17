function [min_point, k] = steepest_descent_projection(f)

% Constraints.
lower = [-20; -12];
upper = [10; 15];

% Set parameters.
s_k = 20;
g = 0.3;
e = 0.02;

% Initiative points.
global x1_0 x2_0

% Number of steps.
k = 1;

% Gradient of f.
grad = {@(x1, x2) x1, @(x1, x2) x2};

x1_k = x1_0;
x2_k = x2_0;

% Save x1 and x2 values and plot them at the end.
x_values = [x1_k; x2_k];

while norm( [grad{1}(x1_k, x2_k), grad{2}(x1_k, x2_k)] ) >= e
    
    projected_v = [x1_k - s_k * grad{1}(x1_k, x2_k); x2_k - s_k * grad{2}(x1_k, x2_k)];
    x_bar = projection(projected_v, lower, upper);
    
%   g = 2/(2+k);  

    p = [x1_k; x2_k] + g .* [x_bar(1) - x1_k; x_bar(2) - x2_k];
    
    x1_k = p(1);
    x2_k = p(2);
    
    x_values = [x_values(1, :) x1_k; x_values(2, :) x2_k];
    
    k = k + 1;
    
end

min_point = [x1_k, x2_k];

figure
plot(0:1:k-1, x_values(1, :), 0:1:k-1, x_values(2, :))
title({'Steepest Descent Method with Projection';'Transition of x_1 and x_2 depending on the step.'})
xlabel('Step')
ylabel('x')
legend('x_1', 'x_2')

end

