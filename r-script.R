#install.packages("data.table")  
library(ballgown)
library(data.table) 

data_directory_brain = 'brain'
data_directory_liver = 'liver'



#========================================== brain ballgown / exporting brain.csv table =============================

# make the ballgown object (brain):
bg_brain = ballgown(dataDir=data_directory_brain, samplePattern='sample', meas='all')
bg_brain

structure(bg_brain)$exon
structure(bg_brain)$intron
structure(bg_brain)$trans


brain_table <- texpr(bg_brain, meas = "FPKM")
export_brain_var <- head(brain_table, 1000)
write.csv(export_brain_var, 'brain.csv')



#=========================================== liver ballgown / exporting liver.csv table ============================

# make the ballgown object (liver):
bg_liver = ballgown(dataDir=data_directory_liver, samplePattern='sample', meas='all')
bg_liver

structure(bg_liver)$exon
structure(bg_liver)$intron
structure(bg_liver)$trans


liver_table <- texpr(bg_liver, meas = "FPKM")
export_liver_var <- head(liver_table, 1000)
write.csv(export_liver_var, 'liver.csv')


#=========================================== brain read .gtf file and exporting as .csv file =======================

gtf_brain <- fread(file = 'gtf_datasets/brain.out.gtf')
export_gtf_brain <- head(gtf_brain, 1000)
write.csv(export_gtf_brain, 'brain_gtf_export.csv')


#=========================================== liver read .gtf file and exporting as .csv file =======================

gtf_liver <- fread(file = 'gtf_datasets/liver.out.gtf')
export_gtf_liver <- head(gtf_liver, 1000)
write.csv(export_gtf_liver, 'liver_gtf_export.csv')