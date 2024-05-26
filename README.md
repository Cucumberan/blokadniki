# blokadniki

This repository is dedicated to GWAS analysis of the genomes of people who survived the Siege of Leningrad.

## What is this project about?

## What's in this repository?

### Paired-end sequencing data processing pipline.

A Snakemake workflow to process cohort samples related individuals of paired-end sequencing data (WGS or WES) using [bwa](https://bio-bwa.sourceforge.net/) and [GATK4](https://gatk.broadinstitute.org/hc/en-us). Quality control checks are also undertaken with [fastp](https://github.com/OpenGene/fastp).

This workflow is designed to follow the [GATK best practice workflow for germline short variant discovery (SNPs + Indels)](https://gatk.broadinstitute.org/hc/en-us/articles/360035535932-Germline-short-variant-discovery-SNPs-Indels), taking the data from fastq to annotated vcf (raw sequencing data to annotated called variants).

1. Raw read QC ([Fastp](https://github.com/OpenGene/fastp))
2. Alignment against reference genome ([Burrows-Wheeler Aligner](http://bio-bwa.sourceforge.net/))
3. Mark duplicates ([GATK MarkDuplicates](https://gatk.broadinstitute.org/hc/en-us/articles/4414594430619-GenotypeGVCFs))
4. Base recalibration ([GATK BaseRecalibrator](https://gatk.broadinstitute.org/hc/en-us/articles/360036898312-BaseRecalibrator) and [GATK ApplyBQSR](https://gatk.broadinstitute.org/hc/en-us/articles/360037055712-ApplyBQSR))
5. Haplotype calling ([GATK HaplotypeCalller](https://gatk.broadinstitute.org/hc/en-us/articles/360037225632-HaplotypeCaller))
6. Combine GVCF into multi-sample GVCF ([GATK GenomicsDBImport](https://gatk.broadinstitute.org/hc/en-us/articles/360036883491-GenomicsDBImport))
7. Genotyping ([GATK GenotypeGVCFs](https://gatk.broadinstitute.org/hc/en-us/articles/4414594430619-GenotypeGVCFs))
8. Annotation ([GATK Funcotator](https://gatk.broadinstitute.org/hc/en-us/articles/360037224432-Funcotator))

### Main output files.
- `results/raw_joint_cohort.vcf`
- `results/raw_joint_cohort_annotated.vcf`

### Prerequisite
Prerequisite software and environment can be found in `pipeline_run_env.yaml`
