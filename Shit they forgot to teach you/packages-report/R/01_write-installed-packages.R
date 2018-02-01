## deja vu from yesterday!

## create a data frame of your installed packages

## keep the variables
##   * Package
##   * LibPath
##   * Version
##   * Priority
##   * Built

## write it to data/installed-packages.csv
## YES overwrite the file that is there now
## that came from me (Jenny)
## it an example of what yours should look like

## when this script works, stage & commit it and the csv file
## PUSH!
library(tidyverse)
library(here)

ipt <- installed.packages() %>%
  as_tibble() %>%
  select(Package, LibPath, Version, Priority, Built) %>%
  write_csv(path = here("data", "installed-packages.csv"))

## IRL I would might incorporate a date, but clunky for today's purpose
## e.g., here("data", paste0(Sys.Date(),"_installed-packages.csv"))

## View(ipt)
