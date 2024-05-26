rule genotype_gvcfs:
    input:
        db="my_database",
        refgenome = expand("{refgenome}", refgenome = config['REFGENOME'])
    output:
        vcf=f"{results}/raw_joint_cohort.vcf",
        log=f"{log_dir}/genotype_gvcfs.log"
    shell:
        """
        gatk GenotypeGVCFs -R {input.refgenome} -V gendb://{input.db} -O {output.vcf} 2> {output.log}
        """