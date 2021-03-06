CREATE TABLE COUNTRIES 
(
  COUNTRY_ID NUMBER(*, 0) NOT NULL 
, COUNTRY_NAME VARCHAR2(60 BYTE) 
, REGION_ID NUMBER(*, 0) 
, CONSTRAINT COUNTRIES_PK PRIMARY KEY 
  (
    COUNTRY_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX COUNTRIES_PK ON COUNTRIES (COUNTRY_ID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NOPARALLEL;

ALTER TABLE COUNTRIES
ADD CONSTRAINT COUNTRIES_FK1 FOREIGN KEY
(
  REGION_ID 
)
REFERENCES REGIONS
(
  REGION_ID 
)
ENABLE;



CREATE TABLE DEPARTMENTS 
(
  DEPARTMENT_ID NUMBER(*, 0) NOT NULL 
, DEPARTMENT_NAME VARCHAR2(120 BYTE) 
, MANAGER_ID NUMBER(*, 0) 
, LOCATION_ID NUMBER(*, 0) 
, CONSTRAINT DEPARTMENTS_PK PRIMARY KEY 
  (
    DEPARTMENT_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX DEPARTMENTS_PK ON DEPARTMENTS (DEPARTMENT_ID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NOPARALLEL;

ALTER TABLE DEPARTMENTS
ADD CONSTRAINT DEPARTMENTS_FK1 FOREIGN KEY
(
  LOCATION_ID 
)
REFERENCES LOCATIONS
(
  LOCATION_ID 
)
ENABLE;

ALTER TABLE DEPARTMENTS
ADD CONSTRAINT DEPARTMENTS_FK2 FOREIGN KEY
(
  MANAGER_ID 
)
REFERENCES EMPLOYEES
(
  EMPLOYEE_ID 
)
ENABLE;




CREATE TABLE EMPLOYEES 
(
  EMPLOYEE_ID NUMBER(*, 0) NOT NULL 
, FIRST_NAME VARCHAR2(60 BYTE) 
, LAST_NAME VARCHAR2(120 BYTE) 
, EMAIL VARCHAR2(180 BYTE) 
, PHONE_NUMBER VARCHAR2(40 BYTE) 
, HIRE_DATE DATE 
, JOB_ID NUMBER(*, 0) 
, SALARY FLOAT(126) 
, COMMISSION_PCT FLOAT(126) 
, MANAGER_ID NUMBER(*, 0) 
, DEPARTMENT_ID NUMBER(*, 0) 
, CONSTRAINT EMPLOYEES_PK PRIMARY KEY 
  (
    EMPLOYEE_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX EMPLOYEES_PK ON EMPLOYEES (EMPLOYEE_ID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NOPARALLEL;

ALTER TABLE EMPLOYEES
ADD CONSTRAINT EMPLOYEES_FK1 FOREIGN KEY
(
  JOB_ID 
)
REFERENCES JOBS
(
  JOB_ID 
)
ENABLE;

ALTER TABLE EMPLOYEES
ADD CONSTRAINT EMPLOYEES_FK2 FOREIGN KEY
(
  DEPARTMENT_ID 
)
REFERENCES DEPARTMENTS
(
  DEPARTMENT_ID 
)
ENABLE;

ALTER TABLE EMPLOYEES
ADD CONSTRAINT EMPLOYEES_SELF_FK FOREIGN KEY
(
  MANAGER_ID 
)
REFERENCES EMPLOYEES
(
  EMPLOYEE_ID 
)
ENABLE;



CREATE TABLE JOB_HISTORY 
(
  EMPLOYEE_ID NUMBER(*, 0) NOT NULL 
, START_DATE DATE NOT NULL 
, END_DATE DATE 
, JOB_ID NUMBER(*, 0) 
, DEPARTMENT_ID NUMBER(*, 0) 
, CONSTRAINT JOB_HISTORY_PK PRIMARY KEY 
  (
    EMPLOYEE_ID 
  , START_DATE 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX JOB_HISTORY_PK ON JOB_HISTORY (EMPLOYEE_ID ASC, START_DATE ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NOPARALLEL;

ALTER TABLE JOB_HISTORY
ADD CONSTRAINT JOB_HISTORY_FK1 FOREIGN KEY
(
  JOB_ID 
)
REFERENCES JOBS
(
  JOB_ID 
)
ENABLE;

ALTER TABLE JOB_HISTORY
ADD CONSTRAINT JOB_HISTORY_FK2 FOREIGN KEY
(
  DEPARTMENT_ID 
)
REFERENCES DEPARTMENTS
(
  DEPARTMENT_ID 
)
ENABLE;

ALTER TABLE JOB_HISTORY
ADD CONSTRAINT JOB_HISTORY_FK3 FOREIGN KEY
(
  EMPLOYEE_ID 
)
REFERENCES EMPLOYEES
(
  EMPLOYEE_ID 
)
ENABLE;



CREATE TABLE JOBS 
(
  JOB_ID NUMBER(*, 0) NOT NULL 
, JOB_TITLE VARCHAR2(80 BYTE) 
, MIN_SALARY FLOAT(126) 
, MAX_SALARY FLOAT(126) 
, CONSTRAINT JOBS_PK PRIMARY KEY 
  (
    JOB_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX JOBS_PK ON JOBS (JOB_ID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NOPARALLEL;

ALTER TABLE JOBS
ADD CONSTRAINT JOB_CHECK1 CHECK 
((max_salary-min_salary) >= 2000)
ENABLE;



CREATE TABLE LOCATIONS 
(
  LOCATION_ID NUMBER(*, 0) NOT NULL 
, STREET_ADDRESS VARCHAR2(100 BYTE) 
, POSTAL_CODE VARCHAR2(8 BYTE) 
, CITY VARCHAR2(40 BYTE) 
, STATE_PROVINCE VARCHAR2(80 BYTE) 
, COUNTRY_ID NUMBER(*, 0) 
, CONSTRAINT LOCATION_PK PRIMARY KEY 
  (
    LOCATION_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX LOCATION_PK ON LOCATIONS (LOCATION_ID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NOPARALLEL;

ALTER TABLE LOCATIONS
ADD CONSTRAINT LOCATIONS_FK1 FOREIGN KEY
(
  COUNTRY_ID 
)
REFERENCES COUNTRIES
(
  COUNTRY_ID 
)
ENABLE;



CREATE TABLE REGIONS 
(
  REGION_ID NUMBER(*, 0) NOT NULL 
, REGION_NAME VARCHAR2(120 BYTE) 
, CONSTRAINT REGIONS_PK PRIMARY KEY 
  (
    REGION_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX REGIONS_PK ON REGIONS (REGION_ID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NOPARALLEL;
