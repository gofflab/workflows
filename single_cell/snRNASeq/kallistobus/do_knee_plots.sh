#!/usr/bin/bash

PROJECT_ROOT="/mnt/morbo/Data/Users/jaugustin/Pantr2_snRNASeq"
KALLISTO_DIR="$PROJECT_ROOT/results/kallisto_out"


for sample in `ls $KALLISTO_DIR`
    do
        echo $sample
        echo "Rscript $PROJECT_ROOT/preprocessing/kneePlots.R $KALLISTO_DIR/$sample"
        Rscript $PROJECT_ROOT/preprocessing/kneePlots.R $KALLISTO_DIR/$sample
    done;