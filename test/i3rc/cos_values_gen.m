format free
x = 0:0.0002:pi/2;
y=cos(x);
size(y)
dlmwrite("cossenos.csv", y, ",","precision",12)
