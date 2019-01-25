%% Specify the four-branch function
four_branch = @(X,Y) cat(3, 3 + 0.1*(X - Y).^2 - (X + Y)/sqrt(2),...
    3 + 0.1*(X - Y).^2 + (X + Y)/sqrt(2),...
    (X - Y) + 6/sqrt(2),...
    (Y - X) + 6/sqrt(2));

% Input mesh
[X, Y] = meshgrid(-6:0.25:6, -6:0.25:6);

%% Evaluate the function
Z = four_branch(X,Y);
newZ = zeros(size(X));

%% Find the minimum of over all pages
[nRows, nCols, nPages] = size(Z);
for i = 1:nRows
    b = squeeze(Z(i,:,:))';
    b = min(b);
    newZ(i,:) = b;
end

%% Create surface plot
x0 = 10;
y0 = 10;
width = 256;
height = 256;
set(gcf,'position',[x0, y0, width, height])

hSurf = surf(X,Y,newZ);
xlabel('x_1')
ylabel('x_2')
zlabel('f(x_1, x_2)')
view(-45, 50)

saveas(gcf, 'fourBranchSurface.png')

%% Create contour plot
x0 = 10;
y0 = 10;
width = 256;
height = 256;
set(gcf,'position',[x0, y0, width, height])

contour(X, Y, newZ, -5:3, 'Color', 'k')
hold on
contour(X, Y, newZ, [0,0], 'Color', 'k', 'LineWidth', 3, 'ShowText', 'on')
hold off
xlabel('x_1')
ylabel('x_2')

saveas(gcf, 'fourBranchContour.png')