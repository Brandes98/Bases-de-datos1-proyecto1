/*
Proyecto #1 
Creacion de esquema, tablas y sequences
Autor: Mariana Quesda 
and Brandon Calderon
Fecha de inicio: 24/09/23
�ltima modificaci�n: 28/10/23 9:00 AM

NOTAS:
     Se agregaron los campos de auditoria
*/

CREATE TABLE Action ( --falta una descripcion?
   idAction number(6),
   username varchar2(10),
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table Action
add
constraint pk_idAction PRIMARY KEY (idAction)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);

CREATE SEQUENCE action_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE Binnacle (
   idBinnacle NUMBER(6) ,
   idAction NUMBER(6) CONSTRAINT fk_idAction REFERENCES Action(idAction),
   currentValue VARCHAR2(30) CONSTRAINT binnacle_currentValue_nn NOT NULL,
   previousValue VARCHAR2(30) CONSTRAINT binnacle_previousValue_nn NOT NULL,
   colunmName VARCHAR2(30) CONSTRAINT binnacle_colunmName_nn NOT NULL,
   tableName VARCHAR2(30) CONSTRAINT binnacle_tableName_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table Binnacle
add
constraint pk_idBinnacle PRIMARY KEY (idBinnacle)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);

CREATE SEQUENCE binnacle_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE Country (
   idCountry NUMBER(6) ,
   countryName VARCHAR2(50) CONSTRAINT country_countryName_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table Country
add
constraint pk_idCountry PRIMARY KEY (idCountry)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);

CREATE SEQUENCE country_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

create or replace PROCEDURE insertCountry
(pcountryName IN VARCHAR)
AS
BEGIN
    INSERT INTO Country(idCountry, countryName)
    VALUES (country_seq.nextval, pcountryName);
    COMMIT;
END insertCountry;
/

CREATE TABLE AreaCode (
   idAreaCode NUMBER(6) ,
   idCountry NUMBER(6) CONSTRAINT fk_idCountry1 REFERENCES Country(idCountry),
   code NUMBER(6) CONSTRAINT areaCode_code_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table AreaCode
add
constraint pk_idAreaCode PRIMARY KEY (idAreaCode)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);

create or replace PROCEDURE insertAreaCode
(pIdCountry IN NUMBER, pCode IN NUMBER)
AS
BEGIN
    INSERT INTO Country(idAreaCode, idCountry, code)
    VALUES (areaCode_seq.nextval, pIdCountry, pCode);
    COMMIT;
END insertAreaCode;
/
CREATE SEQUENCE areaCode_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE Province (
   idProvince NUMBER(6),
   idCountry NUMBER(6) CONSTRAINT fk_idCountry REFERENCES Country(idCountry),
   provinceName VARCHAR2(100) CONSTRAINT province_provinceName_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

CREATE SEQUENCE province_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
alter table Province
add
constraint pk_idProvince PRIMARY KEY (idProvince)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);
   
create or replace PROCEDURE insertProvince
(pIdCountry IN NUMBER, pProvinceName IN VARCHAR2)
AS
BEGIN
    INSERT INTO Province(idProvince, idCountry, provinceName)
    VALUES (province_seq.nextval, pIdCountry, pProvinceName);
    COMMIT;
END insertProvince;
/
CREATE TABLE Canton (
   idCanton NUMBER(6) ,
   idProvince NUMBER(6) CONSTRAINT fk_idProvince REFERENCES Province(idProvince),
   cantonName VARCHAR2(100) CONSTRAINT canton_cantonName_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

CREATE SEQUENCE canton_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
alter table Canton
add
constraint pk_idCanton PRIMARY KEY (idCanton)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);
    
create or replace PROCEDURE insertCanton
(pIdProvince IN NUMBER, pCantonName IN VARCHAR2)
AS
BEGIN
    INSERT INTO Canton(idCanton, idProvince, cantonName)
    VALUES (canton_seq.nextval, province_seq.nextval, pCantonName);
    COMMIT;
END insertCanton;
/
CREATE TABLE District (
   idDistrict NUMBER(6) ,
   idCanton NUMBER(6) CONSTRAINT fk_idCanton REFERENCES Canton(idCanton),
   districtName VARCHAR2(100) CONSTRAINT district_districtName_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);
alter table District
add
constraint pk_idDistrict PRIMARY KEY (idDistrict)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);

CREATE SEQUENCE district_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
create or replace PROCEDURE insertDistrict
(pIdCanton IN NUMBER, pDistrictName IN VARCHAR2)
AS
BEGIN
    INSERT INTO Province(idDistrict, idCanton, districtName)
        VALUES (district_seq.nextval, pIdCanton, pDistrictName);
    COMMIT;
END insertDistrict;
/

