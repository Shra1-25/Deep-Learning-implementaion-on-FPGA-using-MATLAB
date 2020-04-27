# Deep-Learning-implementaion-on-FPGA-using-MATLAB
This repository contains MATLAB code for classifying MNIST digits which can be used to generate simulink model and HDL code for implementation on FPGA. Since HDL code generator cannot generate codes from Neural Network toolbox of MATLAB, I have written this MATLAB scripts using simple MATLAB functions that can be used for HDL code generation using HDL coder.  
Note: The npy-matlab folder has been taken from this website:https://github.com/kwikteam/npy-matlab to load .npy files since the model was trained and data was preprocessed on ipython notebook Training_MNIST_digit.ipynb  
I have provided random 10 samples. You may change X(1,:,:) to X(1:10,:,:) to get outputs of all the 10 samples. Or you may also load more samples by creating them (preprocessing MNIST data) using Training_MNIST_digit.ipynb notebook.  
Run the following commands on command window before running the main.m script:  
>> addpath('npy-matlab');  
>> savepath;   
>>output=main(X_test(1,:,:),conv2d_1_kernel,conv2d_1_bias,conv2d_2_kernel,conv2d_2_bias,dense_1_kernel,dense_1_bias,dense_2_kernel,dense_2_bias);  
