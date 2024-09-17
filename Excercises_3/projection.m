function projection_value = projection(vector, lower_b, upper_b)

% This function calculates the projection of the argument vector.
projection_value = zeros(size(vector));

for i = 1 : length(vector)
    
    if vector(i) <= lower_b(i)
        projection_value(i) = lower_b(i);
        
    elseif vector(i) >= upper_b(i)
        projection_value(i) = upper_b(i);
        
    else
        projection_value(i) = vector(i);
        
    end
     
end

end

