function digits=main(img,kernel_1,bias_1,kernel_2,bias_2,kernel_3,bias_3,kernel_4,bias_4)
x=Conv2D(img,kernel_1,bias_1);
x(x<0)=0;
x=Conv2D(x,kernel_2,bias_2);
x(x<0)=0;
x=MaxPool2D(x,[2,2]);
x=Flatten(x);
x_size=size(x);
req_size=size(bias_3);
x1=zeros(x_size(1),req_size(1));
for i=1:x_size(1)
    x1(i,:)=x(i,:)*kernel_3.'+bias_3.';
end
x1(x1<0)=0;
x1_size=size(x1);
req_size=size(bias_4);
x2=zeros(x1_size(1),req_size(1));
for i=1:x1_size(1)
    x2(i,:)=x1(i,:)*kernel_4.'+bias_4.';
end
x2=Softmax(x2);
[argvalue,argmax]=max(x2.');
digits=argmax-1;
display=['The digits are: ', num2str(digits)];
disp(display);
end
