#! /bin/bash

# module load anacondapy/5.3.1

# 1. Edit wherever the dicoms get transferred on the scanner
scanner_dir=/home/banana/pygers_workshop/sample_data/dcm
#scanner_dir=/jukebox/dicom/conquest/Prisma-MSTZ400D/NormaL/2020 #Prisma
#scanner_dir=/jukebox/norman/pygers/conquest #Sample project data

# 2. Edit where your project directory is
project_dir=/home/banana/pygers_workshop/sample_study

data_dir=$project_dir/data
bids_dir=$data_dir/bids
raw_dir=$data_dir/dicom #this is where I want the data from conquest to be copied into my study directory 
defaced_dir=$bids_dir/derivatives/deface #this is where defaced images will end up
scripts_dir=$project_dir/code/preprocessing #directory with my preprocessing scripts, including this one
