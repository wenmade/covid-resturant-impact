#data <- xmlParse("./dataset/dine_safe_original.xml")
library(opendatatoronto)
library(tidyverse)
library(dplyr)

dinesafe <- opendatatoronto::search_packages("Dinesafe")%>%
 opendatatoronto::list_package_resources()%>%
  filter(id =="c3ebef25-177b-4adc-9c47-8763b04a52fb") %>%
  select(id) %>%
  opendatatoronto::get_resource()

# Although the retrieving of the original xml file was reproducible. 
# The xml parsing did not work directly in RStudio due to most likely the formatting and nesting the xml file. 
# Through looking at potential solutions on StackOverflow, there was no working reproducible way to convert the xml file to csv file. 
# Therefore a secondary approach was taken, the xml file was converted through an online converter: https://onlinexmltools.com/convert-xml-to-csv
# The converted csv file was downloaded into dataset/dinesafeCSV.csv. Original xml file was also saved in the location dataset/dine_safe_original.xml

#_________________________________________#


dinesafedata <- opendatatoronto::search_packages("Dinesafe")%>%
  opendatatoronto::list_package_resources()%>%
  filter(id =="c3ebef25-177b-4adc-9c47-8763b04a52fb") %>%
  select(id) %>%
  opendatatoronto::get_resource()
dinesafedata
