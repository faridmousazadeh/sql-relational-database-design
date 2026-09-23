# SQL Relational Database Design & Normalization

## Overview

This repository contains SQL Server relational database design and normalization coursework for IST 659. The FudgeBooks and XYZ Consulting exercises show transitions from source tables containing repeated or dependent information to related tables with keys and relationships.

The repository includes original-submission scripts, portfolio copies, and numbered SQL scripts. The original-submission files preserve the coursework source. The portfolio copies are organized/formatted versions for portfolio presentation; the XYZ Consulting portfolio copy also contains the documented `ORDER BY project_nameS` to `ORDER BY project_name` correction.

## Course

**IST 659 — Data Administration Concepts and Database Management**  
Syracuse University

## Objectives

- Identify repeated and dependent information in source tables.
- Represent books, publishers, authors, and subjects in related FudgeBooks tables.
- Separate project, employee, and rate information from assignment data in XYZ Consulting.
- Demonstrate 1NF, 2NF, and 3NF stages where shown in the coursework.
- Define primary keys, composite keys, foreign keys, and associative/bridge tables.

## Technical Skills

- SQL Server / T-SQL
- Relational database design
- 1NF, 2NF, and 3NF concepts
- Primary keys, composite primary keys, and foreign keys
- Lookup and associative/bridge tables
- DDL and DML
- `SELECT INTO` and `DISTINCT`
- `UNION` and `UNPIVOT`
- `STRING_SPLIT` with `CROSS APPLY`
- `CREATE TABLE`, `ALTER TABLE`, and `DROP TABLE IF EXISTS`

## Database / Architecture

### FudgeBooks

The original `fudgenbooks` table stores up to three authors in separate columns, subjects as comma-delimited text, and publisher details alongside each book.

The normalization script creates an intermediate `fudgenbooks_1nf` table and then separates the data into:

- `fb_books` for book details, with `pub_no` referencing the publisher
- `fb_publishers` for publisher details
- `fb_authors` and `fb_book_authors` for authors and book-author associations
- `fb_subjects` and `fb_book_subjects` for subjects and book-subject associations

The associative/bridge tables use composite primary keys and foreign keys to the related book, author, or subject tables. The SQL uses `UNION` and `UNPIVOT` for author data, `STRING_SPLIT` with `CROSS APPLY` for subject data, and `DISTINCT` for lookup data.

### XYZ Consulting

The original `xyz_consulting` table stores project and employee details, rate information, billable hours, and total billed under the composite key `(project_id, employee_id)`.

The SQL creates project and employee tables and an intermediate `xyz_consulting_2nf` table. It then separates rate category and rate amount into `xyz_rates` and creates `xyz_consulting_3nf`, which retains project ID, employee ID, rate category, and billable hours. The final table uses `(project_id, employee_id)` as its composite primary key and has foreign keys to the project, employee, and rate tables.

The repository’s [database design notes](docs/database-design.md) include Mermaid ER diagrams and describe the documented relationships.

## Key SQL Techniques

The scripts demonstrate:

- `SELECT INTO` to create tables from query results
- `DISTINCT` and `UNION` to form lookup data
- `UNPIVOT` to transform author columns into book-author associations
- `STRING_SPLIT` with `CROSS APPLY` to separate comma-delimited subjects
- DDL to create tables and add primary-key and foreign-key constraints
- DML to populate source tables
- `DROP TABLE IF EXISTS` in table setup and migration scripts

## Project Structure

```text
sql-relational-database-design/
├── README.md
├── .gitignore
├── docs/
│   ├── database-design.md
│   └── verification-notes.md
└── sql/
    ├── 01_fudgenbooks_original.sql
    ├── 02_xyz_consulting_original.sql
    ├── 03_xyz_consulting_normalization.sql
    ├── original-submission/
    │   ├── fudgenbooks_normalization_original.sql
    │   └── xyz_consulting_normalization_original.sql
    └── portfolio/
        ├── fudgenbooks_normalization.sql
        └── xyz_consulting_normalization.sql
```

The `original-submission/` and `portfolio/` folders hold separate versions of the normalization scripts. The numbered scripts remain in `sql/` as separate source/setup and normalization files.

## Source Integrity and Provenance

The `sql/original-submission/` files preserve the submitted normalization scripts. The `sql/portfolio/` files are formatted copies for portfolio review; the two versions have not been merged.

The FudgeBooks portfolio copy matches the original-submission SQL after ignoring comments, whitespace, and keyword casing.

The XYZ Consulting portfolio copy differs in one SQL statement: it changes `ORDER BY project_nameS` to `ORDER BY project_name`. The original file is preserved with its original statement. The portfolio copy also includes a header comment and formatting changes.

## Verification / Limitations

[`docs/verification-notes.md`](docs/verification-notes.md) documents the source files reviewed and the portfolio cleanup. It does not provide SQL Server execution logs, query output, or screenshots. This README therefore describes the SQL contained in the repository without claiming runtime verification.

The SQL includes table drops and database setup statements. Review the target database and current data before running these scripts.

## Key Takeaways

The coursework demonstrates how source tables can be reorganized into related relational tables, with lookup and associative/bridge tables, composite keys, and foreign-key relationships. The examples also show SQL techniques used to transform repeating author and subject data and to separate project, employee, and rate information.

## Course Context

This repository contains FudgeBooks and XYZ Consulting database design and normalization coursework for **IST 659 — Data Administration Concepts and Database Management** at Syracuse University. The files reviewed do not identify a Problem Set number.
