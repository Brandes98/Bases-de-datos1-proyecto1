-----------------Person----------------------------------------------------------------

drop sequence PERSON_seq;
CREATE SEQUENCE PERSON_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
-------------------------id inicia con 1------------------------------------------------------
select * from person;

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Victor', null, 'Abarca', 'lincon', to_date('20-10-1985', 'DD-MM-YYYY'), 'Masculino', 301000002);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Carlos', null, 'Sequeira', 'Sata', to_date('20-10-2005', 'DD-MM-YYYY'), 'Masculino', 301000003);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Carlos', null, 'Palestio', 'Sata', to_date('20-10-1995', 'DD-MM-YYYY'), 'Masculino', 301000004);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Antony', null, 'Villaplana', 'labo', to_date('20-10-1978', 'DD-MM-YYYY'), 'Masculino', 301000005);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Salomo', null, 'Abarca', 'lincon', to_date('20-10-1968', 'DD-MM-YYYY'), 'Masculino', 301000006);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Sarlo', null, 'Sequeira', 'Sata', to_date('20-10-1958', 'DD-MM-YYYY'), 'Masculino', 301000007);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Sirjo', null, 'Rowan', 'Sata', to_date('20-10-1940', 'DD-MM-YYYY'), 'Masculino', 301000008);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Daniel', null, 'Saer', 'Sata', to_date('20-10-1972', 'DD-MM-YYYY'), 'Masculino', 301000009);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Sarjo', null, 'Kij', 'Sata', to_date('20-10-1982', 'DD-MM-YYYY'), 'Masculino', 301000010);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Antonia', null, 'Villaplana', 'labo', to_date('20-10-2000', 'DD-MM-YYYY'), 'Femenino', 301000011);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Victoria', null, 'Abarca', 'lincon', to_date('20-10-1985', 'DD-MM-YYYY'), 'Femenino', 301000012);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Carla', null, 'Sequeira', 'Sata', to_date('20-10-2005', 'DD-MM-YYYY'), 'Femenino', 301000013);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Carla', null, 'Palestio', 'Sata', to_date('20-10-1995', 'DD-MM-YYYY'), 'Femenino', 301000014);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Antonia', null, 'Villaplana', 'labo', to_date('20-10-1978', 'DD-MM-YYYY'), 'Femenino', 301000015);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Saloma', null, 'Abarca', 'lincon', to_date('20-10-1968', 'DD-MM-YYYY'), 'Femenino', 301000016);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Sarla', null, 'Sequeira', 'Sata', to_date('20-10-1958', 'DD-MM-YYYY'), 'Femenino', 301000017);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Sirja', null, 'Rowan', 'Sata', to_date('20-10-1940', 'DD-MM-YYYY'), 'Femenino', 301000018);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Daniela', null, 'Saer', 'Sata', to_date('20-10-1972', 'DD-MM-YYYY'), 'Femenino', 301000019);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(person_seq.nextval, 'Sarja', null, 'Kij', 'Sata', to_date('20-10-1982', 'DD-MM-YYYY'), 'Femenino', 301000020);

insert into person(idperson, firstname, secondname, firstsurname, secondsurname, Birthdate, genre, carnet)
values(20, 'Mariana', null, 'Kij', 'Sata', to_date('20-10-1982', 'DD-MM-YYYY'), 'Femenino', 301000021);


----------------------------20-------------------------------------------------------------
-----------------------------PersonXDistrict-----------------------------------------------

insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,2,3);
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,3,4);
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,4,5);
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,5,6);
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,6,7);
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,7,8);
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,8,9);
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,9,10);
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,10,11);
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,11,12);
---------------------------10--------------------------------------
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,12,13);
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,13,14);
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,14,15);
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,15,16);
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,16,17);
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,17,18);
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,18,19);
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,19,20);
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,20,21);
insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
values(personxdistrict_seq.nextval,1,22);
-----------------------20------------------------------------------
insert into email(idemail,email)
values(email_seq.nextval,'1@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'2@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'3@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'4@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'5@gmail.com');
----------------5-------------------------
insert into email(idemail,email)
values(email_seq.nextval,'6@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'7@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'8@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'9@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'10@gmail.com');
------------10---------------------------------
insert into email(idemail,email)
values(email_seq.nextval,'11@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'12@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'13@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'14@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'15@gmail.com');
----------------15-------------------------
insert into email(idemail,email)
values(email_seq.nextval,'q6@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'17@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'18@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'19@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'20@gmail.com');
------------20---------------------------------
----------------personxemail-------------------
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,1,2);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,2,3);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,3,4);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,4,5);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,5,6);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,6,7);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,7,8);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,8,9);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,9,10);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,10,11);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,11,12);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,12,13);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,13,14);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,14,15);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,15,16);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,16,17);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,17,18);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,18,19);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,19,20);
insert into personxemail(idpersonxemail,idperson,idemail)
values(personxemail_seq.nextval,20,21);
--------------------------phone-----------------------------
insert into phone(idphone,phonenumber)
values(phone_seq.nextval,12335678);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,11345678);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,12345678);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,12345678);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,12344678);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,12345578);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,12345668);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,82345678);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,77345678);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,88345678);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,22345678);
-----------------phone---------------------
insert into phone(idphone,phonenumber)
values(phone_seq.nextval,18345678);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,17345678);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,19345678);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,99345678);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,32345678);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,43345678);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,54345678);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,65345678);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,76345678);

