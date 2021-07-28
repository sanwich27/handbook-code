#!/bin/bash

source globals.sh

#singularity run --cleanenv \
#    --bind $bids_dir:/home \
#    /jukebox/hasson/singularity/mriqc/mriqc-v0.10.4.sqsh \
#    --correct-slice-timing --modalities T1w bold \
#    --no-sub \
#    --nprocs 8 -w /home/derivatives/work \
#    /home /home/derivatives/mriqc group
docker run -it --rm -v $bids_dir:/bids:ro -v $scratch_dir:/scratch \
	poldracklab/mriqc:latest \
	--modalities T1w bold  \
	--correct-slice-timing --no-sub \
	--nprocs 8 -w /scratch \
	/bids /bids/derivatives/mriqc group
