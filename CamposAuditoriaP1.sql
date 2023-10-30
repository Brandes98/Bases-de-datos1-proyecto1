/*
Proyecto #1 
Campos de Auditoria - Triggers
Autor: Mariana Quesda 
Fecha de inicio: 24/09/23
Última modificación: 28/10/23 10:00 AM

NOTAS:
    triggers para llenar los campos de auditoria
    si uno cambia en el tipo de dato date por timestamp, se puede ver la hora a la que se hizo el cambio y no solo la fecha. asi probe que estuviera funcionando el trigger de update.
    para el proyecto lo dejamos en date.
    hice los drops en orden de la creacion de tablas pero siguen estando en desorden, no se por que
*/


CREATE OR REPLACE TRIGGER audit_Action
BEFORE INSERT ON Action
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Action
BEFORE UPDATE ON Action
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_Binacle
BEFORE INSERT ON Binnacle
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Binnacle
BEFORE UPDATE ON Binnacle
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_Country
BEFORE INSERT ON Country
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Country
BEFORE UPDATE ON Country
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_AreaCode
BEFORE INSERT ON AreaCode
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_AreaCode
BEFORE UPDATE ON AreaCode
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_Province
BEFORE INSERT ON Province
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Province
BEFORE UPDATE ON Province
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_Canton
BEFORE INSERT ON Canton
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Canton
BEFORE UPDATE ON Canton
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_District
BEFORE INSERT ON District
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_District
BEFORE UPDATE ON District
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_RescueCenter
BEFORE INSERT ON RescueCenter
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_RescueCenter
BEFORE UPDATE ON RescueCenter
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_BannedList
BEFORE INSERT ON BannedList
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_BannedList
BEFORE UPDATE ON BannedList
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_Person
BEFORE INSERT ON Person
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Person
BEFORE UPDATE ON Person
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_Phone
BEFORE INSERT ON Phone
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Phone
BEFORE UPDATE ON Phone
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_RescueCenterXPhone
BEFORE INSERT ON RescueCenterXPhone
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_RescueCenterXPhone
BEFORE UPDATE ON RescueCenterXPhone
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_Email
BEFORE INSERT ON Email
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Email
BEFORE UPDATE ON Email
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_RescueCenterXEmail
BEFORE INSERT ON RescueCenterXEmail
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_RescueCenterXEmail
BEFORE UPDATE ON RescueCenterXEmail
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_PersonXPhone
BEFORE INSERT ON PersonXPhone
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_PersonXPhone
BEFORE UPDATE ON PersonXPhone
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_PersonXEmail
BEFORE INSERT ON PersonXEmail
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_PersonXEmail
BEFORE UPDATE ON PersonXEmail
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_PersonXDistrict
BEFORE INSERT ON PersonXDistrict
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_PersonXDistrict
BEFORE UPDATE ON PersonXDistrict
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_RescueCenterUser
BEFORE INSERT ON RescueCenterUser
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_RescueCenterUser
BEFORE UPDATE ON RescueCenterUser
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_Rescuer
BEFORE INSERT ON Rescuer
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Rescuer
BEFORE UPDATE ON Rescuer
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_RescueCenterXRescuer
BEFORE INSERT ON RescueCenterXRescuer
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_RescueCXR
BEFORE UPDATE ON RescueCenterXRescuer
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_BannedListXRescuer
BEFORE INSERT ON BannedListXRescuer
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_BannedListXRescuer
BEFORE UPDATE ON BannedListXRescuer
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_AdoptionCandidate
BEFORE INSERT ON AdoptionCandidate
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_AdoptionCandidate
BEFORE UPDATE ON AdoptionCandidate
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_RescueCXCandidate
BEFORE INSERT ON RescueCXCandidate
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_RescueCXCandidate
BEFORE UPDATE ON RescueCXCandidate
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_PersonXBannedList
BEFORE INSERT ON PersonXBannedList
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_PersonXBannedList
BEFORE UPDATE ON PersonXBannedList
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_PetState
BEFORE INSERT ON PetState
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_PetState
BEFORE UPDATE ON PetState
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_TrainingDificulty
BEFORE INSERT ON TrainingDificulty
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_TrainingDificulty
BEFORE UPDATE ON TrainingDificulty
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_PetType
BEFORE INSERT ON PetType
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_PetType
BEFORE UPDATE ON PetType
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_EnergyLevel
BEFORE INSERT ON EnergyLevel
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_EnergyLevel
BEFORE UPDATE ON EnergyLevel
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_Severity
BEFORE INSERT ON Severity
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Severity
BEFORE UPDATE ON Severity
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_Currency
BEFORE INSERT ON Currency
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Currency
BEFORE UPDATE ON Currency
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_Chip
BEFORE INSERT ON Chip
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Chip
BEFORE UPDATE ON Chip
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_Color
BEFORE INSERT ON Color
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Color
BEFORE UPDATE ON Color
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_Breed
BEFORE INSERT ON Breed
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Breed
BEFORE UPDATE ON Breed
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_Sickness
BEFORE INSERT ON Sickness
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Sickness
BEFORE UPDATE ON Sickness
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_Treatment
BEFORE INSERT ON Treatment
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Treatment
BEFORE UPDATE ON Treatment
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_SicknessXTreatment
BEFORE INSERT ON SicknessXTreatment
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_SicknessXTreatment
BEFORE UPDATE ON SicknessXTreatment
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_Interest
BEFORE INSERT ON Interest
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Interest
BEFORE UPDATE ON Interest
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_BeforePhoto
BEFORE INSERT ON BeforePhoto
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_BeforePhoto
BEFORE UPDATE ON BeforePhoto
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_AfterPhoto
BEFORE INSERT ON AfterPhoto
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_AfterPhoto
BEFORE UPDATE ON AfterPhoto
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_AdoptionForm
BEFORE INSERT ON AdoptionForm
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_AdoptionForm
BEFORE UPDATE ON AdoptionForm
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_HostHomeForm
BEFORE INSERT ON HostHomeForm
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_HostHomeForm
BEFORE UPDATE ON HostHomeForm
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_AdopterPets
BEFORE INSERT ON AdopterPets
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_AdopterPets
BEFORE UPDATE ON AdopterPets
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_Photo
BEFORE INSERT ON Photo
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Photo
BEFORE UPDATE ON Photo
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_AdoptionTest
BEFORE INSERT ON AdoptionTest
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_AdoptionTest
BEFORE UPDATE ON AdoptionTest
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_Pet
BEFORE INSERT ON Pet
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_Pet
BEFORE UPDATE ON Pet
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_RescuerXPet
BEFORE INSERT ON RescuerXPet
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_RescuerXPet
BEFORE UPDATE ON RescuerXPet
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_LostPet
BEFORE INSERT ON LostPet
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_LostPet
BEFORE UPDATE ON LostPet
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_PersonXLostPet
BEFORE INSERT ON PersonXLostPet
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_PersonXLostPet
BEFORE UPDATE ON PersonXLostPet
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER audit_PetXSickness
BEFORE INSERT ON PetXSickness
FOR EACH ROW
BEGIN
    :NEW.dateCreated := SYSTIMESTAMP ;
    :NEW.createdUser := USER;
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