insert into phone(idphone,phonenumber)
values(phone_seq.nextval,87245678);
------------------personxphone--------------
insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,1,2);

insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,2,3);

insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,3,4);

insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,4,5);

insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,5,6);

insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,6,7);

insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,7,8);

insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,8,9);

insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,9,10);

insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,10,11);
----------------10----------------------------------------
insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,11,12);

insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,12,13);

insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,13,14);

insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,14,15);

insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,15,16);

insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,16,17);

insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,17,18);

insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,18,19);

insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,19,20);

insert into personxphone(idpersonxphone,idperson,idphone)
values(personxphone_seq.nextval,20,21);
-----------------------------------20----------------------------
------------------------rescueCenter-------------------------------
insert into rescuecenter(idrescuecenter,iddistrict,rescuecentername,rescuecentertype)
values(rescuecenter_seq.nextval,249,'CartagoRescuers',1);

insert into rescuecenter(idrescuecenter,iddistrict,rescuecentername,rescuecentertype)
values(rescuecenter_seq.nextval,10,'SanJoseRescuers',1);

insert into rescuecenter(idrescuecenter,iddistrict,rescuecentername,rescuecentertype)
values(rescuecenter_seq.nextval,298,'HerediaRescuers',1);

insert into rescuecenter(idrescuecenter,iddistrict,rescuecentername,rescuecentertype)
values(rescuecenter_seq.nextval,199,'AlajuelaRescuers',1);

insert into rescuecenter(idrescuecenter,iddistrict,rescuecentername,rescuecentertype)
values(rescuecenter_seq.nextval,352,'GuanacasteRescuers',1);

insert into rescuecenter(idrescuecenter,iddistrict,rescuecentername,rescuecentertype)
values(rescuecenter_seq.nextval,442,'PuntarenasRescuers',1);

insert into rescuecenter(idrescuecenter,iddistrict,rescuecentername,rescuecentertype)
values(rescuecenter_seq.nextval,482,'LimonRescuers',1);

insert into rescuecenter(idrescuecenter,iddistrict,rescuecentername,rescuecentertype)
values(rescuecenter_seq.nextval,20,'Independient',2);

