function [weights_matrix] = SOM(input_data, N, M, nb_iter, eff_width_init, eff_width_time_cst, learning_rate_init, learning_rate_time_cst)

%
% This function enables to train a Self-organizing Map
% input data : data of the training set or test set
% N, M : dimensions of the lattice
% nb_iter : number of iterations
% eff_width_init : initial effective width (sigma0)
% eff_width_time_cst : time constant of the effective width (tau1)
% learning_rate_init : initial learning rate
% learning_rate_time_cst : time constant of the learning rate (tau2)
% Returns weights_matrix : matrix which contains the weights of the output neurons
%

% FIRST STEP : Initialize the weights randomly

% Define the weights matrix : (dimension of input data) x (number of output neurons) matrix
p = length(input_data(:,1));
nb_samples = length(input_data(1,:));
nb_neurons = N * M;
weights_matrix = rand(p,nb_neurons);

% Loop on the number of iterations
for i = 1:nb_iter
    
    % SECOND STEP : select an input vector randomly
    
    x_idx = randi([1 nb_samples],1,1);
    x = input_data(:,x_idx);
    
    % THIRD STEP : Determine the winner neuron
    
    [winner_neuron, winner_idx, winner_distance] = find_winner(weights_matrix, x);
    % Get the position of the winner neuron in the lattice 
    [winner_position_i, winner_position_j] = ind2sub(N,winner_idx);
    
    % FOURTH STEP : Update the winner and winner's neighboors
    
    % Adapt the learning rate
    learning_rate = learning_rate_init * exp(-(i-1)/learning_rate_time_cst);
    learning_rate_vector(i) = learning_rate;
    % Adapt the effective width
    eff_width = eff_width_init * exp(-(i-1)/eff_width_time_cst);
    eff_width_vector(i) = eff_width;
    % Update the weights matrix
    for k = 1:nb_neurons     
        % Get the position of the kth neuron in the lattice 
        [neuron_position_i, neuron_position_j] = ind2sub(N,k);
        % Determine the distance between the winner neuron and the current
        % neuron
        distance_winner_neuron = sqrt((neuron_position_i - winner_position_i)^2 +(neuron_position_j - winner_position_j)^2);
        % Determine the neighborhood function value for each output neuron
        neighborhood_distance = exp(- distance_winner_neuron^2 / (2 * eff_width^2));
        weights_matrix(:,k) = weights_matrix(:,k) + learning_rate * neighborhood_distance * (x - weights_matrix(:,k));
    end 
    
end

end

