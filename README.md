# Handwritten number classification using Self-organising Map

### Synopsis ###
This project took place during the module _Neural networks_ at NUS (EE5904R).
The goal of this project is to classify handwritten digits from MNIST dataset by using a Self-Organising Map. All digits from 0 to 9 have been taken into account for the classification task, except the digits 1 and 8.

### Results ###


### Project content ###

Content of this project: 

* 'MNIST_dataset.mat': MNIST dataset
* 'init.m': Matlab script to initialize the program (load the dataset 'MNIST_dataset.mat' into the Matlab workspace) 
* other Matlab files ('.m' extension): Matlab functions and scripts to run the program

To make the program run: 

1. run _init_
2. run _train_SOM_ to build a SOM and train it
3. run _viz_SOM_ to visualize the weights of the SOM
4. run _test_SOM_ to use the SOM to classify the samples of the test dataset

### Author ###

Mareva Brixy (marevabrixy@gmail.com)
