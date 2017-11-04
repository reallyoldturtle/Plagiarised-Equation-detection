function ocr(imagepath,imagename,nextline)

filepath=strcat(imagepath,imagename);
%reading sample image to be tested
imagein=imread(filepath);
%----------coverting it to grayscale
[rows, columns, numberOfColorBands] = size(imagein);
if numberOfColorBands > 1
	% If it's colour then Converting it to gray scale by taking only the green channel
	imagein = imagein(:, :, 2); % Take green channel.
end
imagein=imresize(imagein,[42 24]);
%-------converting it to binary
imagein=imagein<210;


%----------reading images
a=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\a.bmp');
b=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\b.bmp');
c=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\c.bmp');
d=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\d.bmp');
e=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\e.bmp');
f=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\f.bmp');
g=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\g.bmp');
h=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\h.bmp');
i=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\i.bmp');
j=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\j.bmp');
k=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\k.bmp');
l=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\l.bmp');
m=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\m.bmp');
n=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\n.bmp');
o=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\o.bmp');
p=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\p.bmp');
q=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\q.bmp');
r=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\r.bmp');
s=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\s.bmp');
t=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\t.bmp');
u=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\u.bmp');
v=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\v.bmp');
w=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\w.bmp');
x=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\x.bmp');
y=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\y.bmp');
z=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\z.bmp');
plus=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\plus.bmp');
sub=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\sub.bmp');
div=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\div.bmp');
mul=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\mul.bmp');
eq=imread('C:\Program Files\MATLAB\R2011a\project_pros\letters\eq.bmp');

%--------------------------
%-------making the corr array
corr_string=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','+','-','/','*','='];
corr_array(1)=corr2(a,imagein);
corr_array(2)=corr2(b,imagein);
corr_array(3)=corr2(c,imagein);
corr_array(4)=corr2(d,imagein);
corr_array(5)=corr2(e,imagein);
corr_array(6)=corr2(f,imagein);
corr_array(7)=corr2(g,imagein);
corr_array(8)=corr2(h,imagein);
corr_array(9)=corr2(i,imagein);
corr_array(10)=corr2(j,imagein);
corr_array(11)=corr2(k,imagein);
corr_array(12)=corr2(l,imagein);
corr_array(13)=corr2(m,imagein);
corr_array(14)=corr2(n,imagein);
corr_array(15)=corr2(o,imagein);
corr_array(16)=corr2(p,imagein);
corr_array(17)=corr2(q,imagein);
corr_array(18)=corr2(r,imagein);
corr_array(19)=corr2(s,imagein);
corr_array(20)=corr2(t,imagein);
corr_array(21)=corr2(u,imagein);
corr_array(22)=corr2(v,imagein);
corr_array(23)=corr2(x,imagein);
corr_array(24)=corr2(y,imagein);
corr_array(25)=corr2(y,imagein);
corr_array(26)=corr2(z,imagein);
corr_array(27)=corr2(plus,imagein);
corr_array(28)=corr2(sub,imagein);
corr_array(29)=corr2(div,imagein);
corr_array(30)=corr2(mul,imagein);
corr_array(31)=corr2(eq,imagein);

%-----------getting best correlation
[val idx]=max(corr_array);
%--------displaying the value
fid = fopen('D:\a.txt', 'at');
if(nextline=='f')
    fprintf(fid,'\n');
end
fprintf(fid,'%c',corr_string(idx));
%disp(imagename);
disp(corr_string(idx));
fclose(fid);
end



