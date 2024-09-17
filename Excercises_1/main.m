clc
clear
close all

% -- Uncomment to run certain parts of the code. --

% Set the functions.
f1 = @(x) (x-2)^2 - sin(x+3);
f2 = @(x) exp(-5*x) + (x+2)*(cos(0.5*x))^2;
f3 = @(x) (x^2)*sin(x+2)-(x+1)^2;

% Set the interval in which the minimum of the function exists.
global a b
a = 2;
b = 5;

% Set the e and l parameters.
%{
global l
l = 0.01;
%}


global e
e = 0.001;


%   ----     1      ----


% Bisector Method.

%{
figure(1)
for l = 0.01 : 0.01 : 0.3
%for e = 0.001 : 0.0001 : 0.003
    
   [intervals_bisector, k_bisector, calculations] = bisector_method(f1, l);
%  [intervals_bisector, k_bisector, calculations] = bisector_method(f1, e);

   scatter(l, calculations)
%  scatter(e, calculations)
    hold on
    
end
title("Function 1")
ylabel("Number of calculations.")
xlabel("Value of l parameter.")
%xlabel("Value of e parameter.")
hold off

figure(2)
for l = 0.01 : 0.01 : 0.3
%for e = 0.001 : 0.0001 : 0.003
    
     [intervals_bisector, k_bisector, calculations] = bisector_method(f1, l);
%    [intervals_bisector, k_bisector, calculations] = bisector_method(f2, e);

   scatter(l, calculations)
%    scatter(e, calculations)
    hold on
    
end
title("Function 2")
ylabel("Number of calculations.")
xlabel("Value of l parameter.")
%xlabel("Value of e parameter.")
hold off

figure(3)
for l = 0.01 : 0.01 : 0.3
%for e = 0.001 : 0.0001 : 0.003
    
   [intervals_bisector, k_bisector, calculations] = bisector_method(f1, l);
%    [intervals_bisector, k_bisector, calculations] = bisector_method(f3, e);

   scatter(l, calculations)
%    scatter(e, calculations)
    hold on
    
end
title("Function 3")
ylabel("Number of calculations.")
xlabel("Value of l parameter.")
%xlabel("Value of e parameter.")
hold off
%}

%{
% Loops used for plots (k, a_k) and (k, b_k).
figure(1)
for l = 0.01 : 0.01 : 0.05
    
    [intervals_bisector, k_bisector, calculations] = bisector_method(f1, l);

    scatter(k_bisector, intervals_bisector(1), 'MarkerFaceColor', 'black')
    hold on
    scatter(k_bisector, intervals_bisector(2), 'MarkerFaceColor', 'red')
    hold on
    
end
title("Function 1")
xlabel("Number of steps.")
ylabel("Intervals.")
hold off

figure(2)
for l = 0.01 : 0.01 : 0.05
    
    [intervals_bisector, k_bisector, calculations] = bisector_method(f2, l);

    scatter(k_bisector, intervals_bisector(1), 'MarkerFaceColor', 'black')
    hold on
    scatter(k_bisector, intervals_bisector(2), 'MarkerFaceColor', 'red')
    hold on
    
end
title("Function 2")
xlabel("Number of steps.")
ylabel("Intervals.")
hold off

figure(3)
for l = 0.01 : 0.01 : 0.05
    
    [intervals_bisector, k_bisector, calculations] = bisector_method(f3, l);

    scatter(k_bisector, intervals_bisector(1), 'MarkerFaceColor', 'black')
    hold on
    scatter(k_bisector, intervals_bisector(2), 'MarkerFaceColor', 'red')
    hold on
    
end
title("Function 3")
xlabel("Number of steps.")
ylabel("Intervals.")
hold off
%}


%   ----     2      ----


% Golden Section Method.

%{
figure(1)
for l = 0.01 : 0.01 : 0.3
    
    [intervals_golden_section, k_golden_section, calculations] = golden_section_method(f1, l);

    scatter(l, calculations)
    hold on
    
end
title("Function 1")
ylabel("Number of calculations.")
xlabel("Value of l parameter.")
hold off

figure(2)
for l = 0.01 : 0.01 : 0.3
    
    [intervals_golden_section, k_golden_section, calculations] = golden_section_method(f2, l);

    scatter(l, calculations)
    hold on
    
end
title("Function 2")
ylabel("Number of calculations.")
xlabel("Value of l parameter.")
hold off

figure(3)
for l = 0.01 : 0.01 : 0.3
    
    [intervals_golden_section, k_golden_section, calculations] = golden_section_method(f3, l);

    scatter(l, calculations)
    hold on
    
end
title("Function 3")
ylabel("Number of calculations.")
xlabel("Value of l parameter.")
hold off
%}

%{
% Loops used for plots (k, a_k) and (k, b_k).
figure(1)
for l = 0.01 : 0.01 : 0.05
    
    [intervals_golden_section, k_golden_section, calculations] = golden_section_method(f1, l);

    scatter(k_golden_section, intervals_golden_section(1), 'MarkerFaceColor', 'black')
    hold on
    scatter(k_golden_section, intervals_golden_section(2), 'MarkerFaceColor', 'red')
    hold on
    
end
title("Function 1")
xlabel("Number of steps.")
ylabel("Intervals.")
hold off

figure(2)
for l = 0.01 : 0.01 : 0.05
    
    [intervals_golden_section, k_golden_section, calculations] = golden_section_method(f2, l);

    scatter(k_golden_section, intervals_golden_section(1), 'MarkerFaceColor', 'black')
    hold on
    scatter(k_golden_section, intervals_golden_section(2), 'MarkerFaceColor', 'red')
    hold on
    
end
title("Function 2")
xlabel("Number of steps.")
ylabel("Intervals.")
hold off

figure(3)
for l = 0.01 : 0.01 : 0.05
    
    [intervals_golden_section, k_golden_section, calculations] = golden_section_method(f3, l);

    scatter(k_golden_section, intervals_golden_section(1), 'MarkerFaceColor', 'black')
    hold on
    scatter(k_golden_section, intervals_golden_section(2), 'MarkerFaceColor', 'red')
    hold on
    
end
title("Function 3")
xlabel("Number of steps.")
ylabel("Intervals.")
hold off
%}


