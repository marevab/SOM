# Handwritten number classification using Self-organising Map

### Synopsis ###
This project took place during the module _Neural networks_ at NUS (EE5904R).
The goal of this project is to classify handwritten digits from MNIST dataset by using a Self-organising Map (SOM). All digits from 0 to 9 have been taken into account for the classification task, except the digits 1 and 8.

Self-organising Map is a kind of neural network with only two fully-connected layers: one input layer and one output layer. The output layer consists of a two-dimensional map that is called the _lattice_. The dimensions of the lattice are set to 10 x 10 in our case, thus there are 100 output neurons.

A SOM is trained under unsupervised learning: the weights are adapted based upon the input signals only. The main steps of the learning process are the following (Matlab script 'train_SOM'): 

1. Select randomly an input vector from the training set, which constitutes an input signal
2. Determine the winner output neuron (competitive process): the neuron of the SOM which is the closest to the selected input vector, in terms of euclidean distance. I wrote the Matlab function _find_winner(data, x)_ to evaluate the closest vector of a data set from a given input vector x.
3. Update the weights of the neurons of the SOM by using a neighborhood function. In our case, the neighborhood function is a Gaussian function that depends on the distance between the neuron considered and the winner neuron in the lattice. The closer a neuron is from the winner neuron in the lattice, the more affected it is. 

By following these steps iteratively, the weights of the output nuerons follow the distribution of the input signals.

The training phase is followed by a testing or mapping phase to classify a new input vector (Matlab script 'test_SOM'). The classification of a new input vector is simply done by determining its closest output neuron of the lattice. 

### Results ###

After the training step, I wanted to know whether the training was effective and whether the output neurons are organized in an meaningful way. For each output neuron of the lattice, I determined which input signal stimulate the particular neuron the most. In other words, which input signal is the closest of that output neuron. Then I attributed the label of the input signal to the neuron of the lattice. It gives the following result (left: visualization of the weights of the output neurons ; right: attributed labels).

![Representation of weights of the neurons of the SOM and corresponding labels values](img/SOM.png)

We can almost determine all numbers represented on the left picture. Some numbers are easily recognizable, for example the numbers 0, 2, 6, because the form of these numbers is distinctive from the others. On the other hand, there are some confusions for a few numbers, such as the number 4 which looks like the number 9, and the number 3 looks like the number 5. It appears on the map that the numbers which look like to each other are close in the map : the numbers 7, 9 and 4 are on the lower left corner and the numbers 3 and 5 are on the upper corner. The closer the form of two numbers are, the closer they are
located on the map. It results from the topological organization of the SOM.

Concerning the testing phase (classification of new input samples), it gives an error rate of 29% after 10000 iterations of the learning phase. This result is quite high but can be improved after tuning some parameters. For instance, I change the standard deviation of the Gaussian function which is used as neighborhood function (this parameter is called effective width). The effective width defines the influence of the winner neuron on its neighboors in the lattice. If the effective width is smaller, the winner neuron has less influence on the neurons around him. So the weights of the neighboors change less and give more accurate results. By reducing the effective width by a factor 4, I got an error rate of 22%.

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
