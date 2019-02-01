%% Specify the Exp-Tanh function
exp_tanh = @(X,Y) exp(-X) .* tanh(5*Y);

% Input mesh
[X, Y] = meshgrid(-1:0.05:1, -1:0.05:1);

%% Evaluate the function
Z = exp_tanh(X,Y);

%% Create surface plot
x0 = 10;
y0 = 10;
width = 256;
height = 256;
set(gcf,'position',[x0, y0, width, height])

surf(X,Y,Z)
xlabel('x_1')
ylabel('x_2')
zlabel('f(x_1, x_2)')

saveas(gcf, 'expTanhSurface.png')

%% Create contour plot
x0 = 10;
y0 = 10;
width = 256;
height = 256;
set(gcf,'position',[x0,y0,width,height])

contour(X,Y,Z,20)
xlabel('x_1')
ylabel('x_2')

saveas(gcf, 'expTanhContour.png')