CREATE TABLE RescueCenter (
   idRescueCenter NUMBER(6),
   idDistrict NUMBER(6) CONSTRAINT fk_idDistrict REFERENCES District(idDistrict),
   rescueCenterName VARCHAR2(45) CONSTRAINT rescueCenter_name_nn NOT NULL,--creo que podriamos hacer que se permitan nulos.
   rescueCenterType NUMBER(6) CONSTRAINT rescueCenter_type_nn NOT NULL, --y hay que volverla a generar. le puse number pero no deberia ser un binario? no me funciono el binary
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table RescueCenter
add
constraint pk_idRescueCenter PRIMARY KEY (idRescueCenter)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);

CREATE SEQUENCE rescueCenter_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

create or replace PROCEDURE insertRescueCenter
(pIdDistrict IN NUMBER, pRescueCenterName IN VARCHAR2, pRescueCenterType IN NUMBER)
AS
BEGIN
    INSERT INTO RescueCenter(idRescueCenter, idDistrict, rescueCenterName, rescueCenterName)
        VALUES (rescueCenter_seq.nextval, pIdDistrict, pRescueCenterName, pRescueCenterType);
    COMMIT;
END insertRescueCenter;
/

CREATE TABLE BannedList (
    idBannedList NUMBER(6) ,
    idRescueCenter NUMBER(6) CONSTRAINT fk_idRescueCenter REFERENCES RescueCenter(idRescueCenter),
    dateCreated date,
    createdUser varchar2(10),
    lastModificationDate date,
    lastModificationUser varchar2(10)
);

alter table BannedList
add
constraint pk_idBannedList PRIMARY KEY (idBannedList)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);

CREATE SEQUENCE bannedList_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

create or replace PROCEDURE insertBannedList
(pIdRescueCenter IN NUMBER)
AS
BEGIN
    INSERT INTO BannedList(idBannedList, idRescueCenter)
        VALUES (bannedList_seq.nextval, pIdRescueCenter);
    COMMIT;
END insertBannedList;
/

CREATE TABLE Person (
    idPerson NUMBER(6) ,
    firstName VARCHAR2(20) CONSTRAINT person_firstName_nn NOT NULL,
    secondName VARCHAR2(20),--opcional
    firstSurname VARCHAR2(25) CONSTRAINT person_firstSurname_nn NOT NULL,
    secondSurname VARCHAR2(25),--opcional
    birthDate DATE CONSTRAINT person_birthDate_nn NOT NULL,
    carnet NUMBER (9) CONSTRAINT person_carnet_nn NOT NULL CONSTRAINT person_carnet_un unique,
    genre VARCHAR2(10) CONSTRAINT person_genre_nn NOT NULL,
    dateCreated date,
    createdUser varchar2(10),
    lastModificationDate date,
    lastModificationUser varchar2(10)
);

alter table Person
add
constraint pk_idPerson PRIMARY KEY (idPerson)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);
  
CREATE SEQUENCE person_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE OR REPLACE PROCEDURE insertPerson 
(pfirstName IN VARCHAR2, psecondName IN VARCHAR2, pfirstSurname IN VARCHAR2, psecondSurname IN VARCHAR2, pbirthDate IN DATE)
AS
BEGIN
    INSERT INTO person(idPerson,  firstName, secondName, firstSurname, secondSurname, birthDate)
    VALUES (person_seq.nextval, pfirstName, psecondName, pfirstSurname, psecondSurname, pbirthDate);
    COMMIT;
END insertPerson;
/

CREATE TABLE Phone (
    idPhone NUMBER(6) ,
    phoneNumber NUMBER(8) CONSTRAINT phone_phoneNumber_nn NOT NULL
			  CONSTRAINT phone_phoneNumber_uk UNIQUE,
    dateCreated date,
    createdUser varchar2(10),
    lastModificationDate date,
    lastModificationUser varchar2(10)
);

alter table Phone
add
constraint pk_idPhone PRIMARY KEY (idPhone)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);

create or replace PROCEDURE insertPhone
(pPhoneNumber IN NUMBER)
AS
BEGIN
    INSERT INTO Phone(idPhone, phoneNumber)
        VALUES (phone_seq.nextval, pPhoneNumber);
    COMMIT;
END insertPhone;
/
CREATE SEQUENCE phone_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
CREATE TABLE RescueCenterXPhone ( 
   idRescueCenterXPhone NUMBER(6) ,
   idRescueCenter NUMBER(6) CONSTRAINT fk_idRescueCenter1 REFERENCES RescueCenter(idRescueCenter),
   idPhone NUMBER(6) CONSTRAINT fk_idPhone2 REFERENCES Phone(idPhone),
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);
alter table RescueCenterXPhone
add
constraint pk_idRescueCenterXPhone PRIMARY KEY (idRescueCenterXPhone)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);

CREATE SEQUENCE rescueCenterXPhone_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

---FALTA
create or replace PROCEDURE insertRescueCenterXPhone
(pPhoneNumber IN NUMBER)
AS
BEGIN
    INSERT INTO RescueCenterXPhone(idRescueCenterXPhone, idRescueCenter, idPhone)
        VALUES (rescueCenterXPhone_seq.nextval, pPhoneNumber);
    COMMIT;
