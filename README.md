# SQL for R Users

by [Jae Yeon Kim](https://jaeyk.github.io/)

## Overview

SQL is a viable option for anyone working with a large dataset (>10GB). For this reason, SQL is a must-skill if you intend to work with big data or data-driven organizations. This workshop helps R users to get started in SQL through `dbplyr`. After laying the foundation, the workshop also introduces intermediate SQL skills through `PostgreSQL`. Then the workshop offers a hands-on exercise where you can put your newly learned skills into practice. The workshop expects basic familiarity with R `dplyr` package, but does not require any background knowledge in SQL.

## Learning objectives

- [Part 1](https://github.com/jaeyk/sql-for-r-users/blob/master/code/01_intro_to_sql.Rmd): Learn how to access a database and run exploratory data analysis using `dbplyr` in R

- [Part 2](https://github.com/jaeyk/sql-for-r-users/blob/master/code/02_postgresql.md): Learn how to manage a database using `PostgreSQL`

- Bonus track : Putting what you have learned from part 1 and part 2 in practice ([shell script](https://github.com/jaeyk/sql-for-r-users/blob/master/code/02_sql_practice.sh), [R markdown](https://github.com/jaeyk/sql-for-r-users/blob/master/code/04_r_databsae_query.Rmd))

## Setup

**For Part 1**

- `pacman::p_load()` reduces steps for installing and loading several packages simultaneously.

```r

rm(list = ls())

if (!require("pacman")) install.packages("pacman")
pacman::p_load(
 tidyverse, # tidyverse packages
 dbplyr, # to use database with dplyr
 DBI, # for using SQL queries
 RSQLite, # for SQLite
 odbc, # backend engine; open data connectivity driver
 RPostgres, # PostgreSQL
 glue, # for gluing strings to data
 tidyquery, # sqldf alternative
 nycflights13 # for test data
)
```

**For part 2**

In Ubuntu (a Linux distribution), installing postgresql is pretty easy and straightforward.

[`sudo`](https://help.ubuntu.com/kubuntu/desktopguide/C/root-and-sudo.html) = `su` (switch user) + `do` (do action) (giving administrative access to your system)

```bash

# Install
sudo apt update
sudo apt install postgresql postgresql-contrib
```

If you use different operation systems (e.g., Windows and Mac), then take a look at this [official platform-specific guideline for installation](https://www.postgresql.org/docs/9.3/installation.html) documented by postgresql.org.

* Special thanks to Jacob Coblnetz (@Jacob_Coblnetz) for sharing his slides on the SQL workshop used at MIT and Aaron Culich at D-Lab at UC Berkeley for providing constructive feedback.

![](https://i.creativecommons.org/l/by/4.0/88x31.png) This work is licensed under a [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/).
