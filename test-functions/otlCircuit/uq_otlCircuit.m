function Vm = uq_otlCircuit(X)
% UQ_OTLCIRCUIT evaluates the OTL Circuit test function.
%
%   Vm = UQ_OTLCIRCUIT(X) computes the mid-point voltage of an output
%   transformerless (OTL) push-pull circuit using input X:
%      X(:,1): Rb1, resistance b1 (kOhm)
%      X(:,2): Rb2, resistance b2 (kOhm)
%      X(:,3): Rf, resistance f (kOhm)
%      X(:,4): Rc1, resistance c1 (kOhm)
%      X(:,5): Rc2, resistance c2 (kOhm)
%      X(:,6): beta, current gain (A)
%
%   Reference:
%
%   - E. N. Ben-Ari and D. M. Steinberg, "Modeling Data from Computer
%     Experiments: An Empirical Comparison of Kriging with MARS and
%     Projection Pursuit Regression," Quality Engineering, vol. 19,
%     pp. 327--338, 2007. DOI:10.1080/08982110701580930
%

%% Check input
narginchk(1,1)

assert(size(X,2) == 6, 'Exactly six input variables are needed')

%% Get input
Rb1 = X(:,1);
Rb2 = X(:,2);
Rf = X(:,3);
Rc1 = X(:,4);
Rc2 = X(:,5);
beta = X(:,6);

%% Compute output

Vb1 = 12 * Rb2./(Rb1+Rb2);

% Midpoint voltage
Vm  = ((Vb1+0.74) .* beta .* (Rc2+9)) ./ (beta .* (Rc2+9) + Rf) + ...
    11.35 * Rf ./ (beta .* (Rc2+9) + Rf) + ...
    0.74 * Rf .* beta .* (Rc2+9) ./ ((beta .* (Rc2+9) + Rf) .* Rc1);

end