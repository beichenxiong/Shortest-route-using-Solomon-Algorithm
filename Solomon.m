clear;
clc;
load('OD.mat')
data=zeros(50,12);         %%创建一个空的矩阵用来存放路线
l=1;                      %%初始第l辆车，l=(1,2,...,5)
while(l<50)                %%循环每一辆车的线路
v=[1,1,0,0,0,0,0,0,0,0,0,0];
h=2;
while(h<12)              %%判断当前路径是否已经超过负载
for i=2:51               %%寻找当前路径每一个未访问过的酒店的插入点
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
[c1,col]=min(d')      %%计算每个未访问点最优的插入位置，即c1
z=v();
c2=3*A(1,:)-c1;       %%计算通过该路线与直接访问这个点节省的路程，即c2,
[c3,row]=max(c2)      %%求得最大的c2对应的点
col=col(row); 
if c3<0               %%需要判断该最大值是否大于0，小于0就是不可行的，需要重新开始新的路径
   h=h+1;
else                 %%如果该点可行，就插入到相应的位置
v(1,1:col-1)=z(1,1:col-1);
v(1,col+1:h+1)=z(1,col:h);
v(1,col)=row;
clear d;
end
h=h+1;
end
data(l,:)=v;        %%将该条路径存储到数组中去
l=l+1;
end
for i=1:5           %%计算路径的总长度
    for j=1:11
        dis(i,j)=A(data(i,j),data(i,j+1));
    end
end
distance=sum(sum(dis))
data=data-1


