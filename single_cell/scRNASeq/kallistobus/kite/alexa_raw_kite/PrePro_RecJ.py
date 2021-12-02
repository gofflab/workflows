#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Sep 11 23:18:23 2020

@author: alexaperez-torres
"""
!kb count -i transcriptome.idx -g transcripts_to_genes.txt -x 10xv3 -o output -t 2 \
No_PFA_RT_a_S9_L001_R1_001.fastq.gz\
No_PFA_RT_a_S9_L001_R2_001.fastq.gz\
No_PFA_RT_a_S9_L002_R1_001.fastq.gz\
No_PFA_RT_a_S9_L002_R2_001.fastq.gz\
No_PFA_RT_b_S10_L001_R1_001.fastq.gz\
No_PFA_RT_b_S10_L001_R2_001.fastq.gz\
No_PFA_RT_b_S10_L002_R1_001.fastq.gz\
No_PFA_RT_b_S10_L002_R2_001.fastq.gz\
No_PFA_RT_c_S11_L001_R1_001.fastq.gz\
No_PFA_RT_c_S11_L001_R2_001.fastq.gz\
No_PFA_RT_c_S11_L002_R1_001.fastq.gz\
No_PFA_RT_c_S11_L002_R2_001.fastq.gz\
No_PFA_RT_d_S12_L001_R1_001.fastq.gz\
No_PFA_RT_d_S12_L001_R2_001.fastq.gz\
No_PFA_RT_d_S12_L002_R1_001.fastq.gz\
No_PFA_RT_d_S12_L002_R2_001.fastq.gz

!kb count -i transcriptome.idx -g transcripts_to_genes.txt -x 10xv3 -o output -t 2 \
240U_RecJ_a_S13_L001_R1_001.fastq.gz\
240U_RecJ_a_S13_L001_R2_001.fastq.gz\
240U_RecJ_a_S13_L002_R1_001.fastq.gz\
240U_RecJ_a_S13_L002_R2_001.fastq.gz\
240U_RecJ_b_S14_L001_R1_001.fastq.gz\
240U_RecJ_b_S14_L001_R2_001.fastq.gz\
240U_RecJ_b_S14_L002_R1_001.fastq.gz\
240U_RecJ_b_S14_L002_R2_001.fastq.gz\
240U_RecJ_c_S15_L001_R1_001.fastq.gz\
240U_RecJ_c_S15_L001_R2_001.fastq.gz\
240U_RecJ_c_S15_L002_R1_001.fastq.gz\
240U_RecJ_c_S15_L002_R2_001.fastq.gz\
240U_RecJ_d_S16_L001_R1_001.fastq.gz\
240U_RecJ_d_S16_L001_R2_001.fastq.gz\
240U_RecJ_d_S16_L002_R1_001.fastq.gz\
240U_RecJ_d_S16_L002_R2_001.fastq.gz
    
!kb count -i transcriptome.idx -g transcripts_to_genes.txt -x 10xv3 -o output_mRNA -t 2 \
480U_RecJ_a_S17_L001_R1_001.fastq.gz\
480U_RecJ_a_S17_L001_R2_001.fastq.gz\
480U_RecJ_a_S17_L002_R1_001.fastq.gz\
480U_RecJ_a_S17_L002_R2_001.fastq.gz\
480U_RecJ_b_S18_L001_R1_001.fastq.gz\
480U_RecJ_b_S18_L001_R2_001.fastq.gz\
480U_RecJ_b_S18_L002_R1_001.fastq.gz\
480U_RecJ_b_S18_L002_R2_001.fastq.gz\
480U_RecJ_c_S19_L001_R1_001.fastq.gz\
480U_RecJ_c_S19_L001_R2_001.fastq.gz\
480U_RecJ_c_S19_L002_R1_001.fastq.gz\
480U_RecJ_c_S19_L002_R2_001.fastq.gz\
480U_RecJ_d_S20_L001_R1_001.fastq.gz\
480U_RecJ_d_S20_L001_R2_001.fastq.gz\
480U_RecJ_d_S20_L002_R1_001.fastq.gz\
480U_RecJ_d_S20_L002_R2_001.fastq.gz
    
!kb count -i transcriptome.idx -g transcripts_to_genes.txt -x 10xv3 -o output_mRNA -t 2 \
NoEdU_240U_RecJ_a_S21_L001_R1_001.fastq.gz\
NoEdU_240U_RecJ_a_S21_L001_R2_001.fastq.gz\
NoEdU_240U_RecJ_a_S21_L002_R1_001.fastq.gz\
NoEdU_240U_RecJ_a_S21_L002_R2_001.fastq.gz\
NoEdU_240U_RecJ_b_S22_L001_R1_001.fastq.gz\
NoEdU_240U_RecJ_b_S22_L001_R2_001.fastq.gz\
NoEdU_240U_RecJ_b_S22_L002_R1_001.fastq.gz\
NoEdU_240U_RecJ_b_S22_L002_R2_001.fastq.gz\
NoEdU_240U_RecJ_c_S23_L001_R1_001.fastq.gz\
NoEdU_240U_RecJ_c_S23_L001_R2_001.fastq.gz\
NoEdU_240U_RecJ_c_S23_L002_R1_001.fastq.gz\
NoEdU_240U_RecJ_c_S23_L002_R2_001.fastq.gz\
NoEdU_240U_RecJ_d_S24_L001_R1_001.fastq.gz\
NoEdU_240U_RecJ_d_S24_L001_R2_001.fastq.gz\
NoEdU_240U_RecJ_d_S24_L002_R1_001.fastq.gz\
NoEdU_240U_RecJ_d_S24_L002_R2_001.fastq.gz
    
!kb count -i transcriptome.idx -g transcripts_to_genes.txt -x 10xv3 -o output_mRNA -t 2 \
PFA_Cold_a_S1_L001_R1_001.fastq.gz\
PFA_Cold_a_S1_L001_R2_001.fastq.gz\
PFA_Cold_a_S1_L002_R1_001.fastq.gz\
PFA_Cold_a_S1_L002_R2_001.fastq.gz\
PFA_Cold_b_S2_L001_R1_001.fastq.gz\
PFA_Cold_b_S2_L001_R2_001.fastq.gz\
PFA_Cold_b_S2_L002_R1_001.fastq.gz\
PFA_Cold_b_S2_L002_R2_001.fastq.gz\
PFA_Cold_c_S3_L001_R1_001.fastq.gz\
PFA_Cold_c_S3_L001_R2_001.fastq.gz\
PFA_Cold_c_S3_L002_R1_001.fastq.gz\
PFA_Cold_c_S3_L002_R2_001.fastq.gz\
PFA_Cold_d_S4_L001_R1_001.fastq.gz\
PFA_Cold_d_S4_L001_R2_001.fastq.gz\
PFA_Cold_d_S4_L002_R1_001.fastq.gz\
PFA_Cold_d_S4_L002_R2_001.fastq.gz
    
!kb count -i transcriptome.idx -g transcripts_to_genes.txt -x 10xv3 -o output_240_mRNA -t 2 \
PFA_RT_a_S5_L001_R1_001.fastq.gz\
PFA_RT_a_S5_L001_R2_001.fastq.gz\
PFA_RT_a_S5_L002_R1_001.fastq.gz\
PFA_RT_a_S5_L002_R2_001.fastq.gz\
PFA_RT_b_S6_L001_R1_001.fastq.gz\
PFA_RT_b_S6_L001_R2_001.fastq.gz\
PFA_RT_b_S6_L002_R1_001.fastq.gz\
PFA_RT_b_S6_L002_R2_001.fastq.gz\
PFA_RT_c_S7_L001_R1_001.fastq.gz\
PFA_RT_c_S7_L001_R2_001.fastq.gz\
PFA_RT_c_S7_L002_R1_001.fastq.gz\
PFA_RT_c_S7_L002_R2_001.fastq.gz\
PFA_RT_d_S8_L001_R1_001.fastq.gz\
PFA_RT_d_S8_L001_R2_001.fastq.gz\
PFA_RT_d_S8_L002_R1_001.fastq.gz\
PFA_RT_d_S8_L002_R2_001.fastq.gz