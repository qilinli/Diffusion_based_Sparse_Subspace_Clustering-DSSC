# Diffusion_based_Sparse_Subspace_Clustering-DSSC

By [Qilin Li](https://scholar.google.com/citations?user=KpqM4F4AAAAJ&hl=en), [Wanquan Liu](https://scholar.google.com.au/citations?user=V_2ImG0AAAAJ&hl=en), [Ling Li](https://scholar.google.com/citations?user=h28-FZgAAAAJ&hl=en)

Curtin University.

### Introduction
This is an matlab implementation of the diffusion based sparse subspace clustering method(DSSC). At the core of DSSC, it is an affinity learning method, whereas the pair-wise similarity is the target. 
DSSC starts with **L1-minimization** to seek a sparse affinity matrix and refines it by **an iterative diffusion process**, resulting a new affinity matrix that can better reveal the underlying manifold structure of the data. The obtained affinity matrix can be used for many tasks, such as clustering, classification, semi-supervised learning, metric learning, etc..


### Usage
There is a demo for the experiment of face images clustering
```matlab
demo_faceImage.m
```

### Citation

If you find the code is useful, please consider to cite:

	@article{li2019semi,
  		title={Semi-supervised Learning on Graph with an Alternating Diffusion Process},
  		author={Li, Qilin and An, Senjian and Li, Ling and Liu, Wanquan},
  		journal={arXiv preprint arXiv:1902.06105},
 		 year={2019}
	}

