%% Specify the high-dimensional example function (M = 2)
highDimensional = @(X,Y,C) (2 - 3 * C * sqrt(2)) - X - Y;

% Input mesh
[X, Y] = meshgrid(-10:1:10, -10:1:10);

%% Evaluate the function
Z = highDimensional(X,Y,0.2);

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
view(-30, 50)

saveas(gcf, 'highDimensionalSurface.png')

%% Create contour plot
x0 = 10;
y0 = 10;
width = 256;
height = 256;
set(gcf,'position',[x0,y0,width,height])

contour(X,Y,Z,[-20:20])
hold on
xlabel('x_1')
ylabel('x_2')
contour(X, Y, Z, [0,0], 'Color', 'k', 'ShowText', 'on')
contour(X, Y, Z, [-15, -10, 10, 15], 'ShowText', 'on')
hold off

saveas(gcf, 'highDimensionalContour.png')
