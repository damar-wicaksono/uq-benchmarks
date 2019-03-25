function Y= uq_ShortColumn(X, P)
%%
% Y = UQ_SHORTCOLUMN(X) models a short column with a rectangular cross
% section (width b and depth h)having uncertain material properties and
% subject to uncertain loads (bending moment M and axial force P).
% The limit state function is described by 3 variables given in 
% X = [Y_C, M_C, P_C] for a beam with width b=5mm and depth h=15mm.
% The input variables represent:
%  Y_C 	-	yield stress (...)
%  M_C 	-	bending moment (...)
%  P_C 	-	axial force (...)
%
% Y = UQ_SHORT COLUMN(X,P) allows to manually specify the
% deterministic values of b and h in the vector P = [b, h];
%
% For more info, see: http://www.sfu.ca/~ssurjano/shortcol.html

Y_C = X(:, 1);
M_C = X(:, 2);
P_C = X(:, 3);

%%
% Check for user defined width and depth
if nargin > 1
    b = P(1);
    h = P(2);
else
    b = 5;
    h = 15;
end


%%
% Limit State function precalculations
Y_Term1 = (4*M_C)./(b.*h.^2*Y_C);
Y_Term2 = (P_C./(b.*h.*Y_C)).^2;

%%
% Limit State function
Y = 1-Y_Term1-Y_Term2;
