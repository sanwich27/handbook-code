#!/bin/bash

source globals.sh

#singularity run --cleanenv \
#	    --bind $bids_dir:/bids \
#	        --bind $scratch_dir:/scratch \
#		    --bind /usr/people \
#		        /jukebox/hasson/singularity/mriqc/mriqc-v0.15.1.simg \
#			    --participant-label $1 \
#			        --correct-slice-timing --no-sub \
#				    --nprocs 8 -w /scratch \
#				        /bids /bids/derivatives/mriqc participant
docker run -it --rm -v $bids_dir:/bids -v $scratch_dir:/scratch \
	poldracklab/mriqc:latest \
	--participant-label $1 \
	--correct-slice-timing --no-sub --verbose\
	--nprocs 8 -w /scratch \
	/bids /bids/derivatives/mriqc participant
