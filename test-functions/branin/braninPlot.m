%% Specify the Branin function
branin = @(X,Y,C) C(1) * (Y - C(2) * X.^2 + C(3) * X - C(4)).^2 + C(5) * (1 - C(6)) * cos(X) + C(5);

% Constants
C = [1 5.1/(2*pi)^2 5/pi 6 10 1/(8*pi)];

% Input mesh
[X, Y] = meshgrid(-5:0.5:10, 0:0.5:15);

%% Evaluate the function
Z = branin(X,Y,C);

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

saveas(gcf, 'braninSurface.png')

%% Create contour plot
x0 = 10;
y0 = 10;
width = 256;
height = 256;
set(gcf,'position',[x0,y0,width,height])

contour(X,Y,Z,30)
xlabel('x_1')
ylabel('x_2')

saveas(gcf, 'braninContour.png')