END insertRescueCenterXPhone;
/    
CREATE TABLE Email (
    idEmail NUMBER(6),
    email VARCHAR2(25) CONSTRAINT email_email_nn NOT NULL,
    dateCreated date,
    createdUser varchar2(10),
    lastModificationDate date,
    lastModificationUser varchar2(10)
);

alter table Email
add
constraint pk_idEmail PRIMARY KEY (idEmail)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);

CREATE SEQUENCE email_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE RescueCenterXEmail ( --creo que nos estamos complicando al hacerlo n-n
   idRescueCenterXEmail NUMBER(6),
   idRescueCenter NUMBER(6) CONSTRAINT fk_idRescueCenter2 REFERENCES RescueCenter(idRescueCenter),
   idEmail NUMBER(6) CONSTRAINT fk_idEmail2 REFERENCES Email(idEmail),
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);
alter table RescueCenterXEmail
add
constraint pk_idRescueCenterXEmail PRIMARY KEY (idRescueCenterXEmail)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);
   
CREATE SEQUENCE rescueCenterXEmail_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
CREATE TABLE PersonXPhone (
    idPersonXPhone NUMBER(6) ,
    idPerson NUMBER(6) CONSTRAINT fk_idPerson1 REFERENCES Person(idPerson),
    idPhone NUMBER(6) CONSTRAINT fk_idPhone1 REFERENCES Phone(idPhone),
    dateCreated date,
    createdUser varchar2(10),
    lastModificationDate date,
    lastModificationUser varchar2(10)
);

alter table PersonXPhone
add
constraint pk_idPersonXPhone PRIMARY KEY (idPersonXPhone)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);

CREATE SEQUENCE personXPhone_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE PersonXEmail (
    idPersonXEmail NUMBER(6) ,
    idPerson NUMBER(6) CONSTRAINT fk_idPerson2 REFERENCES Person(idPerson),
    idEmail NUMBER(6) CONSTRAINT fk_idEmail1 REFERENCES Email(idEmail),
    dateCreated date,
    createdUser varchar2(10),
    lastModificationDate date,
    lastModificationUser varchar2(10)
);

alter table PersonXEmail
add
constraint pk_idPersonXEmail PRIMARY KEY (idPersonXEmail)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);

CREATE SEQUENCE personXEmail_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE PersonXDistrict (
    idPersonXDistrict NUMBER(6),
    idPerson NUMBER(6) CONSTRAINT fk_idPerson5 REFERENCES Person(idPerson),
    idDistrict NUMBER(6) CONSTRAINT fk_idDistrict2 REFERENCES District(idDistrict),
    dateCreated date,
    createdUser varchar2(10),
    lastModificationDate date,
    lastModificationUser varchar2(10)
);
alter table PersonXDistrict
add
constraint pk_idPersonXDistrict PRIMARY KEY (idPersonXDistrict)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);

CREATE SEQUENCE personXDistrict_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE RescueCenterUser ( --No me deja ponerle user 
    idRescueCenterUser NUMBER (6) ,
    idPerson NUMBER(6) CONSTRAINT fk_idPerson3 REFERENCES Person(idPerson),
    usernames VARCHAR2(25) CONSTRAINT user_username_nn NOT NULL,
    userPassword VARCHAR2(35) CONSTRAINT user_password_nn NOT NULL,
    dateCreated date,
    createdUser varchar2(10),
    lastModificationDate date,
    lastModificationUser varchar2(10)
);

alter table RescueCenterUser
add
constraint pk_idRescueCenterUser PRIMARY KEY (idRescueCenterUser)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);

CREATE SEQUENCE rescueCenterUser_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

create or replace PROCEDURE insertRescueCenterUser
(pIdPerson IN NUMBER, pUsername IN VARCHAR2, pUserPassword IN VARCHAR2)
AS
BEGIN
    INSERT INTO rescueCenterUser(idUser, idPerson, usernames, userPassword)
        VALUES (rescueCenterUser_seq.nextval, pUsername, pUserPassword);
    COMMIT;
END insertRescueCenterUser;
/
CREATE TABLE Rescuer ( 
    idRescuer NUMBER (6),
    idPerson NUMBER(6) CONSTRAINT fk_idPerson4 REFERENCES Person(idPerson),
    dateCreated date,
    createdUser varchar2(10),
    lastModificationDate date,
    lastModificationUser varchar2(10)
);  

alter table Rescuer
add
constraint pk_idRescuer PRIMARY KEY (idRescuer)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);

CREATE SEQUENCE rescuer_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

create or replace PROCEDURE insertRescuer
(pIdRescuer IN NUMBER, pIdPerson IN NUMBER)
AS
BEGIN
    INSERT INTO Rescuer(idRescuer, idPerson)
        VALUES (rescuer_seq.nextval, pIdPerson);
    COMMIT;
END insertRescuer;
 /   
