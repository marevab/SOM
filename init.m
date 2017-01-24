clear all 
close all 

% Load data 
load MNIST_dataset.mat;

% Select the classes 0,2,3,4,5,6,7,9 for training set
train_idx_81 = find(train_classlabel == 8 | train_classlabel == 1);
train_classlabel(train_idx_81) = [];
train_data(:,train_idx_81) = [];

% Select the classes 0,2,3,4,5,6,7,9 for test set
test_idx_81 = find(test_classlabel == 8 | test_classlabel == 1);
test_classlabel(test_idx_81) = [];
test_data(:,test_idx_81) = [];