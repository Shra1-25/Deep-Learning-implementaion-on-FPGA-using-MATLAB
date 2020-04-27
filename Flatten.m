function flat2d_output=Flatten(input)
input_size=size(input);
output_size=input_size(2)*input_size(3)*input_size(4);
flat2d_output=zeros(input_size(1),output_size);

for input_no=1:input_size(1)
    k=0;
    for i=1:input_size(2)
        for j=1:input_size(3)
            flat2d_output(input_no,k*input_size(4)+1:(k+1)*input_size(4))=reshape(input(input_no,i,j,:),[1,input_size(4)]);
            k=k+1;
        end
    end
end
end