----------------------emailrecuers----------------------------------------
insert into email(idemail,email)
values(email_seq.nextval,'CartagoRescuers@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'SanJoseRescuers@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'HerediaRescuers@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'ALajuelaRescu@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'GuanaRescuers@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'PuertoR@gmail.com');
insert into email(idemail,email)
values(email_seq.nextval,'LimonRescuers@gmail.com');
------------------rescuecenterxemail------------------------
insert into rescuecenterxemail(idrescuecenterxemail,idrescuecenter,idemail)
values(rescuecenterxemail_seq.nextval,2,22);

insert into rescuecenterxemail(idrescuecenterxemail,idrescuecenter,idemail)
values(rescuecenterxemail_seq.nextval,3,23);

insert into rescuecenterxemail(idrescuecenterxemail,idrescuecenter,idemail)
values(rescuecenterxemail_seq.nextval,4,24);

insert into rescuecenterxemail(idrescuecenterxemail,idrescuecenter,idemail)
values(rescuecenterxemail_seq.nextval,6,26);

insert into rescuecenterxemail(idrescuecenterxemail,idrescuecenter,idemail)
values(rescuecenterxemail_seq.nextval,7,27);

insert into rescuecenterxemail(idrescuecenterxemail,idrescuecenter,idemail)
values(rescuecenterxemail_seq.nextval,8,28);

insert into rescuecenterxemail(idrescuecenterxemail,idrescuecenter,idemail)
values(rescuecenterxemail_seq.nextval,5,29);
-----------------phonerescuers----------------------------------------------
insert into phone(idphone,phonenumber)
values(phone_seq.nextval,34232322);
insert into phone(idphone,phonenumber)
values(phone_seq.nextval,34132322);
insert into phone(idphone,phonenumber)
values(phone_seq.nextval,34212322);
insert into phone(idphone,phonenumber)
values(phone_seq.nextval,34232122);
insert into phone(idphone,phonenumber)
values(phone_seq.nextval,34232312);
insert into phone(idphone,phonenumber)
values(phone_seq.nextval,34232321);
insert into phone(idphone,phonenumber)
values(phone_seq.nextval,34232324);
------------------rescuecenterxphone----------------------------------------
insert into rescuecenterxphone(idrescuecenterxphone,idrescuecenter,idphone)
values(rescuecenterxphone_seq.nextval,2,29);

insert into rescuecenterxphone(idrescuecenterxphone,idrescuecenter,idphone)
values(rescuecenterxphone_seq.nextval,3,23);

insert into rescuecenterxphone(idrescuecenterxphone,idrescuecenter,idphone)
values(rescuecenterxphone_seq.nextval,4,24);

insert into rescuecenterxphone(idrescuecenterxphone,idrescuecenter,idphone)
values(rescuecenterxphone_seq.nextval,5,25);

insert into rescuecenterxphone(idrescuecenterxphone,idrescuecenter,idphone)
values(rescuecenterxphone_seq.nextval,6,26);

insert into rescuecenterxphone(idrescuecenterxphone,idrescuecenter,idphone)
values(rescuecenterxphone_seq.nextval,7,27);

insert into rescuecenterxphone(idrescuecenterxphone,idrescuecenter,idphone)
values(rescuecenterxphone_seq.nextval,8,28);
--------------------Rescuer------------------------------------------
insert into rescuer(idrescuer,idperson)
values(rescuer_seq.nextval,1);

insert into rescuer(idrescuer,idperson)
values(rescuer_seq.nextval,2);

insert into rescuer(idrescuer,idperson)
values(rescuer_seq.nextval,3);

insert into rescuer(idrescuer,idperson)
values(rescuer_seq.nextval,4);

insert into rescuer(idrescuer,idperson)
values(rescuer_seq.nextval,5);
---------------Rescuerxpet--------------------------------------------
insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,2,2,200);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,2,3,0);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,2,4,20);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,2,5,100);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,2,6,230);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,2,7,200);
-----------------------6--------------------------------------------------
insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,3,8,0);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,3,9,20);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,3,10,100);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,3,11,230);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,3,12,200); 

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,3,13,200);
---------------12--------------------------------------------------
insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,4,14,200);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,4,15,0);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,4,16,20);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,4,17,100);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,4,18,230);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,4,19,200);
-----------------------18--------------------------------------------------
insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,5,20,0);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,5,21,20);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,5,22,100);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,5,23,230);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,5,24,200); 

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,5,25,200);
---------------------------24--------------------------------------------
insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,6,26,0);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,6,27,20);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,6,28,100);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,6,29,230);

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,6,30,200); 

insert into rescuerxpet(idrescuerxpet,idrescuer,idpet,investment)
values(rescuerxpet_seq.nextval,6,31,200);
----------------------30---------------------------------------------------
---------------------bannedlist--------------------------------------------
insert into bannedlist(idbannedlist, idrescuecenter)
values(bannedlist_seq.nextval,2);
insert into bannedlist(idbannedlist, idrescuecenter)
values(bannedlist_seq.nextval,3);
insert into bannedlist(idbannedlist, idrescuecenter)
values(bannedlist_seq.nextval,4);
insert into bannedlist(idbannedlist, idrescuecenter)
values(bannedlist_seq.nextval,5);
insert into bannedlist(idbannedlist, idrescuecenter)
values(bannedlist_seq.nextval,6);
insert into bannedlist(idbannedlist, idrescuecenter)
values(bannedlist_seq.nextval,7);
insert into bannedlist(idbannedlist, idrescuecenter)
values(bannedlist_seq.nextval,8);
insert into bannedlist(idbannedlist, idrescuecenter)
values(bannedlist_seq.nextval,9);
-----------------------bannedlistxrescuer----------------------------------
insert into bannedlistxrescuer(idbannedlistxrescuer,idbannedlist,idrescuer)
values(bannedlistxrescuer_seq.nextval,2,2);

