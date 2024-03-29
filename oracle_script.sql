-- CREATE TABLE 1
CREATE TABLE VKS.BPM_DEPARTMENTS
(
    i INTEGER GENERATED BY DEFAULT AS IDENTITY,
    DEPARTMENT VARCHAR2(100),
    PRIMARY KEY (i)
);

GRANT SELECT ON VKS.BPM_DEPARTMENTS TO C##CDC_PRIVS;
insert into VKS.BPM_DEPARTMENTS (DEPARTMENT) values ('Accounting');
insert into VKS.BPM_DEPARTMENTS (DEPARTMENT) values ('Marketing');
insert into VKS.BPM_DEPARTMENTS (DEPARTMENT) values ('Selling');
insert into VKS.BPM_DEPARTMENTS (DEPARTMENT) values ('HR');
COMMIT;

UPDATE VKS.BPM_DEPARTMENTS SET DEPARTMENT = 'Sales' WHERE DEPARTMENT = 'Selling';
DELETE VKS.BPM_DEPARTMENTS where DEPARTMENT = 'Marketing';
COMMIT;

-- CREATE TABLE 2
CREATE TABLE VKS.BPM_EMPLOYEES
(
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR2(100),
    CONSTRAINT PK_ID PRIMARY KEY (ID)
);
GRANT SELECT ON VKS.BPM_EMPLOYEES TO C##CDC_PRIVS;
insert into VKS.BPM_EMPLOYEES (name) values ('Jessica');
insert into VKS.BPM_EMPLOYEES (name) values ('John');
insert into VKS.BPM_EMPLOYEES (name) values ('Alex');
COMMIT;

UPDATE VKS.BPM_EMPLOYEES SET name = 'Axol' WHERE name = 'Alex';
DELETE VKS.BPM_EMPLOYEES where name = 'John';
COMMIT;

-- DDL
ALTER TABLE VKS.BPM_EMPLOYEES ADD (SURNAME VARCHAR2(100));
insert into VKS.BPM_EMPLOYEES (name, surname) values ('Harry', 'Potter');
commit;
