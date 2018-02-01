#!/bin/bash

#PBS -N PP_RNAseq_fastqc_batch_T502
#PBS -k o
#PBS -l nodes=1:ppn=16,vmem=32gb
#PBS -l walltime=1:00:00
#PBS -m abe

module load fastqc

fileDir=/N/dc2/scratch/rtraborn/T502_fastqs/Genotyping_Ecoli
####### Before running the script, please enter path to desired output directory, below ####
fqDir=/N/u/campalex/Carbonate/Genomicdata

cd $fqDir

ln -s ${fileDir}/GSF1659-EC-7_S17_R1_001.fastq.gz EC-7.R1.fastq.gz
ln -s ${fileDir}/GSF1659-EC-7_S17_R2_001.fastq.gz EC-7.R2.fastq.gz
ln -s ${fileDir}/GSF1659-ECL-1_S15_R1_001.fastq.gz ECL-1.R1.fastq.gz
ln -s ${fileDir}/GSF1659-ECL-1_S15_R2_001.fastq.gz ECL-1.R2.fastq.gz
ln -s ${fileDir}/GSF1659-ECL-4_S16_R1_001.fastq.gz ECL-4.R1.fastq.gz
ln -s ${fileDir}/GSF1659-ECL-4_S16_R2_001.fastq.gz ECL-4.R2.fastq.gz
ln -s ${fileDir}/GSF1659-KP-84_S12_R2_001.fastq.gz KP-84.R2.fastq.gz
ln -s ${fileDir}/GSF1659-KP-84_S12_R1_001.fastq.gz KP-84.R1.fastq.gz

ln -s ${fileDir}/GSF1659-KP-49_S9_R1_001.fastq.gz KP-49.R1.fastq.gz
ln -s ${fileDir}/GSF1659-KP-49_S9_R2_001.fastq.gz KP-49.R2.fastq.gz
ln -s ${fileDir}/GSF1659-KP-80_S10_R1_001.fastq.gz KP-80.R1.fastq.gz
ln -s ${fileDir}/GSF1659-KP-80_S10_R2_001.fastq.gz KP-80.R2.fastq.gz
ln -s ${fileDir}/GSF1659-KP-83_S11_R1_001.fastq.gz KP-83.R1.fastq.gz
ln -s ${fileDir}/GSF1659-KP-83_S11_R2_001.fastq.gz KP-83.R2.fastq.gz
ln -s ${fileDir}/GSF1659-KP-85_S13_R1_001.fastq.gz KP-85.R1.fastq.gz
ln -s ${fileDir}/GSF1659-KP-85_S13_R2_001.fastq.gz KP-85.R1.fastq.gz

echo "Starting job"

echo "Running fastqc on the RNA-seq files"

for fq in *.fastq.gz; do
echo "Starting fastqc for $fq"
fastqc $fq
done

echo "Fastqc job is complete"

exit


