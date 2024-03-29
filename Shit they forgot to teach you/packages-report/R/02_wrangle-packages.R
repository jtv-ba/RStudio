## create a data frame from data/installed-packages.csv
## with, e.g., readr::read_csv() or read.csv()

## filter out packages in the default library
## keep variables Package and Built
## if you use dplyr, code like this will work:
apt <- ipt %>%
  filter(LibPath == .libPaths()[1]) %>%
  select(Package, Built)

## write this new, smaller data frame to data/add-on-packages.csv

## make a frequency table of package by the version in Built
## if you use dplyr, code like this will work:
apt_freqtable <- apt %>%
  count(Built) %>%
  mutate(prop = n / sum(n))

## write this data frame to data/add-on-packages-freqtable.csv
## YES overwrite the files that are there now
## they came from me (Jenny)
## they are just examples

## when this script works, stage & commit it and the csv files
## PUSH!


library(tidyverse)
library(here)
library(fs)

data_file <- dir_ls(here("data"), glob = "*installed-packages.csv")
stopifnot(length(data_file) == 1)

ipt <- read_csv(data_file)

## filter out packages in the default library
## keep Package and Built
apt <- ipt %>%
  filter(LibPath == .libPaths()[1]) %>%
  select(Package, Built)

## View(apt)

write_csv(apt, path = here("data", "add-on-packages.csv"))

apt_freqtable <- apt %>%
  count(Built) %>%
  mutate(prop = n / sum(n))

## apt_freqtable

write_csv(apt_freqtable, path = here("data", "add-on-packages-freqtable.csv"))
