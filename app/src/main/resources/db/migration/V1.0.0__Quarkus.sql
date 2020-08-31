DROP TABLE IF EXISTS CUSTOMER CASCADE;
DROP TABLE IF EXISTS ADDRESS CASCADE;
DROP TABLE IF EXISTS ACCOUNT CASCADE;
DROP TABLE IF EXISTS PRODUCT CASCADE;
DROP TABLE IF EXISTS HOLDINGS CASCADE;


CREATE TABLE CUSTOMER
(
   SSN char(10),
   FIRSTNAME varchar(64),
   LASTNAME varchar(64),
   PHONE varchar(15),
   CONSTRAINT CUSTOMER_PK PRIMARY KEY(SSN)
);

CREATE TABLE ADDRESS
(
   SSN char(10),
   ST_ADDRESS varchar(256),
   APT_NUMBER varchar(32),
   CITY varchar(64),
   STATE varchar(32),
   ZIPCODE varchar(10),
   CONSTRAINT ADDRESS_FK FOREIGN KEY(SSN) REFERENCES CUSTOMER(SSN)
);

CREATE TABLE ACCOUNT
(
   ACCOUNT_ID integer,
   SSN char(10),
   STATUS char(10),
   TYPE char(10),
   DATEOPENED timestamp,
   DATECLOSED timestamp,
   CONSTRAINT ACCOUNT_PK PRIMARY KEY(ACCOUNT_ID),
   CONSTRAINT CUSTOMER_FK FOREIGN KEY(SSN) REFERENCES CUSTOMER(SSN)
);


CREATE TABLE  PRODUCT (
   ID integer,
   SYMBOL varchar(16),
   COMPANY_NAME varchar(256),
   CONSTRAINT PRODUCT_PK PRIMARY KEY(ID)
);


CREATE TABLE  HOLDINGS
(
   TRANSACTION_ID serial,
   ACCOUNT_ID integer,
   PRODUCT_ID integer,
   PURCHASE_DATE timestamp,
   SHARES_COUNT integer,
   CONSTRAINT HOLDINGS_PK PRIMARY KEY (TRANSACTION_ID),
   CONSTRAINT ACCOUNT_FK FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT(ACCOUNT_ID),
   CONSTRAINT PRODUCT_FK FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCT(ID)
);


INSERT INTO CUSTOMER (SSN,FIRSTNAME,LASTNAME,PHONE) VALUES ('CST01002','John','Doe','(646)555-1776');
INSERT INTO CUSTOMER (SSN,FIRSTNAME,LASTNAME,PHONE) VALUES ('CST01003','Bob','Smith','(412)555-4327');
INSERT INTO CUSTOMER (SSN,FIRSTNAME,LASTNAME,PHONE) VALUES ('CST01004','Jane','Aire','(814)555-6789');
INSERT INTO CUSTOMER (SSN,FIRSTNAME,LASTNAME,PHONE) VALUES ('CST01005','Charles','Jones','(203)555-3947');
INSERT INTO CUSTOMER (SSN,FIRSTNAME,LASTNAME,PHONE) VALUES ('CST01006','Virginia','Jefferson','(718)555-2693');
INSERT INTO CUSTOMER (SSN,FIRSTNAME,LASTNAME,PHONE) VALUES ('CST01007','Ralph','Bacon','(704)555-4576');
INSERT INTO CUSTOMER (SSN,FIRSTNAME,LASTNAME,PHONE) VALUES ('CST01008','Bonnie','Dragon','(904)555-6514');
INSERT INTO CUSTOMER (SSN,FIRSTNAME,LASTNAME,PHONE) VALUES ('CST01009','Herbert','Smith','(971)555-7803');
INSERT INTO CUSTOMER (SSN,FIRSTNAME,LASTNAME,PHONE) VALUES ('CST01015','Jack','Corby','(469)555-8023');
INSERT INTO CUSTOMER (SSN,FIRSTNAME,LASTNAME,PHONE) VALUES ('CST01019','Robin','Evers','(470)555-4390');
INSERT INTO CUSTOMER (SSN,FIRSTNAME,LASTNAME,PHONE) VALUES ('CST01020','Lloyd','Abercrombie','(213)555-2312');
INSERT INTO CUSTOMER (SSN,FIRSTNAME,LASTNAME,PHONE) VALUES ('CST01021','Scott','Watters','(206)555-6790');
INSERT INTO CUSTOMER (SSN,FIRSTNAME,LASTNAME,PHONE) VALUES ('CST01022','Sandra','King','(651)555-9017');
INSERT INTO CUSTOMER (SSN,FIRSTNAME,LASTNAME,PHONE) VALUES ('CST01027','Maryanne','Peters','(513)555-9067');
INSERT INTO CUSTOMER (SSN,FIRSTNAME,LASTNAME,PHONE) VALUES ('CST01034','Corey','Snyder','(617)555-3546');
INSERT INTO CUSTOMER (SSN,FIRSTNAME,LASTNAME,PHONE) VALUES ('CST01035','Henry','Thomas','(415)555-2093');
INSERT INTO CUSTOMER (SSN,FIRSTNAME,LASTNAME,PHONE) VALUES ('CST01036','James','Drew','(216)555-6523');


