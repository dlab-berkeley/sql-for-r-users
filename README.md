
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/dlab-berkeley/sql-for-r-users/master)

# SQL for R Users

by [Jae Yeon Kim](https://jaeyk.github.io/)

File an [issue](https://github.com/dlab-berkeley/sql-for-r-users/issues) if you have problems, questions or suggestions.

## Overview

SQL is a viable option for anyone working with a large dataset. For this reason, SQL is a must-skill if you intend to work with big data or data-intensive organizations. The workshop aims to demonstrate that SQL is easy to learn, if you already know how to use `dplyr` package in R. This will be a very hands-on workshop, with live coding. 

## Learning objectives

- Learning how to use R and SQL to access and query a database [[Notebook](https://rawcdn.githack.com/dlab-berkeley/sql-for-r-users/5536557c2c0527b94f7daf0bd0c131d892c94307/code/01_intro_to_sql.html)]

## Prerequisites 

- Familiarity with `dplyr` package in R

- No background knowledge in SQL required 

## Setup

Launch the binder. Please do so before attending the worskshop as it takes a while (especially, if you do it for the first time).

Or manually install the following packages.

```r

if (!require("pacman")) install.packages("pacman")
pacman::p_load(
    tidyverse, # tidyverse packages
    dbplyr, # database with dplyr
    DBI, # SQL queries
    RSQLite, # SQLite
    nycflights13 # toy data
)

```

* Special thanks to [Jacob Coblnetz](https://www.linkedin.com/in/jacobcoblentz/) for sharing his slides on the SQL workshop used at MIT and [Aaron Culich](https://dlab.berkeley.edu/people/aaron-culich) and [Aniket Kesari](https://dlab.berkeley.edu/people/aniket-kesari) at D-Lab at UC Berkeley for providing constructive feedback.

![](https://i.creativecommons.org/l/by/4.0/88x31.png) This work is licensed under a [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/).