insert into bannedlistxrescuer(idbannedlistxrescuer,idbannedlist,idrescuer)
values(bannedlistxrescuer_seq.nextval,3,3);

insert into bannedlistxrescuer(idbannedlistxrescuer,idbannedlist,idrescuer)
values(bannedlistxrescuer_seq.nextval,4,4);

insert into bannedlistxrescuer(idbannedlistxrescuer,idbannedlist,idrescuer)
values(bannedlistxrescuer_seq.nextval,5,5);

insert into bannedlistxrescuer(idbannedlistxrescuer,idbannedlist,idrescuer)
values(bannedlistxrescuer_seq.nextval,9,6);
--------------------------------------Personxbannedlist--------------------------
insert into personxbannedlist(idpersonxbannedlist,idbannedlist,idperson, reason,INSERTIONDATE)
values(personxbannedlist_seq.nextval,2,6,'tried to kill my cat',to_date('20-10-1985', 'DD-MM-YYYY'));

insert into personxbannedlist(idpersonxbannedlist,idbannedlist,idperson, reason,INSERTIONDATE)
values(personxbannedlist_seq.nextval,3,7,'stole a dog',to_date('20-10-1985', 'DD-MM-YYYY'));

insert into personxbannedlist(idpersonxbannedlist,idbannedlist,idperson, reason,INSERTIONDATE)
values(personxbannedlist_seq.nextval,4,8,'kicked a bunny',to_date('20-10-1985', 'DD-MM-YYYY'));

insert into personxbannedlist(idpersonxbannedlist,idbannedlist,idperson, reason,INSERTIONDATE)
values(personxbannedlist_seq.nextval,5,9,'kissed my wife',to_date('20-10-1985', 'DD-MM-YYYY'));

insert into personxbannedlist(idpersonxbannedlist,idbannedlist,idperson, reason,INSERTIONDATE)
values(personxbannedlist_seq.nextval,9,10,'stole my wallet',to_date('20-10-1985', 'DD-MM-YYYY'));

select * from personxbannedlist;
---------------------------------HostHomeForm------------------------------------

---------------table other pets----------------------------------------
-----------rescuecenteruser------------------------------
insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,1,'pochosayayin1','marioantoniovelaz');

insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,2,'pochosayayin2','marioantoniovelaz');

insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,3,'pochosayayin3','marioantoniovelaz');

insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,4,'pochosayayin4','marioantoniovelaz');

insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,5,'pochosayayin5','marioantoniovelaz');

insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,6,'pochosayayin6','marioantoniovelaz');
------------------------------6---------------------------------------------------
insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,7,'pochosayayin7','marioantoniovelaz');

insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,8,'pochosayayin8','marioantoniovelaz');

insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,9,'pochosayayin9','marioantoniovelaz');

insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,10,'pochosayayin10','marioantoniovelaz');

insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,11,'pochosayayin11','marioantoniovelaz');

insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,12,'pochosayayin12','marioantoniovelaz');
---------------------------12----------------------
insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,13,'pochosayayin13','marioantoniovelaz');

insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,14,'pochosayayin14','marioantoniovelaz');

insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,15,'pochosayayin15','marioantoniovelaz');

insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,16,'pochosayayin16','marioantoniovelaz');

insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,17,'pochosayayin17','marioantoniovelaz');

insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,18,'pochosayayin18','marioantoniovelaz');
------------------------18
insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,19,'pochosayayin19','marioantoniovelaz');

insert into rescuecenteruser(idrescuecenteruser,idperson,usernames,userpassword)
values(rescuecenteruser_seq.nextval,20,'pochosayayin20','marioantoniovelaz');
--------------------20-------------------------------------------------------
--------------adoptioncandidate-----------------------------------------

delete from adoptioncandidate where idadoptioncandidate>1;
insert into adoptioncandidate(idadoptioncandidate,idrescuecenteruser)
values(adoptioncandidate_seq.nextval,11);
insert into adoptioncandidate(idadoptioncandidate,idrescuecenteruser)
values(adoptioncandidate_seq.nextval,12);
insert into adoptioncandidate(idadoptioncandidate,idrescuecenteruser)
values(adoptioncandidate_seq.nextval,13);
insert into adoptioncandidate(idadoptioncandidate,idrescuecenteruser)
values(adoptioncandidate_seq.nextval,14);
insert into adoptioncandidate(idadoptioncandidate,idrescuecenteruser)
values(adoptioncandidate_seq.nextval,15);
--------------reporter-----------------------------------------------------
