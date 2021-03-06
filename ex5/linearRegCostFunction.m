function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

hx = X * theta;

%%The cost without regularization
J_partial = sum((hx - y).^2) / (2 * m);


%%Regularized Cost Added
J_regularization = (lambda/(2*m)) * sum(theta(2:end).^2);

%%Cost when we add regularization
J = J_partial + J_regularization;

%Grad without regularization
grad_partial = (1/m) * (X' * (hx -y));

%%Grad Regularized Cost Added
grad_regularization = (lambda/m) .* theta(2:end);

grad_regularization = [0; grad_regularization];

grad = grad_partial + grad_regularization;











% =========================================================================

grad = grad(:);

end
