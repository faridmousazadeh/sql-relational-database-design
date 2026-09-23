USE xyz
GO

-- 1NF
-- The submitted reflection states that xyz_consulting was already in 1NF:
-- values are atomic and there are no repeating or multivalued attributes.

-- 2NF: separate project and employee dependencies

DROP TABLE IF EXISTS xyz_projects
GO

SELECT DISTINCT
    project_id,
    project_name
INTO xyz_projects
FROM xyz_consulting
GO

ALTER TABLE xyz_projects
ADD CONSTRAINT pk_xyz_projects PRIMARY KEY (project_id)
GO

SELECT * FROM xyz_projects
GO


DROP TABLE IF EXISTS xyz_employees
GO

SELECT DISTINCT
    employee_id,
    employee_name
INTO xyz_employees
FROM xyz_consulting
GO

ALTER TABLE xyz_employees
ADD CONSTRAINT pk_xyz_employees PRIMARY KEY (employee_id)
GO

SELECT * FROM xyz_employees
GO


DROP TABLE IF EXISTS xyz_consulting_2nf
GO

SELECT
    project_id,
    employee_id,
    rate_category,
    rate_amount,
    billable_hours,
    total_billed
INTO xyz_consulting_2nf
FROM xyz_consulting
GO

ALTER TABLE xyz_consulting_2nf
ADD CONSTRAINT pk_xyz_consulting_2nf
PRIMARY KEY (project_id, employee_id)
GO

SELECT * FROM xyz_consulting_2nf
GO


-- 3NF: remove the transitive dependency between rate category and rate amount

DROP TABLE IF EXISTS xyz_rates
GO

SELECT DISTINCT
    rate_category,
    rate_amount
INTO xyz_rates
FROM xyz_consulting_2nf
GO

ALTER TABLE xyz_rates
ADD CONSTRAINT pk_xyz_rates PRIMARY KEY (rate_category)
GO

SELECT * FROM xyz_rates
GO


DROP TABLE IF EXISTS xyz_consulting_3nf
GO

SELECT
    project_id,
    employee_id,
    rate_category,
    billable_hours
INTO xyz_consulting_3nf
FROM xyz_consulting_2nf
GO

ALTER TABLE xyz_consulting_3nf
ADD CONSTRAINT pk_xyz_consulting_3nf
PRIMARY KEY (project_id, employee_id)
GO

SELECT * FROM xyz_consulting_3nf
GO


-- Reintroduce foreign keys

ALTER TABLE xyz_consulting_3nf
ADD CONSTRAINT fk_xyz_consulting_projects
FOREIGN KEY (project_id) REFERENCES xyz_projects(project_id)
GO

ALTER TABLE xyz_consulting_3nf
ADD CONSTRAINT fk_xyz_consulting_employees
FOREIGN KEY (employee_id) REFERENCES xyz_employees(employee_id)
GO

ALTER TABLE xyz_consulting_3nf
ADD CONSTRAINT fk_xyz_consulting_rates
FOREIGN KEY (rate_category) REFERENCES xyz_rates(rate_category)
GO

