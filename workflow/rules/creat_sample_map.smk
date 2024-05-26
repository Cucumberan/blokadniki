rule create_sample_map:
    output:
        map=f"{config['results']}/cohort.sample_map"
    run:
        with open(output.map, 'w') as map_file:
            for sample in SAMPLES:
                gvcf_path = f"{config['results']}/{sample}_raw_variants.vcf"
                map_file.write(f"{sample}\t{gvcf_path}\n")