%   ----     3      ----


% Fibonacci Method.
%{
figure(1)
for l = 0.01 : 0.01 : 0.3
    
    [intervals_fibonacci, k_fibonacci, calculations] = fibonacci_method(f1, l);

    scatter(l, calculations)
    hold on
    
end
title("Function 1")
ylabel("Number of calculations.")
xlabel("Value of l parameter.")
hold off

figure(2)
for l = 0.01 : 0.01 : 0.3
    
    [intervals_fibonacci, k_fibonacci, calculations] = fibonacci_method(f2, l);

    scatter(l, calculations)
    hold on
    
end
title("Function 2")
ylabel("Number of calculations.")
xlabel("Value of l parameter.")
hold off

figure(3)
for l = 0.01 : 0.01 : 0.3
    
    [intervals_fibonacci, k_fibonacci, calculations] = fibonacci_method(f3, l);

    scatter(l, calculations)
    hold on
    
end
title("Function 3")
ylabel("Number of calculations.")
xlabel("Value of l parameter.")
hold off
%}

%{
% Loops used for plots (k, a_k) and (k, b_k).
figure(1)
for l = 0.01 : 0.01 : 0.05
    
    [intervals_fibonacci, k_fibonacci, calculations] = fibonacci_method(f1, l);

    scatter(k_fibonacci, intervals_fibonacci(1), 'MarkerFaceColor', 'black')
    hold on
    scatter(k_fibonacci, intervals_fibonacci(2), 'MarkerFaceColor', 'red')
    hold on
    
end
title("Function 1")
xlabel("Number of steps.")
ylabel("Intervals.")
hold off

figure(2)
for l = 0.01 : 0.01 : 0.05
    
    [intervals_fibonacci, k_fibonacci, calculations] = fibonacci_method(f2, l);

    scatter(k_fibonacci, intervals_fibonacci(1), 'MarkerFaceColor', 'black')
    hold on
    scatter(k_fibonacci, intervals_fibonacci(2), 'MarkerFaceColor', 'red')
    hold on
    
end
title("Function 2")
xlabel("Number of steps.")
ylabel("Intervals.")
hold off

figure(3)
for l = 0.01 : 0.01 : 0.05
    
    [intervals_fibonacci, k_fibonacci, calculations] = fibonacci_method(f3, l);

    scatter(k_fibonacci, intervals_fibonacci(1), 'MarkerFaceColor', 'black')
    hold on
    scatter(k_fibonacci, intervals_fibonacci(2), 'MarkerFaceColor', 'red')
    hold on
    
end
title("Function 3")
xlabel("Number of steps.")
ylabel("Intervals.")
hold off
%}

%   ----     4      ----


% Bisector Method with use of derivative.

%{
figure(1)
for l = 0.01 : 0.01 : 0.3
    
    [intervals_bisector_der, k_bisector_der, calculations] = bisector_method_derivative(f1, l);

    scatter(l, calculations)
    hold on
    
end
title("Function 1")
ylabel("Number of calculations.")
xlabel("Value of l parameter.")
hold off

figure(2)
for l = 0.01 : 0.01 : 0.3
    
    [intervals_bisector_der, k_bisector_der, calculations] = bisector_method_derivative(f2, l);

    scatter(l, calculations)
    hold on
    
end
title("Function 2")
ylabel("Number of calculations.")
xlabel("Value of l parameter.")
hold off

figure(3)
for l = 0.01 : 0.01 : 0.3
    
    [intervals_bisector_der, k_bisector_der, calculations] = bisector_method_derivative(f3, l);

    scatter(l, calculations)
    hold on
    
end
title("Function 3")
ylabel("Number of calculations.")
xlabel("Value of l parameter.")
hold off
%}

%{
% Loops used for plots (k, a_k) and (k, b_k).
figure(1)
for l = 0.01 : 0.01 : 0.05
    
    [intervals_bisector_der, k_bisector_der, calculations] = bisector_method_derivative(f1, l);

    scatter(k_bisector_der, intervals_bisector_der(1), 'MarkerFaceColor', 'black')
    hold on
    scatter(k_bisector_der, intervals_bisector_der(2), 'MarkerFaceColor', 'red')
    hold on
    
end
title("Function 1")
xlabel("Number of steps.")
ylabel("Intervals.")
hold off

figure(2)
for l = 0.01 : 0.01 : 0.05
    
    [intervals_bisector_der, k_bisector_der, calculations] = bisector_method_derivative(f2, l);

    scatter(k_bisector_der, intervals_bisector_der(1), 'MarkerFaceColor', 'black')
    hold on
    scatter(k_bisector_der, intervals_bisector_der(2), 'MarkerFaceColor', 'red')
    hold on
    
end
title("Function 2")
xlabel("Number of steps.")
ylabel("Intervals.")
hold off

figure(3)
for l = 0.01 : 0.01 : 0.05
    
    [intervals_bisector_der, k_bisector_der, calculations] = bisector_method_derivative(f3, l);

    scatter(k_bisector_der, intervals_bisector_der(1), 'MarkerFaceColor', 'black')
    hold on
    scatter(k_bisector_der, intervals_bisector_der(2), 'MarkerFaceColor', 'red')
    hold on
    
end
title("Function 3")
xlabel("Number of steps.")
ylabel("Intervals.")
hold off
%}