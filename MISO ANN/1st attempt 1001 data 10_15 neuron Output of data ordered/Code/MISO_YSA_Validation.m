function [y_model_vali,vali_Error]=MISO_YSA_Validation(X,s,vali_data,y_real_vali)
    syms x1
    [r,n]=size(vali_data);
    h=(exp(x1)-exp(-x1))/(exp(x1)+exp(-x1)); %Activation function

    %wg,bh,wc,bc Calculation
    wg=vpa(zeros(s,r));
    for i=1:r
        wg(:,i)=X(s*i-(s-1):s*i);
    end
    bh=X(s*r+1:s*r+s);
    wc=(X(s*(r+1)+1:s*(r+2))).';
    bc=X(s*(r+2)+1);
    %------------------------------

    %y_model Calculation
    y_model_vali=zeros(size(vali_data,1),1);
    for i=1:n
        y_model_vali(i)=wc*subs(h,x1,wg*vali_data(:,i)+bh)+bc;
    end
    %------------------------------
    
    vali_Error=norm(y_model_vali-y_real_vali);
    fprintf('\n<MISO_ANN_Validation> Validation Data Eror is %f\n',vali_Error);
%     figure(2);
%     plot(vali_data,y_real_vali,'-*');
%     hold on
%     plot(vali_data,y_model_vali,'-o');
%     grid on
%     title('Validation Data Graph');
%     xlabel('Input');
%     ylabel('Output');
%     legend('Real Output of VAlidation Data','Model Output of Validation Data')
end