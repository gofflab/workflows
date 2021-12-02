#!/usr/bin/env nextflow

// mRNA index

// feature barcode index

// mRNA kallisto
process run_kallisto {
  //conda "$params.condaEnv" //Commenting out in favor of defining environment in process configuration scope in nextflow.config
  //maxForks params.nProcs //same as above.

  input:
     tuple val(name), file (reads) from groups_ch
  output:
     val name into bus_raw_receiver

"""
mkdir -p $params.outDir/$name
kb count -i $params.kallisto_index -g $params.tr2g -x $params.chemistry -o $params.outDir/$name -c1 $params.cDNA_tx_to_capture -c2 >
"""

}

process do_knee_filter {

    input:
    val(name) from bus_raw_receiver

    output:
    val name into knee_receiver

"""
Rscript kneePlots.R $params.outDir/$name
"""
}
// feature barcode kallisto
