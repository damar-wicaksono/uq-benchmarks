function    Y   =   uq_TenBarTruss_response(XX)
% Simple Finite Elements truss structure response calculation

% get the model: it will create variable "fem_model"
fem_model = uq_TenBarTruss_model;
n = size(XX,1);
Y = zeros(n,1);

% non vectorized FEM evaluation
for ii = 1:n
    X = XX(ii,:);
    for jj = 1:10
        fem_model.MATS{jj}.Amean = X(jj) ;
    end
    
    U = myfem(fem_model) ;
    
    Y(ii,1) = -U(4) ;
end


