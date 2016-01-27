#--------------------
# This is the KickStarter v2 for the Analysis of the Memory & SPE experiment.
# 
# NOTE: Only edit the parameters in this script. Editing the dependencies may break the package.  
# 
# Author: Luis Sanchez (9/21/15)
#-------------------

library(dplyr)

WD <- "C:/Users/CU Lou/Dropbox/Research/CRED/Memory, Learning and Decision Making/SPE and Memory in DM - Data Analysis/"
setwd(WD)

#------------------------ Read in the Raw Data ---------------------------------

#CardSchemes File - This is the PHP output containing P's choices
cardSchemes_raw <- read.csv("Raw Data/DataFinal_12-4-15_Old484910.csv",header = TRUE, stringsAsFactors = F) 

#read Qualtrics CSV output - needs to be cleaned
playerData_raw <- read.csv("Raw Data/Primacy_Survey_Final_12-4-15_Old484910in_AllOtherOldOnesRemoved.csv",header = TRUE, stringsAsFactors = F) 

#MemoryTrials - Contains the order in which the cards were presented in Qualtrics for the memory test  
memoryTrials <- read.csv("Raw Data/order_memtest.csv",header = TRUE, stringsAsFactors = F) 

#------------------- Subset the Ps to analyze (Default is 1:60) ------------------

firstParticipant <- 1
lastParticipant <- 60

#------------------- DO NOT MODIFY (Helper Functions) ---------------------

#This function acts as a counter. Adds +1 whenever it is called.  
inc <- function(x) {eval.parent(substitute(x <- x + 1))}

# This function multiplies a number x100 whenever it is called. 
mult100 <- function(x) {eval.parent(substitute(x <- x*100))}

#---------------------- Scripts to Run ---------------------------

source("Scripts/Cleanup&PreProcessing.R") #Cleans the CSVs that were previously loaded
source("Scripts/CardsShown.R") 
source("Scripts/Analysis_ImageSignalDetection.R")
source("Scripts/Analysis_ValueSignalDetection.R")
source("Scripts/Summary&Percentages.R")

#--------------------- Exports Final CSVs --------------------------- 

#Exports Final output/analysis for each participant w/o extra columns
write.table(finalExport, "Output/FinalOutput_MemoryDataAnalysis.csv",
            row.names=FALSE, col.names=TRUE, sep=',')

#Run the code below to order participant data based on how it was presented
source("Scripts/DecryptingParticipantResponses.R") 
write.table(ordered_finalExport, "Output/Ordered_FinalOutput_MemoryDataAnalysis.csv",
            row.names=FALSE, col.names=TRUE, sep=',')