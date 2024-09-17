function score = fitness_fun(x)

kp1 = x(1);
kp2 = x(2);
ki1 = x(3);
ki2 = x(4);
kd1 = x(5);
kd2 = x(6);

% Time of sampling.
tf = 10;

[x, t, u] = simclosedloop(kp1, kp2, ki1, ki2, kd1, kd2, tf);

y_d = {@(t) 90*pi/180 + (30*pi*cos(t))/180, @(t) pi/ 2 + (30*pi*sin(t))/180};

e = [x(:, 1) - y_d{1}(t), x(:, 3) - y_d{2}(t)];

% --- Calculation of J's ---
J1 = max(abs(e(end, :)));

dfe = diff(e);

flag = zeros(1, 2);
e_ov = zeros(1, 2);
i = 1;

% Find observation error's overshoot.
% A flag variable is used to avoid extra calculations, if the needed t is
% found.
while (flag(1) == 0 || flag(2) == 0) && i <= (length(t)-2)
    
    if flag(1) == 0 && dfe(i, 1)*dfe(i+1, 1) < 0
        e_ov(1) = e(i, 1);
        flag(1) = 1;
    end
    
    if flag(2) == 0 && dfe(i, 2)*dfe(i+1, 2) < 0
        e_ov(2) = e(i, 2);
        flag(2) = 1;
    end
    
    i = i + 1;
    
end

J2 = max(abs(e_ov));

ts = zeros(1, 2);

for j = 1:2
    
    i = length(t);
    
    while abs(e(i, j)) <= pi/180 && i > 0
        i = i - 1;
    end
    
    if i == length(t)
        ts(j) = t(i);
    else
        ts(j) = t(i + 1);
    end

end    
   
J3 = (max(ts));

J4 = max(abs(u(:)));

df = diff(u);
J5 = max(abs(df(:)));

J6 = max(abs(u(end, :) - u(1, :)));

% --- Constraints ---
penalty_flag = 0;

if J1 >= pi/180
    penalty_flag = penalty_flag + 1;
end

if J2 >= pi/180
    penalty_flag = penalty_flag + 1;
end

if J3 >= 1
    penalty_flag = penalty_flag + 1;
end

if J4 >= 18
    penalty_flag = penalty_flag + 1;
end

if J5 >= 160
    penalty_flag = penalty_flag + 1;
end

if J6 >= 30
    penalty_flag = penalty_flag + 1;
end

if penalty_flag ~= 0
    score = 50 + penalty_flag * 8;
else
    score = 0.1*J1 + 0.1*J2 + 0.1*J3 + sqrt(J4) + sqrt(J5) + sqrt(J6);
end

if score > 100
    score = 100;
end

end
