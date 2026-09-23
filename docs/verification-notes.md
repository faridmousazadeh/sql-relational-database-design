# Verification Notes

## Source files verified

The project was rebuilt from the user's available SQL source files.

### FudgeBooks

Verified source: `sql/original-submission/fudgenbooks_normalization_original.sql`

The source contains the original `fudgenbooks` table and the normalization steps that create:

- `fb_subjects`
- `fudgenbooks_1nf`
- `fb_books`
- `fb_publishers`
- `fb_authors`
- `fb_book_authors`
- `fb_book_subjects`

It also adds foreign keys connecting the bridge/lookup tables after migration.

### XYZ Consulting

Verified source: `sql/original-submission/xyz_consulting_normalization_original.sql`

The source creates:

- `xyz_projects`
- `xyz_employees`
- `xyz_consulting_2nf`
- `xyz_rates`
- `xyz_consulting_3nf`

and adds foreign keys from the final relationship table to projects, employees, and rates.

## Portfolio cleanup

The portfolio XYZ script changes only the apparent `ORDER BY project_nameS` typo to `ORDER BY project_name`. The original file remains untouched in `sql/original-submission/` so the portfolio keeps a clear audit trail to the source.

