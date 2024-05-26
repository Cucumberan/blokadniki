rule sam_to_bam:
    input:
        sam=f"{config['aligned_reads']}/{{sample}}.paired.sam"
    output:
        bam=temp(f"{config['aligned_reads']}/{{sample}}.paired.bam"),
        log=f"{config['log_dir']}/{{sample}}_samtoolsview.log"
    shell:
        samtools view -S -b {input.sam} > {output.bam} 2> {output.log}
        """