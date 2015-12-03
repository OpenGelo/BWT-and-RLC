clc; clear;
kakak=textread('datauji.txt', '%s','bufsize',10000, 'whitespace', '');
%kata = 'ammnnb$aaaa';
kata=kakak{1,1};
ayam=double(kata);
ga=length(ayam);
%ngambil 1000 character awal
% for i=1:1000
if ga < 1000
    for i=1:ga
    seribukata(i)=ayam(i);
    datain(i)=kata(i);
end
else
    for i=1:1000
    seribukata(i)=ayam(i);
    datain(i)=kata(i);
    end
end
%menghitung jumlah kata persimbol
t=length(seribukata);  
for i=1:255
    z=0;
    for j=1:t
        if seribukata(j) == i
            z=z+1;
            jumlah(i)=z;
        end
    end
end

%mengambil simbol
f=length(jumlah);
k=1;
for i=1:f
    if jumlah(i)~=0
        datainput(k)=char(i);
        jumlahdata(k)=jumlah(i);
        k=k+1;
    end
end

a=length(datain);
dataori=mat2str(datain);
b=1;
for i=1:a
    temp=datain(a);
    for j=a:-1:2
        datain(j)=datain(j-1);
    end
    datain(1)=temp;
    datak=mat2str(datain);
    for k=1:a
%         data(b,k)={datain(k)};
data(b)={datak};
    end
    b=b+1;
end
% for i=a:-1:1
%     datasort=sortrows(data,i);
% end
datasort=sort(data);
for i=1:a
   if datasort{i}==dataori
       databenar=i;
   end
apa=datasort{i};
anu(i)=apa(a+1);
end

%RLE
m=1;
z=1;
itu=double(anu);
itu=[itu '$'];
for i=1:a
    if itu(i)==itu(i+1)
        z=z+1;
    elseif itu(i)~=itu(i+1)
        huruf(m)=char(itu(i));
        angka(m)=z;
        m=m+1;
        z=1;
    end
end
de=length(angka);
RLE=[];
for i=1:de
    RLE=[RLE num2str(angka(i)) huruf(i)];
end

%tampilan
display(['hasilnya adalah ',anu,',',num2str(databenar)]);
display(['hasil RLE= ',RLE]);