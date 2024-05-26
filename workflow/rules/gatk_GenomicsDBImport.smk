rule genomics_db_import:
    input:
        map=f"{config['results']}/cohort.sample_map"
    output:
        db="my_database",
        log=f"{config['log_dir']}/genomics_db_import.log"
    shell:
        """
        gatk GenomicsDBImport --sample-name-map {input.map} --genomicsdb-workspace-path {output.db} -L chr1 -L chr2 \
        -L chr3 -L chr4 -L chr5 -L chr6 -L chr7 -L chr8 -L chr9 -L chr10 \
        -L chr11 -L chr12 -L chr13 -L chr14 -L chr15 -L chr16 -L chr17 -L chr18 -L chr19 \
        -L chr20 -L chr21 -L chr22 -L chrX -L chrY 2> {output.log}
        """