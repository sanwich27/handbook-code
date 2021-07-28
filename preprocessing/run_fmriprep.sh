#!/bin/bash

source globals.sh

docker run -it --rm 
	-v $project_dir:/project \
	-v $scratch_dir:/scratch \
	nipreps/fmriprep:20.2.3 \	        
	--fs-license-file /project/code/preprocessing/license.txt \
	--participant-label sub-$1 \
	--no-submm-recon \
	--use-syn-sdc --bold2t1w-dof 6 \
	--correct-slice-timing \
	--nthreads 8 --omp-nthreads 8 \
	 --output-spaces T1w fsaverage:den-41k \
	MNI152NLin2009cAsym:res-native MNI152NLin2009cAsym:res-2 \
	--write-graph --work-dir /scratch \
	/project/data/bids /project/data/bids/derivatives participant
 # many usage options
 # SEE HERE: https://fmriprep.readthedocs.io/en/stable/usage.html

 # To only run for a specific task, add -t flag. For example: 
 #  -t study \
 
 # If you have more than 2 T1w images, you may want to run with longitudinal flag: 
 # --longitudinal \

 # To ignore fieldmaps:
 # --ignore fieldmaps

 # To use fieldmap-less distortion correction:
 # --use-syn-sdc
