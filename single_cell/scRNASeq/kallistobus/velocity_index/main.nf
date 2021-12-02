//////////////////////////
// Nextflow workflow to create a velocity-compatible index using kbpython
///////////////////////////

process velocityIndex {
  publishDir params.indexDir

  input:
  file ref_genome from params.refGenome
  file ref_gtf from params.refGTF

  output:
  file "index.idx" into transcriptome_index
  file ""

  script:
  """
  kb ref -i index.idx -g t2g.txt -f1 cdna.fa -f2 intron.fa -c1 cdna_t2c.txt -c2 intron_t2c.txt --workflow lamanno -n 8 \
  ${ref_genome} \
  ${ref_gtf}
  """
}
