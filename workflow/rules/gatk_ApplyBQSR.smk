rule apply_bqsr:
    input:
        bam=f"{config['aligned_reads']}/{{sample}}_sorted_dedup_reads.bam",
        recal_table=f"{congif['results']}/{{sample}}_recal_data.table",
        refgenome = expand("{refgenome}", refgenome = config['REFGENOME'])
    output:
        bqsr_bam=f"{config['aligned_reads']}/{{sample}}_sorted_dedup_bqsr_reads.bam",
        log=f"{config['log_dir']}/{{sample}}_bqsr.log"
    shell:
        """
        gatk ApplyBQSR -I {input.bam} -R {input.refgenome} --bqsr-recal-file {input.recal_table} -O {output.bqsr_bam} 2> {output.log}
        """