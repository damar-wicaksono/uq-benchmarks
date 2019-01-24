%% Specify the Rosenbrock function
rosenbrock = @(X,Y) (100 * (Y - X.^2).^2 + (X - 1).^2);

% Input mesh
[X, Y] = meshgrid(-10:0.5:10, -10:0.5:10);

%% Evaluate the function
Z = rosenbrock(X,Y);

%% Create surface plot
x0 = 10;
y0 = 10;
width = 400;
height = 400;
set(gcf,'position',[x0, y0, width, height])

surf(X,Y,Z)
xlabel('x_1')
ylabel('x_2')
zlabel('f(x_1, x_2)')

saveas(gcf, 'rosenbrockSurface.png')

%% Create contour plot
x0 = 10;
y0 = 10;
width = 400;
height = 400;
set(gcf,'position',[x0,y0,width,height])

contour(X,Y,Z,1500)
xlabel('x_1')
ylabel('x_2')

saveas(gcf, 'rosenbrockContour.png')
