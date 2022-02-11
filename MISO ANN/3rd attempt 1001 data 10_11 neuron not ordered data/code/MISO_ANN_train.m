function [X,y_m_value,f_new]=MISO_ANN_train(s,t,y_real,k_max,MSE,norm_G)
    [r,n]=size(t);

    mu=1; %L_M için mü (Between mü_min and mü_max) 
    mu_scale=10; %L_M için mü scale (Between 0 and 1)
    mu_min=10^-5; %L_M için mü minimum
    mu_max=10^5; %L_M için mü maximum

    X=-1+2*rand(s*(r+2)+1,1); % Weinght Matrix
    syms x [s*(r+2)+1 1];
    h=(exp(x(1))-exp(-x(1)))/(exp(x(1))+exp(-x(1))); %Activation function

    %wg,bh,wc,bc Calculation
    wg=vpa(zeros(s,r));
    for i=1:r
        wg(:,i)=x(s*i-(s-1):s*i);
    end
    bh=x(s*r+1:s*r+s);
    wc=(x(s*(r+1)+1:s*(r+2))).';
    bc=x(s*(r+2)+1);
    %------------------------------

    %Jacobian Calculation
    J=vpa(zeros(size(t,2),s*r+2*s+1));
    for i=1:n
        for j=1:s*r
            o=mod(j-1,s)+1;
            m=fix((j-1)/s)+1;
            h2_value=subs(h,x1,wg(o,:)*t(:,i)+bh(o,1));
            J(i,j)=-(wc(o)*t(m,i)*(1-h2_value^2));
        end
        for j=s*r+1:s*r+s
            h2_value=subs(h,x1,wg(j-s*r,:)*t(:,i)+bh(j-s*r,1));
            J(i,j)=-(wc(j-s*r)*(1-h2_value^2));
        end
        for j=s*r+s+1:s*r+2*s
            J(i,j)=-(subs(h,x1,wg(j-(r+1)*s,:)*t(:,i)+bh(j-(r+1)*s,1)));
        end
        J(i,s*r+2*s+1)=-1;
    end
    %------------------------------

    %y_model Calculation
    y_model=vpa(zeros(size(y_real,1),1));
    for i=1:n
        y_model(i)=wc*subs(h,x1,wg*t(:,i)+bh)+bc;
    end
    %------------------------------
    E=y_real-y_model;
    F=E.'*E;

    k=1;
    loop1=1;
     while loop1
        k=k+1;
        J_value=double(subs(J,x,X));
        E_value=double(subs(E,x,X));
        F_value=double(subs(F,x,X));
        while 1
            pk=-inv((J_value.'*J_value+mu*eye(size(J_value,2))))*J_value.'*E_value;
            zk=X+pk;
            y_model_zk=double(subs(y_model,x,zk));
            E_zk=double(y_real-y_model_zk);
            F_zk=double(E_zk.'*E_zk);
            if F_zk<F_value
                 f_sk=subs(F,x,X+x1.*pk);
                 [sk]=golden_section(f_sk,50,-50,10^-4);
                 X=double(X+sk*pk);
                 mu=mu/mu_scale;
                 break
            else
                mu=mu*mu_scale;
            end
            if mu>mu_max && mu<mu_min
                loop1=0;
                break;
            end
        end

        f_new=double(subs(F,x,X));
        norm_g=norm(sk*pk);

        fprintf('Min. Training Error=%.4f\t',f_new);
        fprintf('Norm_G=%.4f\t',norm_g);
        fprintf('logMSE=%.4f\t',log10(f_new));
        fprintf('ANN # of Iteration=%d\n',k-1);

        if f_new<MSE || norm_g<norm_G || k_max<k
            y_m_value=double(subs(y_model,x,X));
%             figure(1);
%             plot(t,y_real,'-*');
%             hold on
%             plot(t,y_m_value,'-o');
%             grid on
%             title('Train Data Graph');
%             xlabel('Input');
%             ylabel('Output');
%             legend('Real Output of Training Data','Model Output of Train Data')
            loop1=0;
        end
     end
end