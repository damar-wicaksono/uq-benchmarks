%% Composite Gaussian Plot

%% Specify the limit state line functions
x2_1 = @(X) 8 - X.^2; % first limit state line
x2_2 = @(X) 6 - X/5;  % second limit state line

%% Specify the composite Gaussians function
compositeGaussians = @(X,Y) cat(3, X.^2 + Y - 8, X./5 + Y - 6);

% Input mesh
[X,Y] = meshgrid(-2:0.25:10, -2:0.25:10);

% Evaluate the function
Z = compositeGaussians(X,Y);
newZ = zeros(size(X));

% Find the maximum of over all pages
[nRows, nCols, nPages] = size(Z);
for i = 1:nRows
    b = squeeze(Z(i,:,:))';
    b = max(b);
    newZ(i,:) = b;
end

%% Evaluate the limit state function
X1 = linspace(-2, 10, 100);
Y1 = x2_1(X1);
Y2 = x2_2(X1);

% Get the intersection between two limit states
[xInt,yInt] = polyxpoly(X1,Y1,X1,Y2);

% Get the intersection between base line (y = 0) and the first limit state
[xInt2,yInt2] = polyxpoly(X1,Y1,X1,zeros(size(X1,2),1));

%% Create limit state components plot
x0 = -2;
y0 = 0;
width = 300;
height = 300;
set(gcf,'position',[x0,y0,width,height])

plot(X1, Y1, 'b')
hold on
plot(X1, Y2, 'r')

%% Create the intersection for shaded area
X3_1 = linspace(-2, xInt(1), 10);
X3_2 = linspace(xInt(1), xInt(2), 10);
X3_3 = linspace(xInt(2), xInt2, 10);
Y3 = [zeros(size(X3_1,2),1)' zeros(size(X3_2,2),1)' zeros(size(X3_3,2),1)'];
Y4 = [x2_1(X3_1) x2_2(X3_2) x2_1(X3_3)];

%% Create the shaded area
X4 = [X3_1 X3_2 X3_3];
X4 = [X4 fliplr(X4)];
inBetween = [Y3 fliplr(Y4)];
fill(X4, inBetween, [211/255 211/255 211/255])
hold off

% Set axis limits, labels, and legend
xlim([-2 10])
ylim([0 10])
xlabel('x_1')
ylabel('x_2')
legend('g_1 = 0', 'g_2 = 0')

% Save the plot
saveas(gcf, 'compositeGaussiansFailureDomain.png')

%% Create surface plot
x0 = 10;
y0 = 10;
width = 300;
height = 300;
set(gcf, 'position', [x0 y0 width height])

hSurf = surf(X, Y, newZ);
xlabel('x_1')
ylabel('x_2')
zlabel('g(x_1, x_2)')
view(-45, 50)

saveas(gcf,'compositeGaussiansSurface.png')

%% Create contour plot
x0 = 10;
y0 = 10;
width = 300;
height = 300;
set(gcf, 'position', [x0 y0 width height])

contour(X, Y, newZ, -3:3, 'ShowText', 'on')
hold on
contour(X, Y, newZ, [0,0], 'Color', 'k', 'LineWidth', 3, 'ShowText', 'on')
hold off
xlabel('x_1')
ylabel('x_2')

saveas(gcf,'compositeGaussiansContour.png')