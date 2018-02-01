## make a barchart from the frequency table in data/add-on-packages-freqtable.csv

## read that csv into a data frame, then ...

## if you use ggplot2, code like this will work:
ggplot(apt_freqtable, aes(x = Built, y = n)) +
  geom_bar(stat = "identity")

## write this barchart to figs/built-barchart.png
## if you use ggplot2, ggsave() will help

## YES overwrite the file that is there now
## that came from me (Jenny)

## when this script works, stage & commit it and the png file
## PUSH!

library(tidyverse)
library(here)
library(fs)

freqtable_file <- dir_ls(here("data"), glob = "*freqtable.csv")
stopifnot(length(freqtable_file) == 1)

apt_freqtable <- read_csv(freqtable_file)

## apt_freqtable

p <- ggplot(apt_freqtable, aes(x = Built, y = n)) +
  geom_bar(stat = "identity")

## p

ggsave(here("figs", "built-barchart.png"), p, height = 3)
