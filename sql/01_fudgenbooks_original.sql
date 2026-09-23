USE demo
GO

DROP TABLE IF EXISTS fudgenbooks
GO

CREATE TABLE fudgenbooks
(
    isbn varchar(20) NOT NULL,
    title varchar(50) NOT NULL,
    price money,
    author1 varchar(20) NOT NULL,
    author2 varchar(20) NULL,
    author3 varchar(20) NULL,
    subjects varchar(100) NOT NULL,
    pages int NOT NULL,
    pub_no int NOT NULL,
    pub_name varchar(50) NOT NULL,
    pub_website varchar(50) NOT NULL,
    CONSTRAINT pk_fudgenbooks_isbn PRIMARY KEY (isbn)
)
GO

INSERT INTO fudgenbooks VALUES
('372317842','Introduction to Money Laundering',29.95,'Mandafort','Made-Off',NULL,'scams,money laundering',367,101,'Rypoff','http://www.rypoffpublishing.com'),
('472325845','Imbezzle Like a Pro',34.95,'Made-Off','Moneesgon',NULL,'imbezzle,scams',670,101,'Rypoff','http://www.rypoffpublishing.com'),
('535621977','The Internet Scammer''s Bible',44.95,'Screwm','Sucka',NULL,'phising,id theft,scams',944,102,'BS Press','http://www.bspress.com/books'),
('635619239','Art of the Ponzi Scheme',39.95,'Dewey','Screwm','Howe','scams,ponzi',450,102,'BS Press','http://www.bspress.com/books')
GO

SELECT *
FROM fudgenbooks

