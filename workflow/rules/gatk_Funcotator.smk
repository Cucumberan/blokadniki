rule funcotate_vcf:
    input:
        vcf=f"{config['results']}/raw_joint_cohort.vcf",
        refgenome = expand("{refgenome}", refgenome = config['REFGENOME'])
    output:
        vcf=f"{config['results']}/raw_joint_cohort_annotated.vcf",
        log=f"{config['log_dir']}/funcotate_snps.log"
    params:
        data_sources_path = expand("{data-sources-path}", data-sources-path = config['DataSourcePath'])
    shell:
        """
        gatk Funcotator \
            --variant {input.vcf} \
            --reference {input.refgenome} \
            --ref-version hg38 \
            --data-sources-path {params.data_sources_path} \
            --output {output.vcf} \
            --output-file-format VCF 2> {output.log}
        """
