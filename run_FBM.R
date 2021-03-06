# define input files
setwd("path") # set working directory
treefile <- "platyrrhine_FBD.trees"
tindex <- 1 # specify which tree should be analyzed if the tree file includes multiple trees
datafile <- "platyrrhine_bodymass.txt"

# load FBM library
source("fossilBM_lib.R")

# process and match input data 
fbm_obj <- read_and_transform_data(treefile, datafile, log_trait_data=10)

# to add a partition file you can use the following:
#fbm_obj <- read_and_transform_data(treefile, datafile, log_trait_data=10, partition_file="clade_partitions.txt")

# run MCMC
output_file <- "fbm_mcmc.log"
run_mcmc(fbm_obj, logfile=output_file, ngen = 100000, sample = 2500, linTrend=T, print_freq=1000)

# plot results
plot_results(fbm_obj, logfile = output_file)
plot_time_varying_trend(fbm_obj, logfile, resfile="trends.pdf")