CREATE TABLE RescueCenterXRescuer ( 
   idRescueCenterXRescuer NUMBER(6) ,
   idRescueCenter NUMBER(6) CONSTRAINT fk_idRescueCenter3 REFERENCES RescueCenter(idRescueCenter),
   idRescuer NUMBER(6) CONSTRAINT fk_idRescuer1 REFERENCES Rescuer(idRescuer),
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);
alter table RescueCenterXRescuer
add
constraint pk_idRescueCenterXRescuer PRIMARY KEY (idRescueCenterXRescuer)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);
CREATE SEQUENCE rescueCenterXEmail_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
CREATE TABLE BannedListXRescuer ( 
   idBannedListXRescuer NUMBER(6),
   idBannedList NUMBER(6) CONSTRAINT fk_idBannedList1 REFERENCES BannedList(idBannedList),
   idRescuer NUMBER(6) CONSTRAINT fk_idRescuer2 REFERENCES Rescuer(idRescuer),
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table BannedListXRescuer
add
constraint pk_idBannedListXRescuer PRIMARY KEY (idBannedListXRescuer)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);

CREATE SEQUENCE bannedListXRescuer_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;  
    
CREATE TABLE AdoptionCandidate ( 
   idAdoptionCandidate NUMBER(6) ,
   idRescueCenterUser NUMBER(6) CONSTRAINT fk_idUser1 REFERENCES RescueCenterUser(idRescueCenterUser),
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);
alter table AdoptionCandidate
add
constraint pk_idAdoptionCandidate PRIMARY KEY (idAdoptionCandidate)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);
CREATE SEQUENCE adoptionCandidate_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;  
    
create or replace PROCEDURE insertAdoptionCandidate
(pIdUser IN NUMBER)
AS
BEGIN
    INSERT INTO AdoptionCandidate(idAdoptionCandidate, idUser)
        VALUES (adoptionCandidate_seq.nextval, pIdUser);
    COMMIT;
END insertAdoptionCandidate;
/

