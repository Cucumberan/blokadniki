rule mark_duplicates:
    input:
        bam=f"{config['aligned_reads']}/{{sample}}.paired.bam"
    output:
        bam_dedup=temp(f"{config['aligned_reads']}/{{sample}}_sorted_dedup_reads.bam"),
        log=f"{config['log_dir']}/{{sample}}_markdupl.log"
    shell:
        """
        gatk MarkDuplicatesSpark -I {input.bam} \
            --conf 'spark.executor.cores=8' \
            --conf 'spark.executor.memory=1024M'\
            -O {output.bam_dedup} 2> {output.log}
        """