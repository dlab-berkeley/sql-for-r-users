# Using PostgreSQL

Jae Yeon Kim

The first sequence of the workshop covered accessing a databae and doing basic data exploration using `dbplyr` and `dplyr` in R. For a more serious work on database, it is necessary to go deeper into the understanding of how database and SQL work. At the fundamental level, a database does two things: storing and retrieving data. As we have learned how to retrieve data, we also need to learn how to store data.

In this workshop, we learn basic skills to use [PostgreSQL](https://www.postgresql.org/), one of the advanced open source relational database management tools, for database management. This workshop heavily draws on [PostgreSQL: Up and Running, A Practical Guide to the Advanced Open Source Database](http://shop.oreilly.com/product/0636920052715.do) by Regina Obe and Leo Hsu (O'Reilly Media 2017) and [PostgreSQL Tutorial](https://www.postgresqltutorial.com/what-is-postgresql/) website.

![](http://db.cs.berkeley.edu/www/database.gif)

**Why PostgreSQL?**

1. Open-sourced
2. Popular (large community)
3. Fast
4. Compatible with many languages (e.g., C, SQL, R, Python)
5. Smart. PostgreSQL helps to use databases as a platform to run data-intensive applications.
6. Developed by Berkeley computer science researchers ([POSTGRES 4.2](https://dsf.berkeley.edu/postgres.html)) :heart:

**Why not?**

If you don't need the advanced features of the PostgreSQL for what you want to do. A single user of a database may find using [SQLite](https://www.sqlite.org/index.html) would be sufficient for their use.

## Installation

In Ubuntu (a Linux distribution), installing postgresql is pretty easy and straightforward.

[`sudo`](https://help.ubuntu.com/kubuntu/desktopguide/C/root-and-sudo.html) = `su` (switch user) + `do` (do action) (giving administrative access to your system)

```bash

# Install
sudo apt update
sudo apt install postgresql postgresql-contrib
```

If you use different operation systems (e.g., Windows and Mac), then take a look at this [official platform-specific guideline for installation](https://www.postgresql.org/docs/9.3/installation.html) documented by postgresql.org.

## Basic setup and operations

**Administration tools**

- `psql` (a command line interface)
- `pgAdmin` (a popular GUI tool; a good entry point for PostgreSQL). Our focus today. ([Installation guide](https://www.pgadmin.org/download/))
- `phpPgAdmin`
- `Adminer`

### Add a database

Let's add a new database using `psql`.

```bash

# In terminal
sudo -u postgres psql
# same as
# sudo su - postgres
# psql
```

Now, you're in PostgreSQL. Don't forget to type `;` at the end of your command. The sign singals that the code ends and it should be running. Note that when the code works, PostgreSQL returns something simple that indicate the task performed (e.g., `CREATE DATABASE`).

```bash

## Create a databse
create database oskidb;

## Check whether that new databse exists; Enlist the available databases
\l

## If you want to switch to another datbase then type \c database_name
```

### Add a new user

- Create a user

```bash

## Create a user and associated password
create user oski with encrypted password 'oskipw';
```

- Define the privileges (or permissions) of the new user: `GRANT`

```bash
## Grant privileges
grant all privileges on database oskidb to oski;
```

We don't dive into the detail here. Let's just aware that PostgreSQL allows admins to have granular control over the acess (even down to the column and row level).

Let's check whether there's an existing table by typing `\d`. There should be none if you have never used PostgreSQL.

Reference: https://www.digitalocean.com/community/tutorials/how-to-create-remove-manage-tables-in-postgresql-on-a-cloud-server

### Add a new table

We can't ignore tables as they are building blocks of a relational database. Check available tables by typing `dt`.

Here's an example of how you create a table. PostgreSQL supports the fundamental data types (i.e., numerics, strings, dates, times, and booleans) plus more (e.g., [JSON](https://www.json.org/json-en.html), [XML](https://en.wikipedia.org/wiki/XML)).

**Data types**

Note that this list is not exhaustive.

- Numerics (e.g., integers, decimals, floating-point numbers)
	- SERIAL: auto-incrementing integers (useful to create keys)
- Textuals
	- CHAR: character (values stored in fixed length, e.g., ZIP CODE)
	- VARCHAR: character varying. (values stored in varying length)
	- TEXT: generic textual data type
- Temporals (e.g., date, time, timestamp, timestamptz (time stamp + time zone). etc.)


**Basic syntax**

- Create a table

```sql
CREATE TABLE table_name ( # Name of the table
	field_name data_type constraint # Name of the column + The variable type of the column + optional constraint
	);
```

```sql
CREATE TABLE sql_workshop(
	student_id serial PRIMARY KEY,
	student_name VARCHAR (50) UNIQUE NOT NULL,
	affiliations VARCHAR (50),
	comments TEXT # A string; length is not determined
	log_ts TIMESTAMP
);
```

- Alter a table: `ALTER TABLE [TABLE NAME] [ACTION]`

```sql
ALTER TABLE sql_workshop ADD COLUMN
program_year varchar(25);
```

- Insert a row: `INSERT INTO [COLUMN NAME] VALUES (a list of values)`

```sql
INSERT INTO student_name VALUES ("jae", "aniket", "renata", "aaron", "evan", "claudia", "dave");
```

Hypothetically, you have your data saved in a CSV format in your computer. You can copy and the csv file to the table.

```sql

COPY sql_workshop FROM `file name address` DELIMITER `,` CSV HEADER;
```

- Drop a table: `DROP TABLE [TABLE NAME]`

```sql
DROP TABLE sql_workshop;
```

If you want to get to know more about the syntax of a command, then add `\h` before a particular command (`\h CREATE TABLE`).

### Other useful stuff

- If you want to return then type `\q`.

- If you want to sign into a database, then

```bash
sudo -u postgres psql

oskidb
```

- If you were curious about other commands in `psql` then type `\?`.

- If you want to use an editor (e.g., nano, vim) with `psql` then type `\e`.

- If you want to use bash commands in `psql` prompt then use `\!` (e.g., `\! ls`; list files in a directory).

## For more complex tasks

If you have more complex tasks then use `pgadmin`.

The following screent shot helps you to connect to the database you just created. (localhost refers to the current computer used to access a network. For more information, see [this Wiki entry](https://en.wikipedia.org/wiki/Localhost).)

<img src="https://github.com/jaeyk/sql-for-r-tidyverse-users/blob/master/misc/pgadmin_setup.png" width="600">


## References

- [PostgreSQL: Up and Running, A Practical Guide to the Advanced Open Source Database](http://shop.oreilly.com/product/0636920052715.do) by Regina Obe and Leo Hsu (O'Reilly Media 2017)
- [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)
- [Designing Data-Intensive Applications: The Big Ideas Behind Reliable, Scalable, and Maintainable Systems](https://www.amazon.com/dp/B06XPJML5D/ref=dp-kindle-redirect?_encoding=UTF8&btkr=1) by Martin Kleppmann (O'Reilly Media 2017). A highly recommendable book for learning more about data engineering.
- [use-the-index-luke.com](https://use-the-index-luke.com/). This is a great resource to learn how to make your SQL query efficient.
