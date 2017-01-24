function [winner_vector, winner_idx, winner_distance] = find_winner(data, x)

%
% This function enables to find the closest vector of one given vector
% data : matrix which contains the vectors
% x : vector
% Returns the winner vector, its index and the corresponding distance between it and x
%

% Initialize the winner vector and the corresponding distance from the
% input x
winner_vector = data(:,1);
winner_distance = norm(x-winner_vector);
winner_idx = 1;

% Loop on the number of vectors
for j = 1:length(data(1,:));
    % Calculate the distance
    distance = norm(x - data(:,j));
    % Update the winner neuron if the distance found is shorter than
    % the previous one
    if (distance <= winner_distance)
        winner_distance = distance;
        winner_vector = data(:,j);
        winner_idx = j;
    end
end

end

