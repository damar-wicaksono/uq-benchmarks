%% Modified Rastrigin Function Plots

%% Create input mesh
[X, Y] = meshgrid(-5.12:0.2:5.12, -5.12:0.2:5.12);

%% Evaluate the function
Z = arrayfun(@(x1,x2) uq_modifiedRastrigin([x1,x2]), X, Y);

%% Create surface plot
x0 = 10;
y0 = 10;
width = 256;
height = 256;
set(gcf,'position',[x0, y0, width, height])

hSurf = surf(X, Y, Z);
xlabel('x_1')
ylabel('x_2')
zlim([-40, 20])
zlabel('f(x_1, x_2)')
view(-45, 50)

saveas(gcf, 'modifiedRastriginSurface.png')

%% Create contour plot
x0 = 10;
y0 = 10;
width = 256;
height = 256;
set(gcf,'position',[x0, y0, width, height])

contour(X, Y, Z, -10:10)
hold on
contour(X, Y, Z, [0, 0], 'Color', 'k', 'LineWidth', 2, 'ShowText', 'on')
hold off
xlabel('x_1')
ylabel('x_2')

saveas(gcf, 'modifiedRastriginContour.png')