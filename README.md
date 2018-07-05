# Diffusion_based_Sparse_Subspace_Clustering-DSSC

By [Qilin Li](https://scholar.google.com/citations?user=KpqM4F4AAAAJ&hl=en)

Curtin University.

### Introduction
This is an matlab implementation of the diffusion based sparse subspace clustering method(DSSC). At the core of DSSC, it is an affinity learning method, whereas the pair-wise similarity is the target. 
DSSC starts with **L1-minimization** to seek a sparse affinity matrix and refines it by **an iterative diffusion process**, resulting a new affinity matrix that can better reveal the underlying manifold structure of the data. The obtained affinity matrix can be used for many tasks, such as clustering, classification, semi-supervised learning, metric learning, etc..


### Usage
Just run
'''matlab
demo_faceImage.m
'''

### Citation

If you find the code is useful, please consider to cite:

	@article{He2015,
		author = {Qilin Li and Wanquan Liu and Ling Li},
		title = {Affinity Learning via a Diffusion Process for Subspace Clustering},
		journal = {Pattern Recognition},
		year = {2018}
	}

