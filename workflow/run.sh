#!/bin/bash

# Create necessary directories if they do not exist
mkdir -p /media/EXOMEDATA/student_projects/blokadniki/pipline_run/logs
mkdir -p /media/EXOMEDATA/student_projects/blokadniki/pipline_run/results
mkdir -p /media/EXOMEDATA/student_projects/blokadniki/pipline_run/aligned_reads

# Run Snakemake with the specified config file in dry-run mode
snakemake \
    --dryrun \
    --configfile ../config/config.yaml