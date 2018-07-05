function [W,W_knn]=adaptiveGaussian(data,K)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% This code is an implementation of adaptive Gaussian affinity used in:
%%% "Affinity Learning via a Diffusion Process for Subspace Clustering"
%%% Note that the self-affinity is defined, and it's not simply 0 or 1
%%% By QILIN LI (li.qilin@postgrad.curtin.edu.au)
%%% Last Update 05/07/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


n = size(data, 1);
D = EuDist2(data);
D = D - diag(diag(D));   %%% Zero distance to itself
[T, idx] = sort(D, 2);

W = zeros(n,n);
for i = 1:n
    for j = 1:n
        sigma = mean([T(i,2:K+1), T(j,2:K+1)]);
        W(i,j) = normpdf(D(i,j), 0, 0.35*sigma);
    end
end
W = (W+W')/2;

P = zeros(n, n);
for i = 1:n
    P(i, idx(i,1:K+1)) = 1;
end

W_knn = W.*P;
W_knn = (W_knn+W_knn')/2;


