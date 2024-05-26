rule quality_control:
    input:
        fq1=f"{config['READS']}/V350161676_L01_BLOK{{sample}}_1.fq.gz",
        fq2=f"{config['READS']}/V350161676_L01_BLOK{{sample}}_2.fq.gz"
    output:
        trimmed_fq1=temp(f"{config['results']}/{{sample}}_1_trimmed.fq.gz"),
        trimmed_fq2=temp(f"{config['results']}/{{sample}}_2_trimmed.fq.gz"),
        log=f"{config['log_dir']}/{{sample}}_fastp.log"
    threads: config['THREADS']
    message:
        "Undertaking quality control checks on raw sequence data for {input.fq1}, {input.fq2}"
    shell:
        """
        fastp -i {input.fq1} -I {input.fq2} -o {output.trimmed_fq1} -O {output.trimmed_fq2} --length_required 25 > {output.log} 2>&1
        """

