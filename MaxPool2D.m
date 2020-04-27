function Maxpool2D_output = MaxPool2D(input_img,filter_size)
img_size=size(input_img);
output_size=[img_size(1), round(img_size(2)/filter_size(1)),round(img_size(3)/filter_size(2)),img_size(4)];
Maxpool2D_output=zeros(output_size(1),output_size(2),output_size(3),output_size(4));
for img_no=1:output_size(1)
    for channel_no=1:output_size(4)
        for i=1:output_size(2)
            for j=1:output_size(3)
                Maxpool2D_output(img_no,i,j,channel_no)=max(max(input_img(img_no, filter_size(1)*i-filter_size(1)+1:filter_size(1)*i, filter_size(2)*j-filter_size(2)+1:filter_size(2)*j,channel_no)));
            end
        end
    end
end
end
