clear;
clc;
load('OD.mat')
data=zeros(50,12);         %%����һ���յľ����������·��
l=1;                      %%��ʼ��l������l=(1,2,...,5)
while(l<50)                %%ѭ��ÿһ��������·
v=[1,1,0,0,0,0,0,0,0,0,0,0];
h=2;
while(h<12)              %%�жϵ�ǰ·���Ƿ��Ѿ���������
for i=2:51               %%Ѱ�ҵ�ǰ·��ÿһ��δ���ʹ��ľƵ�Ĳ����
    if any(i==data)==0
    if any(i==v)==0 
        for j=2:h
                if j<h;
                    d(i,j)=A(v(j-1),i)+A(i,v(j+1))-A(v(j-1),v(j+1));
                else
                    d(i,j)=A(v(j-1),i)+A(i,1)-A(v(j-1),1);
                end
        end
    else
         d(i,:)=0;
    end
    else
        d(i,:)=0;
    end
end
d(find(d==0))=inf;           
[c1,col]=min(d')      %%����ÿ��δ���ʵ����ŵĲ���λ�ã���c1
z=v();
c2=3*A(1,:)-c1;       %%����ͨ����·����ֱ�ӷ���������ʡ��·�̣���c2,
[c3,row]=max(c2)      %%�������c2��Ӧ�ĵ�
col=col(row); 
if c3<0               %%��Ҫ�жϸ����ֵ�Ƿ����0��С��0���ǲ����еģ���Ҫ���¿�ʼ�µ�·��
   h=h+1;
else                 %%����õ���У��Ͳ��뵽��Ӧ��λ��
v(1,1:col-1)=z(1,1:col-1);
v(1,col+1:h+1)=z(1,col:h);
v(1,col)=row;
clear d;
end
h=h+1;
end
data(l,:)=v;        %%������·���洢��������ȥ
l=l+1;
end
for i=1:5           %%����·�����ܳ���
    for j=1:11
        dis(i,j)=A(data(i,j),data(i,j+1));
    end
end
distance=sum(sum(dis))
data=data-1


