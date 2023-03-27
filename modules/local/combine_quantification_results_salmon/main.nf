process COMBINE_QUANTIFICATION_RESULTS_SALMON {
    label 'process_high'

    input: 
	    path input_quantification
	    val gene_attribute
        val organism
    output:
	    path "combined_$organism.tsv", emit: combined_quant_data
    script:
    """
    python $workflow.projectDir/bin/collect_quantification_data_salmon.py \
        -i $input_quantification \
        -a $gene_attribute \
        -org $organism
    """
}