# SQL Relational Database Design & Normalization

**IST 659 — Data Administration Concepts and Database Management**  
**Syracuse University | Farid Mousazadeh**

## Project overview

This project presents two SQL Server database design and normalization exercises completed for IST 659. The work starts with denormalized source tables and restructures them into related tables with explicit keys, lookup tables, bridge tables, and referential integrity.

- **FudgeBooks:** separates books, publishers, authors, and subjects into related tables.
- **XYZ Consulting:** separates project, employee, and rate data from the project/employee assignment relationship.

## Skills demonstrated

- SQL Server / T-SQL and relational database design
- 1NF, 2NF, and 3NF concepts; partial and transitive dependencies
- Primary keys, foreign keys, and referential integrity
- Lookup and bridge tables
- `SELECT INTO`, `DISTINCT`, `UNION`, and `UNPIVOT`
- `STRING_SPLIT` with `CROSS APPLY`
- DDL and DML

## FudgeBooks design

The original `fudgenbooks` table stores multiple authors in separate columns, multiple subjects in a comma-delimited column, and publisher attributes alongside each book. The normalized design creates `fb_books`, `fb_publishers`, `fb_authors`, `fb_book_authors`, `fb_subjects`, and `fb_book_subjects`.

The source SQL uses `UNION` to form the author lookup, `UNPIVOT` to create book-author relationships, and `STRING_SPLIT` with `CROSS APPLY` to separate subject values. The entity relationships and normalization path are documented in [`docs/database-design.md`](docs/database-design.md).

## XYZ Consulting design

The original `xyz_consulting` table stores project names, employee names, and rate amounts with each project/employee assignment. The normalized design creates `xyz_projects`, `xyz_employees`, `xyz_rates`, and `xyz_consulting_3nf`, using `(project_id, employee_id)` as the assignment table's composite primary key.

The source SQL creates an intermediate `xyz_consulting_2nf` table before deriving the rate lookup and final assignment table. See [`docs/database-design.md`](docs/database-design.md) for the ERD and relationships.

## Repository structure

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

## Source integrity

The `sql/original-submission/` scripts preserve the submitted normalization SQL. The `sql/portfolio/` scripts are formatted portfolio copies. The XYZ portfolio copy changes the apparent `ORDER BY project_nameS` typo to `ORDER BY project_name`; the original remains unchanged to preserve a clear source trail.

The numbered scripts provide the source table setup and a separate XYZ normalization script. SQL Server database prerequisites and source verification details are in [`docs/verification-notes.md`](docs/verification-notes.md).

This repository does not claim execution results that are not documented in the supplied source materials.

