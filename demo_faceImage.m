%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% This code is a demo for the experiments in the paper:
%%% "Affinity Learning via a Diffusion Process for Subspace Clustering"
%%% Note that the results might be slightly different from those in paper
%%% as no parameter tuning is done here.
%%% By QILIN LI (li.qilin@postgrad.curtin.edu.au)
%%% Last Update 05/07/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clc;
clear;

load('data/face_data.mat');
addpath('L1_ADMM\');
addpath('util\');

%%% Hyperparameters to be set
affine = 0;
alpha = 20;
k = 10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% 3 test cases of face images
for i = 1:3
    %%% Data processing
    X = faceImages{i,1};
    Y = faceImages{i,2};
    dataSetName = faceImages{i,3};
    X = NormalizeFea(X, 1);    %%% Normalization
    data_num = size(X, 1);
    class_num = length(unique(Y));
    
    %%% Affinity learning
    disp("Affinity learning...");
    [W_G,~] = adaptiveGaussian(X, k);  %%% adaptive Gaussian affinity matrix
    CMat = admmOutlier_mat_func(X', affine, alpha);
    C = CMat(1:data_num,:);  
    W_SSC = abs(C) + abs(C');   %%% L1 affinity matrix
    
    W_TPG = IterativeDiffusionTPGKNN(W_G, k);
    W_DSSC = IterativeDiffusionTPGKNN(W_SSC, k);
    
    %%% Spectral clustering
    disp("Spectral clustering...");
    Y_G = SpectralClustering(W_G, class_num);
    Y_TPG = SpectralClustering(W_TPG, class_num);
    Y_SSC = SpectralClustering(W_SSC, class_num);
    Y_DSSC = SpectralClustering(W_DSSC, class_num);
    
    %%% Check accuracy
    acc_G = clusteringAcc(Y_G, Y);
    acc_TPG = clusteringAcc(Y_TPG, Y);
    acc_SSC = clusteringAcc(Y_SSC, Y);
    acc_DSSC = clusteringAcc(Y_DSSC, Y);
    fprintf("===Face-%s, the performance is:", dataSetName);
    fprintf("Gaussian(%.2f), TPG(%.2f), SSC(%.2f), DSSC(%.2f)===\n",...
         acc_G, acc_TPG, acc_SSC, acc_DSSC);
end
    