#!/usr/bin/env R

library(BUSpaRse)
library(zeallot)
library(DropletUtils)
library(tidyverse)

#' Knee plot for filtering empty droplets
#'
#' Visualizes the inflection point to filter empty droplets. This function plots
#' different datasets with a different color. Facets can be added after calling
#' this function with `facet_*` functions.
#'
#' @param bc_ranks A named list of output from `DropletUtil::barcodeRanks`.
#' @return A ggplot2 object.
#' @importFrom tibble tibble
#' @importFrom purrr map map_dbl
#' @importFrom dplyr distinct
#' @importFrom ggplot2 geom_line geom_hline geom_vline scale_x_log10 scale_y_log10
#' @importFrom tidyr unnest
#' @export
knee_plot <- function(bc_ranks) {
  # purrr pluck shorthand doesn't work on S4Vector DataFrame
  knee_plt <- tibble(rank = map(bc_ranks, ~ .x[["rank"]]),
                     total = map(bc_ranks, ~ .x[["total"]]),
                     dataset = names(bc_ranks)) %>%
    unnest(cols = c(rank, total)) %>%
    distinct() %>%
    dplyr::filter(total > 0)
  annot <- tibble(inflection = map_dbl(bc_ranks, ~ metadata(.x)[["inflection"]]),
                  rank_cutoff = map_dbl(bc_ranks,
                                        ~ max(.x$rank[.x$total >
                                                        metadata(.x)[["inflection"]]])),
                  dataset = names(bc_ranks))
  p <- ggplot(knee_plt, aes(rank, total, color = dataset)) +
    geom_line() +
    geom_hline(aes(yintercept = inflection, color = dataset),
               data = annot, linetype = 2) +
    geom_vline(aes(xintercept = rank_cutoff, color = dataset),
               data = annot, linetype = 2) +
    scale_x_log10() +
    scale_y_log10() +
    labs(x = "Rank", y = "Total UMIs")
  return(p)
}

# Arg parsing
args <- commandArgs(trailingOnly = TRUE)
baseDir<-args[1]



# Read in spliced and unspliced matrices
#baseDir <- "/Volumes/Data/Sequencing/Bjornsson/revised_Gio_ks_hippo/results/kallisto_out/day0sample2"
d <- paste0(baseDir,"/counts_unfiltered") # top-level directory containing requisite files with 'spliced' and 'unspliced' prefixes.
outDir <- paste0(baseDir,"/counts_filtered")
dir.create(file.path(outDir), showWarnings = FALSE)

write(paste0("Reading in count matrices from ",d),stderr())
c(spliced, unspliced) %<-% BUSpaRse::read_velocity_output(spliced_dir = d,
                                                spliced_name = "spliced",
                                                unspliced_dir = d,
                                                unspliced_name = "unspliced")

write("Summarizing",stderr())
bc_rank <- barcodeRanks(spliced)
bc_uns <- barcodeRanks(unspliced)
tot_count <- Matrix::colSums(spliced)

write("Making knee plot",stderr())
knee<- knee_plot(list(spliced = bc_rank, unspliced = bc_uns)) +
        coord_flip()

pdf(file=paste0(outDir,"/knee.pdf"),width=5,height=5)
  print(knee)
dev.off()

write(paste0("Filtering for cells >",metadata(bc_rank)$inflection," UMIs"),stderr())
bcs_use <- colnames(spliced)[tot_count > metadata(bc_rank)$inflection]
# Remove genes that aren't detected
tot_genes <- Matrix::rowSums(spliced)
#genes_use <- rownames(spliced)[tot_genes > 0]
sf <- spliced[, bcs_use]
uf <- unspliced[, bcs_use]

write(paste0(dim(sf)[2]," cells remain after knee filter"),stderr())

write(paste0("Writing output to ",outDir),stderr())
write("     spliced Matrix",stderr())
#spliceFile<-paste0(outDir,"/spliced.mtx")
Matrix::writeMM(sf,file.path(outDir,"spliced.mtx"))
write.table(rownames(sf),file=paste0(outDir,"/spliced.genes.txt"),row.names=FALSE,col.names=FALSE,quote=FALSE)
write.table(colnames(sf),file=paste0(outDir,"/spliced.barcodes.txt"),row.names=FALSE,col.names=FALSE,quote=FALSE)

write("     unspliced Matrix",stderr())
#unspliceFile<-paste0(outDir,"/unspliced.mtx")
Matrix::writeMM(uf,file.path(outDir,"unspliced.mtx"))
write.table(rownames(uf),file=paste0(outDir,"/unspliced.genes.txt"),row.names=FALSE,col.names=FALSE,quote=FALSE)
write.table(colnames(uf),file=paste0(outDir,"/unspliced.barcodes.txt"),row.names=FALSE,col.names=FALSE,quote=FALSE)
