rule call_variants:
    input:
        bam=f"{config['aligned_reads']}/{{sample}}_sorted_dedup_bqsr_reads.bam",
        refgenome = expand("{refgenome}", refgenome = config['REFGENOME'])
    output:
        vcf=f"{config['results']}/{{sample}}_raw_variants.vcf",
        log=f"{config['log_dir']}/{{sample}}_haplocaller.log"
    shell:
        """
        gatk HaplotypeCaller -R {input.refgenome} -I {input.bam} -O {output.vcf} 2> {output.log}
        """