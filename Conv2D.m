function Conv2D_output = Conv2D(input_img,kernel,bias)
img_size=size(input_img);
size_of_img_size=size(img_size);
kernel_size=size(kernel);
bias_size=size(bias);
output_size=[img_size(1), (img_size(2)-kernel_size(3)+1), (img_size(3)-kernel_size(4)+1), bias_size(1)];
Conv2D_output=zeros(output_size(1),output_size(2));

for img_no=1:output_size(1)
    for channel_no=1:output_size(4)
        for i=round(kernel_size(3)/2):output_size(2)+round(kernel_size(3)/2)-1
            for j=round(kernel_size(4)/2):output_size(3)+round(kernel_size(4)/2)-1
                if size_of_img_size(2)==4
                    temp_sum=zeros(kernel_size(3),kernel_size(4));
                    for ip_channel=1:img_size(4)
                        temp_kernel=reshape(kernel(channel_no,ip_channel,:,:),[kernel_size(3),kernel_size(4)]);
                        
%                         if(i<round(kernel_size(3)/2))
%                             temp_kernel(1:i,:)=0;
%                         end
%                         if(j<round(kernel_size(4)/2))
%                             temp_kernel(:,1:j)=0;
%                         end
%                         if (i>output_size(2))
%                             temp_kernel(i-output_size(2)+round(kernel_size(3)/2):kernel_size(3),:)=0;
%                         end
%                         if (j>output_size(3))
%                             temp_kernel(:,j-output_size(3)+round(kernel_size(4)/2):kernel_size(4))=0;
%                         end
                        
                        temp_sum=temp_sum+reshape(input_img(img_no,i-round(kernel_size(3)/2)+1:i+round(kernel_size(3)/2)-1,j-round(kernel_size(4)/2)+1:j+round(kernel_size(4)/2)-1,ip_channel),[kernel_size(3),kernel_size(4)]).*temp_kernel.';
                    end
                    Conv2D_output(img_no,i-round(kernel_size(3)/2)+1,j-round(kernel_size(4)/2)+1,channel_no)=sum(sum(sum(temp_sum)))+bias(channel_no);
                else
                    temp_kernel=reshape(kernel(channel_no,1,:,:),[kernel_size(3),kernel_size(4)]);
%                     if(i<round(kernel_size(3)/2))
%                         temp_kernel(1:i,:)=0;
%                     end
%                     if(j<round(kernel_size(4)/2))
%                         temp_kernel(:,1:j)=0;
%                     end
%                     if (i>output_size(2))
%                         temp_kernel(i-output_size(2)+round(kernel_size(3)/2):kernel_size(3),:)=0;
%                     end
%                     if (j>output_size(3))
%                         temp_kernel(:,j-output_size(3)+round(kernel_size(4)/2):kernel_size(4))=0;
%                     end
                    Conv2D_output(img_no,i-round(kernel_size(3)/2)+1,j-round(kernel_size(4)/2)+1,channel_no)=bias(channel_no)+sum(sum(sum(reshape(input_img(img_no,i-round(kernel_size(3)/2)+1:i+round(kernel_size(3)/2)-1,j-round(kernel_size(4)/2)+1:j+round(kernel_size(4)/2)-1),[kernel_size(3),kernel_size(4)]).*temp_kernel.')));
                end
            end
        end
    end
end
end