function softmax_output=Softmax(x)
input_size=size(x);
softmax_output=zeros(input_size);

for inp_no=1:input_size(1)
    exp_sum=0;
    for i=1:input_size(2)
        softmax_output(inp_no,i)=exp(x(inp_no,i));
        exp_sum=exp_sum+softmax_output(inp_no,i);
    end
    softmax_output(inp_no,:)=softmax_output(inp_no,:)/exp_sum;
    
end
end