# Using PostgreSQL

Jae Yeon Kim

The first sequence of the workshop covered accessing a databae and doing basic data exploration using `dbplyr` and `dplyr` in R.

For a more serious work on database, it is necessary to go deeper into the understanding of how database and SQL works. `dplyr` is optimzed to handle the small and medium-sized data analysis tasks.

In this workshop, we learn basic skills to use [PostgreSQL](https://www.postgresql.org/), one of the advanced open source relational database management tools, for database management. This workshop heavily draws on [PostgreSQL: Up and Running, A Practical Guide to the Advanced Open Source Database](http://shop.oreilly.com/product/0636920052715.do) by Regina Obe and Leo Hsu (O'Reilly Media 2017) and [PostgreSQL Tutotiral](https://www.postgresqltutorial.com/what-is-postgresql/) website.

![](http://db.cs.berkeley.edu/www/database.gif)

**Why PostgreSQL?**

1. Open-sourced
2. Popular (large community)
3. Fast
4. Compatible with many languages (e.g., C, SQL, R, Python)
5. Smart. PostgreSQL helps to use databases as a platform to run data-intensive applications.
6. Developed by Berkeley computer science researchers ([POSTGRES 4.2](https://dsf.berkeley.edu/postgres.html))

**Why not?**

If you don't need the advanced features of the PostgreSQL for what you want to do. For instance, if you were a single user of the database and what you want do is a light application, then using [SQLite](https://www.sqlite.org/index.html) would be sufficient.

## Installation

In Ubuntu (a Linux distribution), installing postgresql is pretty easy and straightforward.

[`sudo`](https://help.ubuntu.com/kubuntu/desktopguide/C/root-and-sudo.html) = `superuser do` (giving administrative access to your system)

```console

# Install
sudo apt update
sudo apt install postgresql postgresql-contrib
```

If you use different operation systems (e.g., Windows and Mac), then take a look at this [official platform-specific guideline for installation](https://www.postgresql.org/docs/9.3/installation.html) documented by postgresql.org.

## Administration tools

- psql (a command line interface)
- pgAdmin (a popular GUI tool; a good entry point for PostgreSQL). Our focus today.
- phpPgAdmin
- Adminer

## References

- [PostgreSQL: Up and Running, A Practical Guide to the Advanced Open Source Database](http://shop.oreilly.com/product/0636920052715.do) by Regina Obe and Leo Hsu (O'Reilly Media 2017)
- [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)
