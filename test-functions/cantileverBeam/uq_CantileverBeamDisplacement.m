function Y= uq_CantileverBeamDisplacement(X, P)
%%
% Y = UQ_CANTILEVERBEAMDISPLACEMENT(X) return the value of the Displacement
% in a uniform Cantilever Beam with horizontal and vertical
% loads , described by 3 variables given in X = [E, X_L, Y_L] for a beam
% with witdth w = 1, thickness t = 1 and length L = 100;
% The input variables represent:
%  E 	-	Young's modulus of beam material (psi)
%  X_L 	-	horizontal load (lb)
%  Y_L 	-	vertical load (lb)
%
% Y = UQ_CANTILEVERBEAMDISPLACEMENT(X,P) allows to manually specify the
% deterministic values of w, t and L in the vector P = [w, t, L];
%
% For more info, see: http://www.sfu.ca/~ssurjano/canti.html

E = X(:, 1);
X_L = X(:, 2);
Y_L = X(:, 3);

%%
% Check for user defined thickness and width
if nargin > 1
    w = P(1);
    t = P(2);
    L = P(3);
else
    w = 1;
    t = 1;
    L = 100;
end



%%
% Displacement precalculations
Y_Fact1 = (4*L.^3)./(E*w*t);
Y_Fact2 = sqrt((Y_L/t.^2).^2+(X_L/w.^2).^2);

%%
% Displacement
Y = Y_Fact1 .* Y_Fact2;
