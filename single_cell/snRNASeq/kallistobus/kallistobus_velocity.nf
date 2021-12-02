#!/usr/bin/env nextflow

// Channel for ordered read files by sample (I think this one actually works).
// Output is a tuple of [name,[<ordered list of fastq.gz files>]]
Channel
     .fromPath(params.readPath)
        .map { file ->
            def key = file.name.toString().tokenize('_').get(0)
            return tuple(key, file)
         }
        .groupTuple(by: 0, sort:true)
        .set{ groups_ch }

//groups_ch.view()

process run_kallisto {
  //conda "$params.condaEnv" //Commenting out in favor of defining environment in process configuration scope in nextflow.config
  //maxForks params.nProcs //same as above.

  input:
     tuple val(name), file (reads) from groups_ch
  output:
     val name into bus_raw_receiver

"""
mkdir -p $params.outDir/$name
mkdir -p $params.logDir/$name
kb count -i $params.kallisto_index --workflow $params.recipe -g $params.tr2g -x $params.chemistry -o $params.outDir/$name -c1 $params.cDNA_tx_to_capture -c2 $params.introns_tx_to_capture -t $params.threads $reads 2>$params.logDir/$name/kallisto.err
"""

}

//bus_raw_receiver.println()

// process do_knee_filter {
// 
   //  input:
   //  val(name) from bus_raw_receiver
// 
   //  output:
   //  val name into knee_receiver
// 
// """
// Rscript kneePlots.R $params.outDir/$name
// """
// }

//knee_receiver.println()
