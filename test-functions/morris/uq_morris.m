function Y = uq_morris(X,P)
% UQ_MORRIS computes the Morris test function.
%
%   Y = UQ_MORRIS(X) evaluates the Morris test function for N-by-20 input
%   matrix X, where N is the number of evaluation points with the
%   univariate constituent functions and the coefficients of the function 
%   following Blatman and Sudret (2010). The function returns a column
%   vector of length N.
%
%   Y = UQ_MORRIS(X,P) evaluates the Morris test function with another
%   definitions of the univariate constituent functions and
%   the coefficients specified in the string P:
%      'Morris' : Definitions by Morris (1991)
%      'Sudret' : Definitions by Blatman and Sudret (2010)
%      'Lamboni': Definitions by Lamboni et al. (2013)
%
%   References:
%
%   - Morris, M. D. (1991). Factorial sampling plans for preliminary
%     computational experiments. Technometrics, vol. 33, pp. 161-174. 
%     DOI:10.1080/00401706.1991.10484804
%   - Blatman, G. and B. Sudret. (2010). Efficient computation of global
%     sensitivity indices using sparse polynomial chaos expansions. 
%     Reliability Engineering & System Safety, vol. 95, pp. 1216-1229. 
%     DOI:10.1016/j.ress.2010.06.015
%   - Lamboni, M., B. Iooss, A.-L. Popelin, and F. Gamboa. (2013). 
%     Derivative-based global sensitivity measures: General links with
%     Sobol' indices and numerical tests. Mathematics and Computers
%     in Simulation, vol. 87, pp. 45-54. DOI:10.1016/j.matcom.2013.02.002
%

%% Check inputs
%
narginchk(1,2)
assert(size(X,2) == 20, 'Exactly 20 input variables are needed!')
if nargin == 2
    if ~any(strcmpi({'Lamboni', 'Morris', 'Sudret'}, P))
        error(['Definitions of ',...
            'coefficients and univariate functions not supported!'])
    end

%% Define constants
%
[N,~] = size(X);

% Retrieve which model we are using
if nargin == 2
    if strcmpi('Lamboni',P)
        omega_morris = false;
        beta_morris = true;
    elseif strcmpi('Morris',P)
        omega_morris = true;
        beta_morris = true;
    else
       omega_morris = true;
       beta_morris = false;
    end
else
    omega_morris = true;
    beta_morris = false;
end

%% Define constants
b0 = 0;   % Zeroth-order coefficient
b1 = 20;  % First-order coefficients for i = 1:10
b2 = -15; % Second-order coefficients for i,j = 1:6
b3 = -10; % Third-order coefficients for i,j,l = 1:5
b4 = 5;   % Fourth-order coefficients for i,j,l,s = 1:4

%% Compute univariate constituent functions
%
idx2 = [3 5 7];
idx1 = setdiff(1:20,idx2);
W(:,idx1) = 2 * (X(:,idx1)-0.5);
if omega_morris
    W(:,idx2) =  2 * (1.1*X(:,idx2)./(X(:,idx2)+0.1) - 0.5);
else
    W(:,idx2) =  2 * (1.1*X(:,idx2)./(X(:,idx2)+1) - 0.5);
end

%% Compute the Morris function
%
% Add constant term (Initialization)
Y = b0*ones(N,1);

% Add first-order terms
Y = Y + sum(b1*W(:,1:10),2);
if beta_morris
    Y = Y + sum(repmat(randn(1,10), N, 1) .* W(:,11:20), 2);
else
    Y = Y + sum((-1).^(11:20) .* W(:,11:20),2);    
end

% Add second-order terms
for j = 2:6
    Y = Y + sum(b2 * W(:,1:j-1) .* W(:,j),2);
end

if beta_morris
    for j = 7:20
        Y = Y + sum(...
            repmat(randn(1,length(1:j-1)), N, 1).* W(:,1:j-1).* W(:,j), 2);
    end
else
    for j = 7:20
        Y = Y + sum((-1).^((1:j-1)+j).*W(:,1:j-1).*W(:,j),2);
    end
end

% Add third-order terms
for l = 3:5
    for j = 2:l-1
        Y = Y + sum(b3 * W(:,1:j-1) .* W(:,j) .*W(:,l), 2);
    end
end

% Add fourth-order term (the end result)
Y = Y + b4*W(:,1).*W(:,2).*W(:,3).*W(:,4);

end