function [error_rate] = get_error_rate(y,d)

%
% This function enables to calculate the error rate between two signals y
% and d (they have both same size)
% y is the network output
% d is the desired output
% Returns the error rate 
%

% Define an error vector with 0 (when y = d) and 1 values
error_vector = zeros(length(y), 1);

for i = 1 : length(error_vector)
   if (y(i) == d(i))
       error_vector(i) = 0;
   else 
       error_vector(i) = 1;
   end
end

% Calculate the error vector by counting the number of '1'
error_rate = sum(error_vector) / length(error_vector);

end