INSERT INTO ADDRESS (SSN,ST_ADDRESS,APT_NUMBER,CITY,STATE,ZIPCODE) VALUES ('CST01002','1234 Main Street','Apartment 56','New York','New York','10174');
INSERT INTO ADDRESS (SSN,ST_ADDRESS,APT_NUMBER,CITY,STATE,ZIPCODE) VALUES ('CST01003','202 Palomino Drive',null,'Pittsburgh','Pennsylvania','15071');
INSERT INTO ADDRESS (SSN,ST_ADDRESS,APT_NUMBER,CITY,STATE,ZIPCODE) VALUES ('CST01004','15 State Street',null,'Philadelphia','Pennsylvania','19154');
INSERT INTO ADDRESS (SSN,ST_ADDRESS,APT_NUMBER,CITY,STATE,ZIPCODE) VALUES ('CST01005','1819 Maple Street','Apartment 17F','Stratford','Connecticut','06614');
INSERT INTO ADDRESS (SSN,ST_ADDRESS,APT_NUMBER,CITY,STATE,ZIPCODE) VALUES ('CST01006','1710 South 51st Street','Apartment 3245','New York','New York','10175');
INSERT INTO ADDRESS (SSN,ST_ADDRESS,APT_NUMBER,CITY,STATE,ZIPCODE) VALUES ('CST01007','57 Barn Swallow Avenue',null,'Charlotte','North Carolina','28205');
INSERT INTO ADDRESS (SSN,ST_ADDRESS,APT_NUMBER,CITY,STATE,ZIPCODE) VALUES ('CST01008','88 Cinderella Lane',null,'Jacksonville','Florida','32225');
INSERT INTO ADDRESS (SSN,ST_ADDRESS,APT_NUMBER,CITY,STATE,ZIPCODE) VALUES ('CST01009','12225 Waterfall Way','Building 100, Suite 9','Portland','Oregon','97220');
INSERT INTO ADDRESS (SSN,ST_ADDRESS,APT_NUMBER,CITY,STATE,ZIPCODE) VALUES ('CST01015','1 Lone Star Way',null,'Dallas','Texas','75231');
INSERT INTO ADDRESS (SSN,ST_ADDRESS,APT_NUMBER,CITY,STATE,ZIPCODE) VALUES ('CST01019','1814 Falcon Avenue',null,'Atlanta','Georgia','30355');
INSERT INTO ADDRESS (SSN,ST_ADDRESS,APT_NUMBER,CITY,STATE,ZIPCODE) VALUES ('CST01020','1954 Hughes Parkway',null,'Los Angeles','California','90099');
INSERT INTO ADDRESS (SSN,ST_ADDRESS,APT_NUMBER,CITY,STATE,ZIPCODE) VALUES ('CST01021','24 Mariner Way',null,'Seattle','Washington','98124');
INSERT INTO ADDRESS (SSN,ST_ADDRESS,APT_NUMBER,CITY,STATE,ZIPCODE) VALUES ('CST01022','96 Lakefront Parkway',null,'Minneapolis','Minnesota','55426');
INSERT INTO ADDRESS (SSN,ST_ADDRESS,APT_NUMBER,CITY,STATE,ZIPCODE) VALUES ('CST01027','35 Grand View Circle','Apartment 5F','Cincinnati','Ohio','45232');
INSERT INTO ADDRESS (SSN,ST_ADDRESS,APT_NUMBER,CITY,STATE,ZIPCODE) VALUES ('CST01034','1760 Boston Commons Avenue','Suite 543','Boston','Massachusetts','02136 ');
INSERT INTO ADDRESS (SSN,ST_ADDRESS,APT_NUMBER,CITY,STATE,ZIPCODE) VALUES ('CST01035','345 Hilltop Parkway',null,'San Francisco','California','94129');
INSERT INTO ADDRESS (SSN,ST_ADDRESS,APT_NUMBER,CITY,STATE,ZIPCODE) VALUES ('CST01036','876 Lakefront Lane',null,'Cleveland','Ohio','44107');



