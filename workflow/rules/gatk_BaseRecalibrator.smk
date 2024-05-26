rule base_recalibrator:
    input:
        bam=f"{config['aligned_reads']}/{{sample}}_sorted_dedup_reads.bam",
        refgenome = expand("{refgenome}", refgenome = config['REFGENOME'])
    output:
        recal_table=f"{config['results']}/{{sample}}_recal_data.table",
        log=f"{config['log_dir']}/{{sample}}_recaltable.log"
    shell:
        """
        gatk BaseRecalibrator -I {input.bam} -R {input.refgenome} --known-sites {dbSNP} -O {output.recal_table} 2> {output.log}
        """