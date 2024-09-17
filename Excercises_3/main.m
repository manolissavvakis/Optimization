clc
clear
close all

f = @(x1, x2) (x1.^2)./2 + (x2.^2)./2;

% Plot f function.

[X1, X2] = meshgrid(-20:0.25:20);
Z = f(X1, X2);
figure
surf(X1, X2, Z)
xlabel('x_1')
ylabel('x_2')
zlabel('z')
title('$$f(x_1,x_2) = \frac{1}{2}x_1^{2} + \frac{1}{2}x_2^{2}$$', 'Interpreter', 'latex')


% Initiative points.
global x1_0 x2_0

x1_0 = -5;
x2_0 = 7;


% Steepest descent Method.
[minimum, steps] = steepest_descent(f)

% Steepest descent with Projection Method.
[minimum, steps] = steepest_descent_projection(f)




