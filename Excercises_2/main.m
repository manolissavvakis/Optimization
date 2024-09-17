clc
clear
close all

f = @(x, y) (x.^3) .* exp(-x.^2 - y.^4);

%           --- 1 ---

[X, Y] = meshgrid(-4 : 0.25 : 4);
Z = f(X, Y);

%
fgr = figure(1);
surf(X, Y, Z)
xlabel('x')
ylabel('y')
zlabel('z')
title('f(x,y) = x^3e^{-x^2-y^4}', 'FontAngle', 'italic')
%view(0, 0)


%
% Flag input declares what will happen with gamma variable.
% Flag = 1 --> gamma is a constant value,
% Flag = 2 --> gamma minimizes f(x_k - gamma * grad).
% Flag = 3 --> Armijo.
flag = 1;

% Initiative points.
global x_0 y_0

x_0 = -1;
y_0 = -1;


% Steepest descent method.
%
[minimum, steps] = steepest_descent(f, flag)

figure(fgr)
%view(0, 90)
hold on
z_point = f(minimum(1), minimum(2));
plot3(minimum(1), minimum(2), z_point, 'o' ,'MarkerSize', 10, 'Color', 'red', 'linewidth', 2)
%plot(minimum(1), minimum(2), 'o' ,'MarkerSize', 10, 'Color', 'red', 'linewidth', 2)
%xlim([-2 2])
%ylim([-2 2])
title({'Steepest Descent Method';['Minimum for (x_0, y_0) = (', num2str(x_0), ', ', num2str(y_0), ')']});
%}


% Newton method.
%{
[minimum, steps] = newton(f, flag)

figure(fgr)
%view(0, 90)
hold on
z_point = f(minimum(1), minimum(2));
plot3(minimum(1), minimum(2), z_point, 'o' ,'MarkerSize', 10, 'Color', 'red', 'linewidth', 2)
%plot(minimum(1), minimum(2), 'o' ,'MarkerSize', 10, 'Color', 'red', 'linewidth', 2)
%xlim([-2 2])
%ylim([-2 2])
title({'Newton Method';['Minimum for (x_0, y_0) = (', num2str(x_0), ', ', num2str(y_0), ')']});
%}


%
% Levenber - Marquardt method.
%{
[minimum, steps] = levenberg_marquardt(f, flag)
z_point = f(minimum(1), minimum(2));

figure(fgr)
%view(0, 90)
hold on
plot3(minimum(1), minimum(2), z_point, 'o' ,'MarkerSize', 10, 'Color', 'red', 'linewidth', 2)
%plot(minimum(1), minimum(2), 'o' ,'MarkerSize', 10, 'Color', 'red', 'linewidth', 2)
%xlim([-2 2])
%ylim([-2 2])
title({'Levenber - Marquardt Method';['Minimum for (x_0, y_0) = (', num2str(x_0), ', ', num2str(y_0), ')']});

%}