CREATE OR REPLACE TRIGGER auditUpdate_PetXSickness
BEFORE UPDATE ON PetXSickness
FOR EACH ROW
BEGIN
    :NEW.lastModificationDate := SYSTIMESTAMP;
    :NEW.lastModificationUser := USER;
END;
/

/*
drops, se borran la mayoria de las tablas pero no todas, hay que ver el orden
drop table action;
drop sequence action_seq;
drop table binnacle;
drop sequence binnacle_seq;
drop table country;
drop sequence country_seq;
drop table areaCode;
drop sequence areaCode_seq;
drop table Province;
drop sequence Province_seq;
drop table Canton;
drop sequence Canton_seq;
drop table District;
drop sequence District_seq;
drop table RescueCenter;
drop sequence RescueCenter_seq;
drop table BannedList;
drop sequence BannedList_seq;
drop table Person;
drop sequence Person_seq;
drop table Phone;
drop sequence Phone_seq;
drop table RescueCenterXPhone;
drop sequence RescueCenterXPhone_seq;
drop table Email;
drop sequence Email_seq;
drop table RescueCenterXEmail;
drop sequence RescueCenterXEmail_seq;
drop table PersonXPhone;
drop sequence PersonXPhone_seq;
drop table PersonXEmail;
drop sequence PersonXEmail_seq;
drop table PersonXDistrict;
drop sequence PersonXDistrict_seq;
drop table RescueCenterUser;
drop sequence RescueCenterUser_seq;
drop table Rescuer;
drop sequence Rescuer_seq;
drop table RescueCenterXRescuer;
drop sequence RescueCenterXRescuer_seq;
drop table BannedListXRescuer;
drop sequence BannedListXRescuer_seq;
drop table AdoptionCandidate;
drop sequence AdoptionCandidate_seq;
drop table RescueCXCandidate;
drop sequence RescueCXCandidate_seq;
drop table PersonXBannedList;
drop sequence PersonXBannedList_seq;
drop table PetState;
drop sequence PetState_seq;
drop table TrainingDificulty;
drop sequence TrainingDificulty_seq;
drop table PetType;
drop sequence PetType_seq;
drop table EnergyLevel;
drop sequence EnergyLevel_seq;
drop table Severity;
drop sequence Severity_seq;
drop table Currency;
drop sequence Currency_seq;
drop table Chip;
drop sequence Chip_seq;
drop table Color;
drop sequence Color_seq;
drop table Breed;
drop sequence Breed_seq;
drop table Sickness;
drop sequence Sickness_seq;
drop table Treatment;
drop sequence Treatment_seq;
drop table SicknessXTreatment;
drop sequence SicknessXTreatment_seq;
drop table Interest;
drop sequence Interest_seq;
drop table BeforePhoto;
drop sequence BeforePhoto_seq;
drop table AfterPhoto;
drop sequence AfterPhoto_seq;
drop table AdoptionForm;
drop sequence AdoptionForm_seq;
drop table HostHomeForm;
drop sequence HostHomeForm_seq;
drop table AdopterPets;
drop sequence AdopterPets_seq;
drop table Photo;
drop sequence Photo_seq;
drop table AdoptionTest;
drop sequence AdoptionTest_seq;
drop table Pet;
drop sequence Pet_seq;
drop table RescuerXPet;
drop sequence RescuerXPet_seq;
drop table LostPet;
drop sequence LostPet_seq;
drop table PersonXLostPet;
drop sequence PersonXLostPet_seq;
drop table PetXSickness;
drop sequence PetXSickness_seq;

*/








/* prueba
INSERT INTO Action (idAction)
VALUES (action_seq.nextval);

UPDATE Action
SET username = 'mariana'
WHERE idAction = 4;

select * from action;*/
