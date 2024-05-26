rule map_to_reference:
    input:
        fq1=f"{config['results']}{{sample}}_1_trimmed.fq.gz",
        fq2=f"{config['results']}/{{sample}}_2_trimmed.fq.gz",
        refgenome = expand("{refgenome}", refgenome = config['REFGENOME'])
    output:
        sam=temp(f"{config['aligned_reads']}/{{sample}}.paired.sam"),
        log=f"{config['log_dir']}/{{sample}}_bwa.log"
    threads: config['THREADS']
    shell:
        """
        bwa mem -t {threads} -R "@RG\\tID:{wildcards.sample}\\tPL:ILLUMINA\\tSM:{wildcards.sample}" {input.refgenome} {input.fq1} {input.fq2} 2> {output.log} > {output.sam}
        """
