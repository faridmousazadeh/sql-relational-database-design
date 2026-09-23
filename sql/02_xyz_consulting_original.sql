USE xyz
GO

DROP TABLE IF EXISTS xyz_consulting
GO

CREATE TABLE xyz_consulting
(
    project_id int NOT NULL,
    project_name varchar(50) NOT NULL,
    employee_id int NOT NULL,
    employee_name varchar(50) NOT NULL,
    rate_category char(1) NOT NULL,
    rate_amount money NOT NULL,
    billable_hours int NOT NULL,
    total_billed money NOT NULL,
    CONSTRAINT pk_xyz_consulting PRIMARY KEY(project_id, employee_id)
)

INSERT INTO xyz_consulting VALUES
(1023,'Madagascar travel site',11,'Carol Ling','A',60.00,5,300.00),
(1023,'Madagascar travel site',12,'Chip Atooth','B',50.00,10,500.00),
(1023,'Madagascar travel site',16,'Charlie Horse','C',40.00,2,80.00),
(1056,'Online estate agency',11,'Carol Ling','D',90.00,5,450.00),
(1056,'Online estate agency',17,'Avi Maria','B',50.00,2,100.00),
(1099,'Open travel network',11,'Carol Ling','A',60.00,6,360.00),
(1099,'Open travel network',12,'Chip Atooth','C',40.00,8,320.00),
(1099,'Open travel network',14,'Arnie Hurtz','D',90.00,3,270.00)
GO

SELECT DISTINCT project_id, project_name
FROM xyz_consulting
ORDER BY project_name

