function[t,y_real,vali_data,y_real_vali]=data(input,output)
    load(input);
    load(output);
    output=output*200;
    
    m=[input;output];
    b=size(m,2);
    for s2=1:b
        for s1=1:b-1
            if m(2,s1)>m(2,s1+1)
                c=m(2,s1);
                d=m(1,s1);
                m(2,s1)=m(2,s1+1);
                m(1,s1)=m(1,s1+1);
                m(2,s1+1)=c;
                m(1,s1+1)=d;
            elseif m(2,s1)==m(2,s1+1)
                if m(1,s1)>m(1,s1+1)
                    c=m(2,s1);
                    d=m(1,s1);
                    m(2,s1)=m(2,s1+1);
                    m(1,s1)=m(1,s1+1);
                    m(2,s1+1)=c;
                    m(1,s1+1)=d;
                end
            end
        end
    end
    
    n=size(m,2);
    k=1;
    l=1;
    t=zeros(1,1001);
    y_real=zeros(1001,1);
    for i=1:10:n
        t(k)=m(1,i);
        y_real(k)=m(2,i);
        k=k+1;
    end
    vali_data=zeros(1,1000);
    y_real_vali=zeros(1,1000);
    for i=5:10:n
        vali_data(l)=m(1,i);
        y_real_vali(1,l)=m(2,i);
        l=l+1;
    end
end