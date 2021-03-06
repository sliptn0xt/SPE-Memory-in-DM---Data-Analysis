#--------------------
# This script uses all the data extracted from the previous scripts and creates
# summary statistics in terms of percentages. 
# It will then be exported in the KickStarter script. 
# 
# Author: Luis Sanchez (01/28/16)
#-------------------

#Percentage of Values (total and by increments) remembered correctly/incorrectly (only for Hits) 
analysisDf <- analysisDf %>%
  mutate(percent_rememberValue = rememberValue / hits, 
         percent_rememberValue0 = rememberValue0 / hits0,
         percent_rememberValue20 = rememberValue20 / hits20,
         percent_rememberValue40 = rememberValue40 / hits40,
         percent_rememberValue60 = rememberValue60 / hits60,
         percent_rememberValue80 = rememberValue80 / hits80,
         percent_rememberValue100 = rememberValue100 / hits100,
         percent_wrongValue = wrongValue / hits,
         percent_wrongValue0 = wrongValue0 / hits0,
         percent_wrongValue20 = wrongValue20 / hits20,
         percent_wrongValue40 = wrongValue40 / hits40,
         percent_wrongValue60 = wrongValue60 / hits60,
         percent_wrongValue80 = wrongValue80 / hits80,
         percent_wrongValue100 = wrongValue100 / hits100)

#Percentage breakdown of hits/misses total and by increments in value 
analysisDf <- analysisDf %>%
  mutate(percent_hits = hits / shown,
         percent_hits0 = hits0 / shown0,
         percent_hits20 = hits20 / shown20,
         percent_hits40 = hits40 / shown40,
         percent_hits60 = hits60 / shown60,
         percent_hits80 = hits80 / shown80,
         percent_hits100 = hits100 / shown100,
         percent_misses = misses / shown,
         percent_misses0 = misses0 / shown0,
         percent_misses20 = misses20 / shown20,
         percent_misses40 = misses40 / shown40,
         percent_misses60 = misses60 / shown60,
         percent_misses80 = misses80 / shown80,
         percent_misses100 = misses100 / shown100)

finalExport <- dplyr::full_join(playerData, analysisDf, by = "participant")
finalExport_ordered <- dplyr::full_join(playerData_ordered, analysisDf, by = "participant") 

