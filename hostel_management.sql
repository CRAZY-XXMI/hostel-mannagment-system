CREATE DATABASE HOSTEL_MANAGEMENT_SYSTEM02;
USE HOSTEL_MANAGEMENT_SYSTEM02;

CREATE TABLE PERSON(
	USER_ID INT NOT NULL,
    FNAME VARCHAR(50),
    LNAME VARCHAR(50),
    EMAIL_ID VARCHAR(50),
    PRIMARY KEY(USER_ID),
    UNIQUE(EMAIL_ID)
    );

CREATE TABLE HOSTEL(
	NO_OF_STUDENTS INT UNIQUE, -- We only have one hostel with multiple blocks and mess.
    NO_OF_BLOCKS INT UNIQUE,
    NO_OF_MESS INT UNIQUE,
    HOS_NAME VARCHAR(50) NOT NULL,
    PRIMARY KEY(HOS_NAME)
    );
    

    
CREATE TABLE HOSTEL_MANAGER(
	USER_ID INT, -- There is only one hostel manager but every block has it's seperate manager.
	FOREIGN KEY (USER_ID) REFERENCES PERSON(USER_ID)
	);
    
CREATE TABLE MESS(
	MESS_ID INT PRIMARY KEY,
    NO_OF_STUDENTS INT
);


CREATE TABLE BLOCK(
	BLOCK_ID INT PRIMARY KEY,
    NO_OF_STUDENTS INT,
    NO_OF_ROOMS INT
    );
    
   
CREATE TABLE ROOM(
	ROOM_ID INT NOT NULL,
    BLOCK_ID INT NOT NULL,
    FOREIGN KEY (BLOCK_ID) REFERENCES BLOCK(BLOCK_ID),
    PRIMARY KEY(ROOM_ID, BLOCK_ID)
);

CREATE TABLE STUDENT(
	USER_ID INT ,
    MESS_ID INT,
    ROOM_ID INT,
    BLOCK_ID INT,
    YEAR_OF_STUDY INT,
    FOREIGN KEY (USER_ID) REFERENCES PERSON(USER_ID),
    FOREIGN KEY (MESS_ID) REFERENCES MESS(MESS_ID),
    FOREIGN KEY (ROOM_ID) REFERENCES ROOM(ROOM_ID),
    UNIQUE(BLOCK_ID, ROOM_ID), -- Every room has one student only
    PRIMARY KEY(USER_ID)
);

CREATE TABLE MOBILENO(
	USER_ID INT,
	MOB_NO VARCHAR(12),
	FOREIGN KEY (USER_ID) REFERENCES PERSON(USER_ID),
    PRIMARY KEY(MOB_NO)
);

CREATE TABLE MESSVENDOR(
	USER_ID INT NOT NULL,
    MESS_ID INT UNIQUE NOT NULL, -- Every mess has one mess vendor
	FOREIGN KEY (USER_ID) REFERENCES PERSON(USER_ID),
    FOREIGN KEY (MESS_ID) REFERENCES MESS(MESS_ID),
    PRIMARY KEY(USER_ID)
);


CREATE TABLE BLOCKMANAGER(
	USER_ID INT NOT NULL,
    BLOCK_ID INT NOT NULL UNIQUE, -- Every block has one block manager
	FOREIGN KEY (USER_ID) REFERENCES PERSON(USER_ID),
    FOREIGN KEY (BLOCK_ID) REFERENCES BLOCK(BLOCK_ID),
    PRIMARY KEY(USER_ID)
);


CREATE TABLE STAFF(
	USER_ID INT NOT NULL,
    BLOCK_ID INT, -- Every block has seperate staff
    SALARY INT, 
	FOREIGN KEY (USER_ID) REFERENCES PERSON(USER_ID),
    FOREIGN KEY (BLOCK_ID) REFERENCES BLOCK(BLOCK_ID),
    PRIMARY KEY(USER_ID)
);

CREATE TABLE VISITOR(
	USER_ID INT,
    IN_TIME TIME,
    OUT_TIME TIME,
    VISIT_DATE DATE,
	FOREIGN KEY (USER_ID) REFERENCES PERSON(USER_ID),
    UNIQUE(USER_ID, OUT_TIME, VISIT_DATE),
    PRIMARY KEY(USER_ID, IN_TIME, VISIT_DATE)
);


CREATE TABLE DOCTOR(
	USER_ID INT,
    DEGREE VARCHAR(10),
	FOREIGN KEY (USER_ID) REFERENCES PERSON(USER_ID),
     PRIMARY KEY(USER_ID)
);

CREATE TABLE WARDEN(
	USER_ID INT,
    WARDEN_TYPE VARCHAR(10), -- Male or Female
	FOREIGN KEY (USER_ID) REFERENCES PERSON(USER_ID),
    PRIMARY KEY(USER_ID)
);

CREATE TABLE WATCHMAN(
	USER_ID INT,
    SHIFT VARCHAR(10), -- Morning or Evening
	FOREIGN KEY (USER_ID) REFERENCES PERSON(USER_ID)
);


insert into PERSON
VALUES
(1, 'Ashok', 'Ghait', 'vasnibass@gmail.com'),
(2, 'Baldeep', 'Singh', 'baldeep@gmail.com'),
(3, 'Karan', 'Jaybhay', 'karan3@gmail.com'),
(4, 'Amar', 'Kulwal', 'amar94@gmail.com'),
(5, 'Pradeep', 'Kothare', 'pradeep93@gmail.com'),
(6, 'Swati', 'Yerekar', 'swati98@gmail.com'),
(7, 'Deepak', 'Pathak', 'deepak51@gmail.com'),
(8, 'Leiba', 'Walayat', 'leiba52@gmail.com'),
(9, 'Anand', 'Kumar', 'anand53@gmail.com'),
(10, 'Preeti', 'Pathak', 'preeti21@gmail.com'),
(11, 'Darpan', 'Kanani', 'DARPAN53@gmail.com'),
(12, 'Farhan', 'Kumar', 'faraar1@gmail.com'),
(13, 'Rahul','Morey','rah@gmail.com');
INSERT INTO HOSTEL VALUES (25, 2, 2,'Arawali');

INSERT INTO MESS VALUES('1', '8'), ('2', '10');

INSERT INTO BLOCK VALUES (1,12,20), (2,6,20);

INSERT INTO ROOM 
VALUES  ('101', '1'),('102', '1'),('103', '1'),('104', '1'),('201', '1'),('202', '1'),('203', '1'),('204', '1'),('301', '1'),('302', '1'),
        ('303', '1'),('304', '1'),('401', '1'),('402', '1'),('403', '1'),('404', '1'),('501', '1'),('502', '1'),('503', '1'),('504', '1'),
         ('101', '2'),('102', '2'),('103', '2'),('104', '2'),('201', '2'),('202', '2'),('203', '2'),('204', '2'),('301', '2'),('302', '2'),
        ('303', '2'),('304', '2'),('401', '2'),('402', '2'),('403', '2'),('404', '2'),('501', '2'),('502', '2'),('503', '2'),('504', '2');
        
insert into STUDENT 
VALUES	('9', '1', '101', '1', '2020'),(10,1,102,1,2021),(11,2,201,2,2019),(12,1,202,2,2019);

insert into MESSVENDOR VALUES('4', '2'), (5,1);
INSERT INTO BLOCKMANAGER VALUES('2', '1'),(3,2);

INSERT INTO VISITOR VALUES	('8', '12:23:53', '13:45:21', '2022-02-12'),
							('13', '14:23:33', '16:45:12', '2022-02-15');

insert into doctor values (6,'MBBS');
insert into watchman values(7,'Morning');


