clc;clear;close;
i=1;

[t,y_real,vali_data,y_real_vali]=data('input.mat','output.mat');
[~,n]=size(t);
[~,p]=size(vali_data);

k_max=50; %Maximum iteration number for MISO
MSE=10^-1; %Minimum MSE Error
norm_G=10^-3;
min_s=10;
max_s=11;

y_m_value_all=zeros(n,max_s-min_s+1);
MSE_all=zeros(max_s-min_s+1,1);
y_model_vali_all=zeros(max_s-min_s+1,p);
vali_Error_all=zeros(max_s-min_s+1,1);

for s=min_s:1:max_s
    [X,y_m_value,f_new]=MISO_ANN_train(s,t,y_real,k_max,MSE,norm_G);
    y_m_value_all(:,i)=y_m_value;
    MSE_all(i)=f_new;
    [y_model_vali,vali_Error]=MISO_YSA_Validation(X,s,vali_data,y_real_vali);
    y_model_vali_all(i,:)=y_model_vali;
    vali_Error_all(i)=vali_Error;
    i=i+1;
end
figure(1);
subplot(2,1,1);
plot(min_s:1:max_s,vali_Error_all,'o-');
grid on
title('Validation Error - Number of Neurons Graph');
xlabel('Number of Neurons');
ylabel('Validation Error Value');
legend('Validation Error')

subplot(2,1,2);
plot(min_s:1:max_s,MSE_all,'o-');
grid on
title('Training Error - Number of Neurons Graph');
xlabel('Number of Neurons');
ylabel('Training Error Value');
legend('Training Error')


figure(2);
wanted_neuron_number=11;
subplot(2,1,1);
plot(t,y_real,'-*');
hold on
plot(t,y_m_value_all(:,(wanted_neuron_number-min_s+1)),'-o');
grid on
title('Train Data Graph');
xlabel('Input');
ylabel('Output');
legend('Real Output of Training Data','Model Output of Train Data')
subplot(2,1,2);
plot(vali_data,y_real_vali,'-*');
hold on
plot(vali_data,y_model_vali_all((wanted_neuron_number-min_s+1),:),'-o');
grid on
title('Validation Data Graph');
xlabel('Input');
ylabel('Output');
legend('Real Output of VAlidation Data','Model Output of Validation Data')