CREATE TABLE RescueCXCandidate (  --rescueCenterXCandidate, no me deja ponerle ese nombre largo
   idRescueXCandidate NUMBER(6),
   idRescueCenter NUMBER(6) CONSTRAINT fk_idRescueCenter4 REFERENCES RescueCenter(idRescueCenter),
   idAdoptionCandidate NUMBER(6) CONSTRAINT fk_idAdoptionCandidate1 REFERENCES AdoptionCandidate(idAdoptionCandidate),
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table RescueCXCandidate
add
constraint pk_idRescueCenterXCandidate PRIMARY KEY (idRescueCenterXCandidate)
using index
tablespace ge_ind PCTFREE 20
STORAGE(INITIAL 10K NEXT 10K PCTINCREASE 0);
CREATE SEQUENCE rescueXCandidate_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;  

CREATE TABLE PersonXBannedList (  --rescueCenterXCandidate, no me deja ponerle ese nombre largo
   idPersonXBannedList NUMBER(6) ,
   idBannedList NUMBER(6) CONSTRAINT fk_idBannedList2 REFERENCES BannedList(idBannedList),
   idPerson NUMBER(6) CONSTRAINT fk_idPerson6 REFERENCES Person(idPerson),
   reason VARCHAR2(100) CONSTRAINT personXBannedList_reason_nn NOT NULL,
   insertionDate date CONSTRAINT pXBL_insertionDate_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table PersonXBannedList
add
constraint pk_idPersonXBannedList PRIMARY KEY (idPersonXBannedList)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE personXBannedList_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;    
    
-------

CREATE TABLE PetState (  
   idPetState NUMBER(6) ,
   petState NUMBER(6) CONSTRAINT petState_petState_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);
alter table PetState
add
constraint pk_idPetState PRIMARY KEY (idPetState)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE petState_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;    
    
create or replace PROCEDURE insertPetState
(pPetState IN NUMBER)
AS
BEGIN
    INSERT INTO PetState(idPetState, petState)
        VALUES (petState_seq.nextval, pPetState);
    COMMIT;
END insertPetState;
  /
CREATE TABLE TrainingDificulty (  
   idTrainingDificulty NUMBER(6) ,
   difficultyLevel NUMBER(6) CONSTRAINT training_difficulty_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);
alter table TrainingDificulty
add
constraint pk_idTrainingDificulty PRIMARY KEY (idTrainingDificulty)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE trainingDificulty_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;      

create or replace PROCEDURE insertTrainingDificulty
(pDifficultyLevel IN NUMBER)
AS
BEGIN
    INSERT INTO TrainingDificulty(idTrainingDificulty, difficultyLevel)
        VALUES (trainingDificulty_seq.nextval, pDifficultyLevel);
    COMMIT;
END insertTrainingDificulty;
/

CREATE TABLE PetType (  
   idPetType NUMBER(6) ,
   petType VARCHAR2(25) CONSTRAINT petType_petType_nn NOT NULL, --varchar o number? no se cual seria mas facil de usar
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table PetType
add
constraint pk_idPetType PRIMARY KEY (idPetType)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE petType_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;  

create or replace PROCEDURE insertPetType
(pPetType IN VARCHAR2)
AS
BEGIN
    INSERT INTO PetType(idPetType, petType)
        VALUES (petType_seq.nextval, pPetType);
    COMMIT;
END insertPetType;
 /   
 
CREATE TABLE EnergyLevel (  
   idEnergyLevel NUMBER(6) ,
   energyLevel NUMBER(6) CONSTRAINT energyLevel_energyLevel_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table EnergyLevel
add
constraint pk_idEnergyLevel PRIMARY KEY (idEnergyLevel)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE energyLevel_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;        

create or replace PROCEDURE insertEnergyLevel
(pEnergyLevel IN NUMBER)
AS
BEGIN
    INSERT INTO EnergyLevel(idEnergyLevel, energyLevel)
        VALUES (energyLevel_seq.nextval, pEnergyLevel);
    COMMIT;
END insertEnergyLevel;
/

CREATE TABLE Severity (  
   idSeverity NUMBER(6) ,
   grade NUMBER(6) CONSTRAINT severity_grade_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table Severity
add
constraint pk_idSeverity PRIMARY KEY (idSeverity)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE severity_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;   

create or replace PROCEDURE insertSeverity
(pGrade IN NUMBER)
AS
BEGIN
    INSERT INTO Severity(idSeverity, grade)
        VALUES (severity_seq.nextval, pGrade);
    COMMIT;
END insertSeverity;
/

CREATE TABLE Currency (  
   idCurrency NUMBER(6),
   idCountry NUMBER(6) CONSTRAINT fk_idCountry2 REFERENCES Country(idCountry), --esto faltaba, no estoy segura de si va aqui o idCurrency va en country
   currency VARCHAR2(100) CONSTRAINT currency_currency_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table Currency
add
constraint pk_idCurrency PRIMARY KEY (idCurrency)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE currency_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 
    
create or replace PROCEDURE insertCurrency
(pIdCountry IN NUMBER)
AS
BEGIN
    INSERT INTO Currency(idCurrency, idCountry)
        VALUES (currency_seq.nextval, pIdCountry);
    COMMIT;
END insertCurrency;
/

CREATE TABLE Chip (  
   idChip NUMBER(6) ,
   enabled NUMBER(1,0) CONSTRAINT chip_enabled_nn NOT NULL, -- 1 = ENABLED 0 = NOT ENABLED
   code NUMBER(6), --puede ser nulo
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table Chip
add
constraint pk_idChip PRIMARY KEY (idChip)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE chip_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 

create or replace PROCEDURE insertChip
(pEnabled IN NUMBER, pCode IN NUMBER)
AS
BEGIN
    INSERT INTO Chip(idChip, enabled, code)
        VALUES (chip_seq.nextval, pEnabled, pCode);
    COMMIT;
END insertChip;
/

CREATE TABLE Color (  
   idColor NUMBER(6) ,
   color VARCHAR(25) CONSTRAINT color_color_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table Color
add
constraint pk_idColor PRIMARY KEY (idColor)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE color_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 
    
create or replace PROCEDURE insertColor
(pColor IN VARCHAR2)
AS
BEGIN
    INSERT INTO Color(idColor, color)
        VALUES (color_seq.nextval, pColor);
    COMMIT;
END insertColor;
/
    
CREATE TABLE Breed (  
   idBreed NUMBER(6),
   idPetType NUMBER(6) CONSTRAINT fk_idPetType REFERENCES PetType(idPetType),
   breed VARCHAR2(100) CONSTRAINT breed_breed_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table Breed
add
constraint pk_idBreed PRIMARY KEY (idBreed)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE breed_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 

create or replace PROCEDURE insertBreed
(pIdPetType IN NUMBER, pBreed IN VARCHAR2)
AS
BEGIN
    INSERT INTO Breed(idBreed, idPetType, breed)
        VALUES (breed_seq.nextval, pIdPetType, pBreed);
    COMMIT;
END insertBreed;
/

CREATE TABLE Sickness (  
   idSickness NUMBER(6) ,
   sickness VARCHAR2(35) CONSTRAINT sickness_sickness_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table Sickness
add
constraint pk_idSickness PRIMARY KEY (idSickness)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE sickness_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 

create or replace PROCEDURE insertSickness
(pSickness IN VARCHAR2)
AS
BEGIN
    INSERT INTO Sickness(idSickness, sickness)
        VALUES (sickness_seq.nextval, pSickness);
    COMMIT;
END insertSickness;
/

CREATE TABLE Treatment (  
   idTreatment NUMBER(6) ,
   treatment VARCHAR2(25) CONSTRAINT treatment_treatment_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table Treatment
add
constraint pk_idTreatment PRIMARY KEY (idTreatment)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE treatment_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 
    
create or replace PROCEDURE insertTreatment
(pTreatment IN VARCHAR2)
AS
BEGIN
    INSERT INTO Treatment(idTreatment, treatment)
        VALUES (treatment_seq.nextval, pTreatment);
    COMMIT;
END insertTreatment;
/

CREATE TABLE SicknessXTreatment (  
   idSicknessXTreatment NUMBER(6),
   idPet number(6) CONSTRAINT sicknessxtreatment_idpet_fk references pet(idPet),
   idSickness NUMBER(6) CONSTRAINT fk_idSickness1 REFERENCES Sickness(idSickness),
   idTreatment NUMBER(6) CONSTRAINT fk_idTreatment1 REFERENCES Treatment(idTreatment),
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table SicknessXTreatment
add
constraint pk_idSicknessXTreatment PRIMARY KEY (idSicknessXTreatment)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE sicknessXTreatment_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 

CREATE TABLE Interest (  
   idInterest NUMBER(6),
   interestRate NUMBER(6) CONSTRAINT interest_interest11_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table Interest
add
constraint pk_idInterest PRIMARY KEY (idInterest)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE interest_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 
    
create or replace PROCEDURE insertInterest
(pInterestRate IN VARCHAR2)
AS
BEGIN
    INSERT INTO Interest(idInterest, interestRate)
        VALUES (interest_seq.nextval, pInterestRate);
    COMMIT;
END insertInterest;
/

CREATE TABLE BeforePhoto (  
   idBeforePhoto NUMBER(6) ,
   photo blob CONSTRAINT beforePhoto_photo_nn NOT NULL, --que tipo de dato es esto
   idPet NUMBER(6) CONSTRAINT fk_idPet2 REFERENCES Pet(idPet),
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table BeforePhoto
add
constraint pk_idBeforePhoto PRIMARY KEY (idBeforePhoto)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE beforePhoto_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 
    
CREATE TABLE HostHomeForm (  
   idHostHomeForm NUMBER(6),
   idAdoptionForm NUMBER(6) CONSTRAINT fk_idAdoptionForm1 REFERENCES AdoptionForm(idAdoptionForm), 
   idRescueCenterUser NUMBER(6) CONSTRAINT fk_idRescueCenterUser11 REFERENCES RescueCenterUser(idRescueCenterUser), 
   idPetType NUMBER(6) CONSTRAINT fk_idPetType11 REFERENCES PetType(idPetType), 
   donationMoney NUMBER(8,2) CONSTRAINT hostHomeForm_donation_nn NOT NULL,
   donationOther VARCHAR2(100) CONSTRAINT hostHomeForm_donationOther_nn NOT NULL,
   sizeHouse NUMBER(20) CONSTRAINT hostHomeForm_sizeHouse_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table HostHomeForm
add
constraint pk_idHostHomeForm PRIMARY KEY (idHostHomeForm)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE hostHomeForm_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 

create or replace PROCEDURE insertHostHomeForm
(pidAdoptionForm IN NUMBER, pDonation IN NUMBER)
AS
BEGIN
    INSERT INTO HostHomeForm(idHostHomeForm, idAdoptionForm, donation)
        VALUES (hostHomeForm_seq.nextval, pidAdoptionForm, pDonation);
    COMMIT;
END insertHostHomeForm;
/


CREATE TABLE OtherPets (  
   idOtherPets NUMBER(6) ,
   idAdoptionForm NUMBER(6) CONSTRAINT fk_idAdoptionForm23 REFERENCES AdoptionForm(idAdoptionForm), 
   timeWithOwner VARCHAR(35) CONSTRAINT adopterPets1_timeWithOwner_nn NOT NULL,
   photo blob CONSTRAINT Photo_otherPets_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table otherPets
add
constraint pk_idOtherPets PRIMARY KEY (idOtherPets)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE otherPets_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 
    
create or replace PROCEDURE insertAdopterPets
(pidAdoptionForm IN NUMBER, pTimeWithOwner IN NUMBER)
AS
BEGIN
    INSERT INTO AdopterPets(idAdopterPets, idAdoptionForm, timeWithOwner)
        VALUES (adopterPets_seq.nextval, pidAdoptionForm, pTimeWithOwner);
    COMMIT;
END insertAdopterPets;    
/

CREATE TABLE Photo (  
   idPhoto NUMBER(6) ,
   idAdopterPets NUMBER(6) CONSTRAINT fk_idAdopterPets1 REFERENCES AdopterPets(idAdopterPets), 
   idPet NUMBER(6) CONSTRAINT fk_idPet111 REFERENCES Pet(idPet), 
   photo blob CONSTRAINT Photo_photo_nn NOT NULL,
   photoDescription VARCHAR(45) CONSTRAINT Photo_photoDescription_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table Photo
add
constraint pk_idPhoto PRIMARY KEY (idPhoto)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE photo_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 
    
create or replace PROCEDURE insertPhoto
(pidAdopterPets IN NUMBER, pPhoto in blob, pPhotoDescription IN VARCHAR2)
AS
BEGIN
    INSERT INTO Photo(idPhoto, idAdopterPets, photo, photoDescription)
        VALUES (photo_seq.nextval, pidAdopterPets, pPhoto, pPhotoDescription);
    COMMIT;
END insertPhoto;  

CREATE TABLE AdoptionTest (  
   idAdoptionTest NUMBER(6) ,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table AdoptionTest
add
constraint pk_idAdoptionTest PRIMARY KEY (idAdoptionTest)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE adoptionTest_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 
    
create or replace PROCEDURE insertAdoptionTest
(pidAdoptionForm IN NUMBER)
AS
BEGIN
    INSERT INTO AdoptionTest(idAdoptionTest, idAdoptionForm) --agregar preguntas!!
        VALUES (adoptionTest_seq.nextval, pidAdoptionForm);
    COMMIT;
END insertAdoptionTest;  
/

CREATE TABLE Pet (  
   idPet NUMBER(6) ,
   idPetState NUMBER(6) CONSTRAINT pet_idPetState_fk REFERENCES PetState(idPetState),
   idTrainingDificulty NUMBER(6) CONSTRAINT pet_idTrainingDificulty_fk REFERENCES TrainingDificulty(idTrainingDificulty),
   idPetType NUMBER(6) CONSTRAINT pet_idPetType_fk REFERENCES PetType(idPetType),
   idEnergyLevel NUMBER(6) CONSTRAINT pet_idEnergyLevel_fk REFERENCES EnergyLevel(idEnergyLevel),
   idSeverity NUMBER(6) CONSTRAINT pet_idSeverity_fk REFERENCES Severity(idSeverity),
   idBreed NUMBER(6) CONSTRAINT pet_idBreed_fk REFERENCES Breed(idBreed),
   idAdoptionTest NUMBER(6) CONSTRAINT pet_idAdoptionTest_fk REFERENCES AdoptionTest(idAdoptionTest),
   idChip NUMBER(6) CONSTRAINT pet_idChip_fk REFERENCES Chip(idChip),
   petName VARCHAR2(25) CONSTRAINT pet_petName_nn NOT NULL,
   petSize VARCHAR2(25) CONSTRAINT pet_petSizw_nn NOT NULL,
   note VARCHAR2(45) CONSTRAINT pet_note_nn NOT NULL,
   neededSpace VARCHAR2(30) CONSTRAINT pet_neededSpace_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table Pet
add
constraint pk_idPet PRIMARY KEY (idPet)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE pet_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 
    
create or replace PROCEDURE insertPet
(pPetName IN VARCHAR2, pPetSize IN VARCHAR2, pNote IN VARCHAR2, pNeededSpace IN VARCHAR2)
AS
BEGIN
    INSERT INTO Pet(idPet, idPetState, idTrainingDificulty, idPetType, idEnergyLevel, idSeverity, idChip, petName, petSize, note, neededSpace)
        VALUES (pet_seq.nextval, pInterestRate, pPetName, pPetSize, pNote, pNeededSpace);
    COMMIT; --tal vez se puede hacer un trigger para que cada vez que despues de cada insert de atributos, se agreguen automaticamente en pet. igual para muchas otras tablas
END insertPet;
 /   
 
CREATE TABLE ColorXPet (  
   idColorXPet NUMBER(6),
   idColor NUMBER(6) CONSTRAINT fk_idColor11 REFERENCES Color(idColor),
   idPet NUMBER(6) CONSTRAINT fk_idPet11 REFERENCES Pet(idPet),
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table ColorXPet
add
constraint pk_ColorXPet PRIMARY KEY (idColorXPet)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE ColorXPet_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 
    
CREATE TABLE AdoptionForm (  
   idAdoptionForm NUMBER(6) ,
   idInterest NUMBER(6) CONSTRAINT fk_idInterest REFERENCES Interest(idInterest), 
   idSickness NUMBER(6) CONSTRAINT fk_idSickness REFERENCES Sickness(idSickness),
   idAdoptionTest  NUMBER(6) CONSTRAINT fk_idAdoptionTest REFERENCES AdoptionTest(idAdoptionTest),
   idAdoptionCandidate  NUMBER(6) CONSTRAINT fk_idAdoptionCandidate REFERENCES AdoptionCandidate(idAdoptionCandidate),
   isHouseOwner NUMBER(6)  CONSTRAINT adoptionForm_isHouseOwner_nn NOT NULL,
   photoSpace BLOB CONSTRAINT adoptionForm_photoSpace_nn NOT NULL,
   aAuthorization NUMBER(6) CONSTRAINT adoptionForm_aAuthorization_nn NOT NULL, --3 accepted, 2 pending, 1 denied, 
   budget NUMBER(8,2) CONSTRAINT adoptionForm_budget_nn NOT NULL,
   dailyTime VARCHAR2(20) CONSTRAINT adoptionForm_dailyTime_nn NOT NULL,
   motive VARCHAR2(60) CONSTRAINT adoptionForm_motive_nn NOT NULL,
   careReason NUMBER(1) CONSTRAINT adoptionForm_careReason_nn NOT NULL,
   qualification NUMBER(8,2) CONSTRAINT adoptionForm_qualification_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table AdoptionForm
add
constraint pk_idAdoptionForm PRIMARY KEY (idAdoptionForm)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE adoptionForm_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 

create or replace PROCEDURE insertAdoptionForm
(pidInterest IN NUMBER, pidSickness IN NUMBER, pIsHouseOwner IN NUMBER, pAuthorization IN NUMBER, pBudget IN NUMBER, pDailyTime IN VARCHAR2, pMotive IN VARCHAR2, pQualification IN NUMBER)
AS
BEGIN
    INSERT INTO AdoptionForm(idAdoptionForm, idInterest, idSickness, isHouseOwner, aAuthorization, budget, dailyTime, motive, qualification)
        VALUES (adoptionForm_seq.nextval, pidInterest, pidSickness, pIsHouseOwner, pAuthorization, pBudget, pDailyTime, pMotive, pQualification);
    COMMIT;
END insertAdoptionForm;
/

CREATE TABLE AdopterPets (  
   idAdopterPets NUMBER(6) ,
   idAdoptionForm NUMBER(6) CONSTRAINT fk_idAdoptionForm2 REFERENCES AdoptionForm(idAdoptionForm), 
   timeWithOwner VARCHAR(35) CONSTRAINT adopterPets_timeWithOwner_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table AdopterPets
add
constraint pk_idAdopterPets PRIMARY KEY (idAdopterPets)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE adopterPets_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 
    
create or replace PROCEDURE insertAdopterPets
(pidAdoptionForm IN NUMBER, pTimeWithOwner IN NUMBER)
AS
BEGIN
    INSERT INTO AdopterPets(idAdopterPets, idAdoptionForm, timeWithOwner)
        VALUES (adopterPets_seq.nextval, pidAdoptionForm, pTimeWithOwner);
    COMMIT;
END insertAdopterPets;    
/
 
CREATE TABLE RescuerXPet (  
   idrescuerXPet NUMBER(6) ,
   idRescuer NUMBER(6) CONSTRAINT fk_idRescuer3 REFERENCES Rescuer(idRescuer),
   idPet NUMBER(6) CONSTRAINT fk_idPet1 REFERENCES Pet(idPet), 
   investment NUMBER(6) CONSTRAINT investment_investment_nn NOT NULL,
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table RescuerXPet
add
constraint pk_idRescuerXPet PRIMARY KEY (idRescuerXPet)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE rescuerXPet_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 
    
CREATE TABLE LostPet (  
   idLostPet NUMBER(6) ,
   idPet NUMBER(6) CONSTRAINT LostPet_idPet_fk REFERENCES Pet(idPet), 
   idCurrency NUMBER(6) CONSTRAINT LostPet_idCurrency_fk REFERENCES Currency(idCurrency),
   founderCarnet NUMBER(9),
   foundDate DATE, --puede ser nulo
   lostDate DATE CONSTRAINT lostPet_lostDate_nn NOT NULL,
   placeLost DATE CONSTRAINT lostPet_placeLost_nn NOT NULL,
   placeFound VARCHAR(25), 
   reward NUMBER(8,2) CONSTRAINT lostPet_reward_nn NOT NULL, 
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table LostPet
add
constraint pk_idLostPet PRIMARY KEY (idLostPet)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE lostPet_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 
    
CREATE TABLE AfterPhoto (  
   idAfterPhoto NUMBER(6) ,
   photo BLOB CONSTRAINT afterPhoto_photo_nn NOT NULL, 
   idPet NUMBER(6) CONSTRAINT fk_idPet3 REFERENCES Pet(idPet),
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table AfterPhoto
add
constraint pk_idAfterPhoto PRIMARY KEY (idAfterPhoto)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE afterPhoto_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 


CREATE TABLE PersonXLostPet (  
   idPersonXLostPet NUMBER(6) ,
   idPerson NUMBER(6) CONSTRAINT fk_idPerson7 REFERENCES Person(idPerson),
   idLostPet NUMBER(6) CONSTRAINT fk_idLostPet2 REFERENCES LostPet(idLostPet),
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table PersonXLostPet
add
constraint pk_idPersonXLostPet PRIMARY KEY (idPersonXLostPet)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE personXLostPet_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 

CREATE TABLE PetXSickness (  
   idPetXSickness NUMBER(6) ,
   idPet NUMBER(6) CONSTRAINT PetXSickness_idPet_fk REFERENCES Pet(idPet), 
   idSickness NUMBER(6) CONSTRAINT PetXSickness_idSIckness_fk REFERENCES Sickness(idSickness),
   dateCreated date,
   createdUser varchar2(10),
   lastModificationDate date,
   lastModificationUser varchar2(10)
);

alter table PetXSickness
add
constraint pk_idPetXSickness PRIMARY KEY (idPetXSickness)
usinG index
tablespace ge_ind PCTFREE 20
Storage(initial 10K next 10K PCTINCREASE 0);

CREATE SEQUENCE petXSickness_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 
    
    

    
