conv2d_1_kernel=h5read('model_digit.h5', '/conv2d_1/conv2d_1/kernel:0');
conv2d_1_bias=h5read('model_digit.h5', '/conv2d_1/conv2d_1/bias:0');
X_test=readNPY('input_data1.npy');
output=Conv2D_temp(reshape(X_test(1,:,:),[1,28*28]),reshape(conv2d_1_kernel,[1,32*3*3]),reshape(conv2d_1_bias,[1,32]));
% X=[[1,2,3.3,1.2],[4,5,6.6,5.7]];
% Y=[[3,2,1.2,2.4],[5,6,4.5,6.4]];
%output= trial1(reshape(X_test(1,:,:),[1,28*28]));