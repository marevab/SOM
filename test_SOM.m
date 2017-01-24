%% Use the generated SOM to classify the test images 

% Number of test samples
nb_test_samples = length(test_data(1,:));

% Define the label vector of the test data
test_SOM_label = zeros(nb_test_samples,1);

% Loop on the test samples 
for i = 1:nb_test_samples
    
    current_test_sample = test_data(:,i);
    
    % Determine the winner neuron : the closest neuron of the SOM from the
    % current test sample
    [winner_output_neuron, winner_output_idx, winner_output_distance] = find_winner(train_weights, current_test_sample);
    
    % Label the test sample with the one corresponding to the winner neuron
    test_SOM_label(i) = train_SOM_labels(winner_output_idx);
    
end

%% Calculate the recognition rate for the whole test sate
error_rate = get_error_rate(test_SOM_label, test_classlabel);

    