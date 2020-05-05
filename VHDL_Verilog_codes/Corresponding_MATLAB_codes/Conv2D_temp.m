function Conv2D_output = Conv2D_temp(X,K,B)
%img_size=size(input_img);
%size_of_img_size=size(img_size);
%kernel_size=size(kernel);
%bias_size=size(bias);
%input_img=zeros([1,28,28]);
%kernel=zeros([32,1,3,3]);
%bias=zeros([32,1]);
input_img=reshape(X,[1,28,28]);
kernel=reshape(K,[32,1,3,3]);
bias=reshape(B,[32,1]);
img_size=[1,28,28];
%size_of_img_size=[1,3];
kernel_size=[32,1,3,3];
bias_size=[32,1];
output_size=[img_size(1), (img_size(2)-kernel_size(3)+1), (img_size(3)-kernel_size(4)+1), bias_size(1)];
step1=zeros(output_size(1),output_size(2),output_size(3),output_size(4));
%Conv2D_output=zeros(output_size(1),output_size(2),output_size(3),output_size(4));
%temp_sum=zeros(kernel_size(3),kernel_size(4));
%temp_kernel=zeros([kernel_size(3),kernel_size(4)]);

for img_no=1:1
    for channel_no=1:32
        for i=2:27
            for j=2:27
                    temp_kernel=reshape(kernel(channel_no,1,:,:),[3,3]);
                    temp1=input_img(img_no,i-1:i+1,j-1:j+1);
                    temp_input_img=reshape(temp1,[3,3]);
                    temp2=temp_input_img.*temp_kernel.';
                    temp_sum=sum(sum(sum(temp2)));
                    step1(img_no,i-1,j-1,channel_no)=bias(channel_no)+temp_sum;
              
            end
        end
    end
end
Conv2D_output=reshape(step1,[1,21632]);
%Conv2D_output=temp_sum;%reshape(temp2,[1,9]);
 for i = 1:9%21632
     if Conv2D_output(1,i)<0
         Conv2D_output(1,i)=0;
     end
 end
end