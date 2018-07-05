function [WW]=IterativeDiffusionTPGKNN(W,K)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% This code is an implementation of the diffusion process in the paper:
%%% "Affinity Learning via a Diffusion Process for Subspace Clustering"
%%% By QILIN LI (li.qilin@postgrad.curtin.edu.au)
%%% Last Update 05/07/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Pre-processing of affinity matrix W
d = sum(W, 2);
D = diag(d + eps);
W = W - diag(diag(W)) + D; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Normalization  %%%%%%%%%%%%%%%%%%
% W = W ./ repmat(sum(W, 2)+eps, 1, n);

d = sum(W,2);
D = diag(d + eps);
W = D^(-1/2)*W*D^(-1/2);      %%% Symmetric normalization is better
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S = knnSparse(W, K);          %%% Sparse is important for affinity matrix

WW = S;    
maxIter = 50;
epsilon = 1e-2;        %%% convergence threshold
for t = 1:maxIter
    temp = S*WW*S' + eye(length(WW));
    if norm(temp-WW,'fro') < epsilon, break; end  
    WW = temp;   
end
WW = knnSparse(WW, K);