INSERT INTO ACCOUNT (ACCOUNT_ID,SSN,STATUS,TYPE,DATEOPENED,DATECLOSED) VALUES (19980001,'CST01002','Personal  ','Active    ','1998-01-01 00:00:00.000', NULL);
INSERT INTO ACCOUNT (ACCOUNT_ID,SSN,STATUS,TYPE,DATEOPENED,DATECLOSED) VALUES (19980002,'CST01002','Personal  ','Active    ','1998-02-01 00:00:00.000', NULL);
INSERT INTO ACCOUNT (ACCOUNT_ID,SSN,STATUS,TYPE,DATEOPENED,DATECLOSED) VALUES (19980003,'CST01003','Personal  ','Active    ','1998-03-06 00:00:00.000',null);
INSERT INTO ACCOUNT (ACCOUNT_ID,SSN,STATUS,TYPE,DATEOPENED,DATECLOSED) VALUES (19980004,'CST01004','Personal  ','Active    ','1998-03-07 00:00:00.000',null);
INSERT INTO ACCOUNT (ACCOUNT_ID,SSN,STATUS,TYPE,DATEOPENED,DATECLOSED) VALUES (19980005,'CST01005','Personal  ','Active    ','1998-06-15 00:00:00.000',null);
INSERT INTO ACCOUNT (ACCOUNT_ID,SSN,STATUS,TYPE,DATEOPENED,DATECLOSED) VALUES (19980006,'CST01006','Personal  ','Active    ','1998-09-15 00:00:00.000',null);
INSERT INTO ACCOUNT (ACCOUNT_ID,SSN,STATUS,TYPE,DATEOPENED,DATECLOSED) VALUES (19990007,'CST01007','Personal  ','Active    ','1999-01-20 00:00:00.000',null);
INSERT INTO ACCOUNT (ACCOUNT_ID,SSN,STATUS,TYPE,DATEOPENED,DATECLOSED) VALUES (19990008,'CST01008','Personal  ','Active    ','1999-04-16 00:00:00.000',null);
INSERT INTO ACCOUNT (ACCOUNT_ID,SSN,STATUS,TYPE,DATEOPENED,DATECLOSED) VALUES (19990009,'CST01009','Business  ','Active    ','1999-06-25 00:00:00.000',null);
INSERT INTO ACCOUNT (ACCOUNT_ID,SSN,STATUS,TYPE,DATEOPENED,DATECLOSED) VALUES (20000015,'CST01015','Personal  ','Closed    ','2000-04-20 00:00:00.000','2001-06-22 00:00:00.000');
INSERT INTO ACCOUNT (ACCOUNT_ID,SSN,STATUS,TYPE,DATEOPENED,DATECLOSED) VALUES (20000019,'CST01019','Personal  ','Active    ','2000-10-08 00:00:00.000',null);
INSERT INTO ACCOUNT (ACCOUNT_ID,SSN,STATUS,TYPE,DATEOPENED,DATECLOSED) VALUES (20000020,'CST01020','Personal  ','Active    ','2000-10-20 00:00:00.000',null);
INSERT INTO ACCOUNT (ACCOUNT_ID,SSN,STATUS,TYPE,DATEOPENED,DATECLOSED) VALUES (20000021,'CST01021','Personal  ','Active    ','2000-12-05 00:00:00.000',null);
INSERT INTO ACCOUNT (ACCOUNT_ID,SSN,STATUS,TYPE,DATEOPENED,DATECLOSED) VALUES (20010022,'CST01022','Personal  ','Active    ','2001-01-05 00:00:00.000',null);
INSERT INTO ACCOUNT (ACCOUNT_ID,SSN,STATUS,TYPE,DATEOPENED,DATECLOSED) VALUES (20010027,'CST01027','Personal  ','Active    ','2001-08-22 00:00:00.000',null);
INSERT INTO ACCOUNT (ACCOUNT_ID,SSN,STATUS,TYPE,DATEOPENED,DATECLOSED) VALUES (20020034,'CST01034','Business  ','Active    ','2002-01-22 00:00:00.000',null);
INSERT INTO ACCOUNT (ACCOUNT_ID,SSN,STATUS,TYPE,DATEOPENED,DATECLOSED) VALUES (20020035,'CST01035','Personal  ','Active    ','2002-02-12 00:00:00.000',null);
INSERT INTO ACCOUNT (ACCOUNT_ID,SSN,STATUS,TYPE,DATEOPENED,DATECLOSED) VALUES (20020036,'CST01036','Personal  ','Active    ','2002-03-22 00:00:00.000',null);

INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1002,'BA','The Boeing Company');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1004,'VIX','Vix Index');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1006,'BTU','Peabody Energy');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1007,'IBM','International Business Machines Corporation');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1008,'DELL','Dell Computer Corporation');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1010,'HPQ','Hewlett-Packard Company');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1012,'GE','General Electric Company');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1013,'MRK','Merck and Company Incorporated');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1014,'DIS','Walt Disney Company');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1015,'MCD','McDonalds Corporation');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1016,'DOW','Dow Chemical Company');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1018,'GM','General Motors Corporation');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1024,'SBGI','Sinclair Broadcast Group Incorporated');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1025,'COLM','Columbia Sportsware Company');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1026,'COLB','Columbia Banking System Incorporated');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1028,'BAC','Bank Of America');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1029,'CSVFX','Columbia Strategic Value Fund');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1030,'CMTFX','Columbia Technology Fund');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1031,'F','Ford Motor Company');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1033,'CRM','Salesforce');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1034,'SAP','SAP AG');
INSERT INTO PRODUCT (ID,SYMBOL,COMPANY_NAME) VALUES(1036,'TM','Toyota Motor Corporation');

INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19980002,1008,'1998-02-01 00:00:00.000',50);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19980002,1036,'1998-02-01 00:00:00.000',25);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19980003,1002,'1998-03-06 00:00:00.000',100);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19980003,1029,'1998-03-06 00:00:00.000',25);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19980003,1016,'1998-03-06 00:00:00.000',51);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19980005,1024,'1998-06-15 00:00:00.000',18);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19980006,1033,'1998-09-15 00:00:00.000',200);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19990007,1031,'1999-01-20 00:00:00.000',65);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19990008,1012,'1999-04-16 00:00:00.000',102);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19990007,1008,'1999-05-11 00:00:00.000',85);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19990009,1004,'1999-06-25 00:00:00.000',120);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19980003,1024,'1999-07-22 00:00:00.000',150);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (20000015,1018,'2000-04-20 00:00:00.000',135);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19980006,1030,'2000-06-12 00:00:00.000',91);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (20000019,1029,'2000-10-08 00:00:00.000',351);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (20000020,1030,'2000-10-20 00:00:00.000',127);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (20000020,1018,'2000-11-14 00:00:00.000',100);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (20000019,1031,'2000-11-15 00:00:00.000',125);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (20000021,1028,'2000-12-05 00:00:00.000',400);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (20010022,1006,'2001-01-05 00:00:00.000',237);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19990008,1015,'2001-01-23 00:00:00.000',180);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19980005,1025,'2001-03-23 00:00:00.000',125);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (20010027,1024,'2001-08-22 00:00:00.000',70);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (20000020,1006,'2001-11-14 00:00:00.000',125);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19980003,1029,'2001-11-15 00:00:00.000',100);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (20010027,1028,'2001-12-19 00:00:00.000',115);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (20020034,1024,'2002-01-22 00:00:00.000',189);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19990009,1029,'2002-01-24 00:00:00.000',30);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (20020035,1013,'2002-02-12 00:00:00.000',110);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (20020035,1034,'2002-02-13 00:00:00.000',70);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (20000019,1013,'2002-02-26 00:00:00.000',195);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19980004,1007,'2002-03-05 00:00:00.000',250);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (20000021,1014,'2002-03-12 00:00:00.000',300);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (20010027,1024,'2002-03-14 00:00:00.000',136);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (20020036,1012,'2002-03-22 00:00:00.000',54);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (20020036,1010,'2002-03-26 00:00:00.000',189);
INSERT INTO HOLDINGS (ACCOUNT_ID,PRODUCT_ID,PURCHASE_DATE,SHARES_COUNT) VALUES (19980005,1010,'2002-04-01 00:00:00.000',26);
