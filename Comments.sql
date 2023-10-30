/*
Proyecto #1 
Comments
Autor: Mariana Quesda y Brandon Calderon
Fecha de inicio: 24/09/23
Última modificación: 29/10/23 9:00 AM

NOTAS:
     
*/


-------------------Action--------------------------------------
comment on table action 
is 'Table that saves the actions performed.';

comment on column action.idaction 
is 'Actions identifier.';

comment on column action.createduser 
is 'Username of the user who performed an action.';

comment on column action.datecreated 
is 'Insertion date.';

comment on column action.lastmodificationdate
is 'Last modification date.';

comment on column action.lastmodificationUser
is 'last user who modified.';
-------------------Adopterpets--------------------------------------
comment on table adopterpets
is 'Table that saves pet adopters.';

comment on column adopterpets.idadopterpets
is 'Adopter pet identifier.';

comment on column adopterpets.timewithowner
is 'Time with adoptant.';

comment on column adopterpets.idadoptionform
is 'AdoptionForm identifier';

comment on column adopterpets.createduser 
is 'Username of the user who performed an action.';

comment on column adopterpets.datecreated 
is 'Insertion date.';

comment on column adopterpets.lastmodificationdate
is 'Last modification date.';

comment on column adopterpets.lastmodificationUser
is 'Last user who modified.';
-----------------Adoption candidate------------------------------
comment on table adoptioncandidate
is 'Table that saves adoption candidates.';

comment on column adoptioncandidate.idadoptioncandidate
is 'Adoption Candidates identifier.';

comment on column adoptioncandidate.idrescuecenteruser
is 'Rescue center user identifier.';

comment on column adoptioncandidate.createduser 
is 'Username of the user who make an insert.';

comment on column adoptioncandidate.datecreated 
is 'Insertion date.';

comment on column adoptioncandidate.lastmodificationdate
is 'Last modification date.';

comment on column adoptioncandidate.lastmodificationUser
is 'Last user who modified.';
-------------Adoptionform--------------------------------
comment on table adoptionform
is 'Table that saves adoption forms.';

comment on column adoptionform.idadoptionform
is 'Adoption form identifier.';

comment on column adoptionform.idinterest
is 'Interest identifier.';

comment on column adoptionform.idadoptiontest
is 'Adoption test identifier.';

comment on column adoptionform.idadoptioncandidate 
is 'Adoption candidates identifier.';

comment on column adoptionform.ishouseowner
is 'This person is house owner .';

comment on column adoptionform.aauthorization
is 'This person has a authorization.';

comment on column adoptionform.budget
is 'Person budget for pet.'; 

comment on column adoptionform.dailytime
is 'Person dailytime for pet.'; 

comment on column adoptionform.motive
is 'Person motive for pet adoption.'; 

comment on column adoptionform.qualification
is 'Person qualification for pet adoption.'; 

comment on column adoptionform.carereason
is 'Person care reason for pet adoption.'; 

comment on column adoptionform.photospace
is ' photo space for pet';

comment on column adoptionform.datecreated 
is 'Insertion date.';

comment on column adoptionform.lastmodificationdate
is 'Last modification date.';

comment on column adoptionform.lastmodificationUser
is 'Last user who modified.';

comment on column adoptionform.createduser 
is 'Username of the user who make an insert.';

-----------------AdoptionTest----------------------------
comment on table adoptiontest
is 'Table that saves adoption test.';

comment on column adoptiontest.idadoptiontest
is 'Adoption test identifier.';

comment on column adoptiontest.datecreated 
is 'Insertion date.';

comment on column adoptiontest.lastmodificationdate
is 'Last modification date.';

comment on column adoptiontest.lastmodificationUser
is 'Last user who modified.';

comment on column adoptiontest.createduser 
is 'Username of the user who make an insert.';

---------------afterphoto--------------------------------
comment on table afterphoto
is 'Table that saves photos after adoptions.';

comment on column afterphoto.idafterphoto
is 'After photos identifier.';

comment on column afterphoto.photo
is 'Photo after adoption.';

comment on column afterphoto.datecreated 
is 'Insertion date.';

comment on column afterphoto.lastmodificationdate
is 'Last modification date.';

comment on column afterphoto.lastmodificationUser
is 'Last user who modified.';

comment on column afterphoto.createduser 
is 'Username of the user who make an insert.';
---------Bannedlist-------------------------------------
comment on table bannedlist
is 'Table that saves rescue centers bannedlist.';

comment on column bannedlist.idbannedlist
is 'Bannedlist identifier.';

comment on column bannedlist.idrescuecenter
is 'Rescue center identifier.';

comment on column bannedlist.datecreated 
is 'Insertion date.';

comment on column bannedlist.lastmodificationdate
is 'Last modification date.';

comment on column bannedlist.lastmodificationUser
is 'Last user who modified.';

comment on column bannedlist.createduser 
is 'Username of the user who makes an insert.';
---------------Bannedlistxrescuer---------------------
comment on table bannedlistxrescuer
is 'Table that saves relation between bannedlists and rescuers.';

comment on column bannedlistxrescuer.idbannedlistxrescuer
is 'Bannedlistxrescuer identifier.';

comment on column bannedlistxrescuer.idbannedlist
is 'Bannedlist identifier.';

comment on column bannedlistxrescuer.idrescuer
is 'Rescuer identifier.';

comment on column bannedlistxrescuer.datecreated 
is 'Insertion date.';

comment on column bannedlistxrescuer.lastmodificationdate
is 'Last modification date.';

comment on column bannedlistxrescuer.lastmodificationUser
is 'Last user who modified.';

comment on column bannedlistxrescuer.createduser 
is 'Username of the user who makes an insert.';
----------------BeforePhoto---------------------------------
comment on table beforephoto
is 'Table that saves photos before adoptions.';

comment on column beforephoto.idbeforephoto
is 'Before photos identifier.';

comment on column beforephoto.photo
is 'Photo before adoption.';

comment on column beforephoto.datecreated 
is 'Insertion date.';

comment on column beforephoto.lastmodificationdate
is 'Last modification date.';

comment on column beforephoto.lastmodificationUser
is 'Last user who modified.';

comment on column beforephoto.createduser 
is 'Username of the user who make an insert.';
--------------Binnacle-------------------------------------
comment on table binnacle
is 'Table that saves binnacle.';

comment on column binnacle.idbinnacle
is 'Binnacle identifier.';

comment on column binnacle.idaction
is 'Action identifier.';

comment on column binnacle.currentvalue
is 'Value after Change';

comment on column binnacle.previousvalue
is 'Value Before Change';

comment on column binnacle.columnname
is 'Column modified';

comment on column binnacle.tablename
is 'Table modified';

comment on column binnacle.datecreated 
is 'Insertion date.';

comment on column binnacle.lastmodificationdate
is 'Last modification date.';

comment on column binnacle.lastmodificationUser
is 'Last user who modified.';

comment on column binnacle.createduser 
is 'Username of the user who make an insert.';
---------------------Breed---------------------------------
comment on table breed
is 'Table that saves pets breed.';

comment on column breed.idbreed
is 'Breed identifier.';

comment on column breed.idpettype
is 'Pet type identifier.';

comment on column breed.breed
is 'Pet breed.';

comment on column breed.datecreated 
is 'Insertion date.';

comment on column breed.lastmodificationdate
is 'Last modification date.';

comment on column breed.lastmodificationUser
is 'Last user who modified.';

comment on column breed.createduser 
is 'Username of the user who make an insert.';
------------------Canton--------------------------------------
comment on table canton
is 'Table that saves cantons.';

comment on column canton.idcanton
is 'Canton identifier.';

comment on column canton.idprovince
is 'Province identifier.';

comment on column canton.breed
is 'Pet breed.';

comment on column canton.datecreated 
is 'Insertion date.';

comment on column canton.lastmodificationdate
is 'Last modification date.';

comment on column canton.lastmodificationUser
is 'Last user who modified.';

comment on column canton.createduser 
is 'Username of the user who make an insert.';
--------------------chip--------------------------------------
comment on table chip
is 'Table that saves pets chip.';

comment on column chip.idchip
is 'Chip identifier.';

comment on column chip.enabled
is 'State of chip active or inactive.';

comment on column chip.code
is 'chips code.';

comment on column chip.datecreated 
is 'Insertion date.';

comment on column chip.lastmodificationdate
is 'Last modification date.';

comment on column chip.lastmodificationUser
is 'Last user who modified.';

comment on column chip.createduser 
is 'Username of the user who make an insert.';
-----------------Color-------------------------------
comment on table Color
is 'Table that saves pet colors.';

comment on column color.idcolor
is 'Color identifier.';

comment on column color.color
is 'Pet color.';

comment on column color.datecreated 
is 'Insertion date.';

comment on column color.lastmodificationdate
is 'Last modification date.';

comment on column color.lastmodificationUser
is 'Last user who modified.';

comment on column color.createduser 
is 'Username of the user who make an insert.';
--------------------------Colorxpet---------------------
comment on table colorxpet
is 'Table that saves relations between colors and pets.';

comment on column colorxpet.idcolorxpet
is 'Colorxpet identifier.';

comment on column colorxpet.idcolor
is 'Color identifier.';

comment on column colorxpet.idpet
is 'Pet identifier.';

comment on column colorxpet.datecreated 
is 'Insertion date.';

comment on column colorxpet.lastmodificationdate
is 'Last modification date.';

comment on column colorxpet.lastmodificationUser
is 'Last user who modified.';

comment on column colorxpet.createduser 
is 'Username of the user who make an insert.';
------------------------Country-------------------------
comment on table Country
is 'Table that saves countries.';

comment on column country.idcountry
is 'Country identifier.';

comment on column country.countryname
is 'Country name.';

comment on column country.datecreated 
is 'Insertion date.';

comment on column country.lastmodificationdate
is 'Last modification date.';

comment on column country.lastmodificationUser
is 'Last user who modified.';

comment on column country.createduser 
is 'Username of the user who make an insert.';
----------------------currency-----------------------
comment on table Currency
is 'Table that saves currencies.';

comment on column currency.idcurrency
is 'Currency identifier.';

comment on column currency.currency
is 'Currency.';

comment on column currency.datecreated 
is 'Insertion date.';

comment on column currency.lastmodificationdate
is 'Last modification date.';

comment on column currency.lastmodificationUser
is 'Last user who modified.';

comment on column currency.createduser 
is 'Username of the user who make an insert.';
-----------------district----------------------------
comment on table district
is 'Table that saves districts.';

comment on column district.iddistrict
is 'District identifier.';

comment on column district.idcanton
is 'Canton identifier.';

comment on column district.districtname
is 'District name.';

comment on column district.datecreated 
is 'Insertion date.';

comment on column district.lastmodificationdate
is 'Last modification date.';

comment on column district.lastmodificationUser
is 'Last user who modified.';

comment on column district.createduser 
is 'Username of the user who make an insert.';
---------------Email---------------------------------
comment on table email
is 'Table that saves emails.';

comment on column email.idemail
is 'Email identifier.';

comment on column email.email
is 'Email.';

comment on column email.datecreated 
is 'Insertion date.';

comment on column email.lastmodificationdate
is 'Last modification date.';

comment on column email.lastmodificationUser
is 'Last user who modified.';

comment on column email.createduser 
is 'Username of the user who made an insert.';
--------------Energylevel--------------------------
comment on table EnergyLevel
is 'Table that saves pets energy level.';

comment on column Energylevel.idenergylevel
is 'Energy level identifier.';

comment on column energylevel.energylevel
is 'Pets energy level.';

comment on column Energylevel.datecreated 
is 'Insertion date.';

comment on column Energylevel.lastmodificationdate
is 'Last modification date.';

comment on column Energylevel.lastmodificationUser
is 'Last user who modified.';

comment on column Energylevel.createduser 
is 'Username of the user who made an insert.';
------------------------Hosthomeform------------------------
comment on table HostHomeForm
is 'Table that saves host home forms.';

comment on column HostHomeForm.idhosthomeform
is 'Host home form identifier.';

comment on column HostHomeForm.idrescuecenteruser
is 'Rescue center user identifier.';

comment on column HostHomeForm.idpettype
is 'Pet type identifier.';

comment on column HostHomeForm.sizehouse
is 'Size house for pets.';

comment on column HostHomeForm.donationmoney
is 'Donation money for host home.';

comment on column HostHomeForm.donationmoney
is 'Other kinds of donation.';

comment on column HostHomeForm.datecreated 
is 'Insertion date.';

comment on column HostHomeForm.lastmodificationdate
is 'Last modification date.';

comment on column HostHomeForm.lastmodificationUser
is 'Last user who modified.';

comment on column HostHomeForm.createduser 
is 'Username of the user who make an insert.';
-----------------interest---------------------------
comment on table Interest
is 'Table that saves interest rate for adoptions.';

comment on column Interest.idinterest
is 'Interest identifier.';

comment on column Interest.interestrate
is 'Pets interest rate.';

comment on column Interest.datecreated 
is 'Insertion date.';

comment on column Interest.lastmodificationdate
is 'Last modification date.';

comment on column Interest.lastmodificationUser
is 'Last user who modified.';

comment on column Interest.createduser 
is 'Username of the user who made an insert.';
---------------------LostPet----------------------------------
comment on table LostPet
is 'Table that saves lost pets.';

comment on column Lostpet.idlostpet
is 'Lost pet identifier.';

comment on column Lostpet.idpet
is 'Pet identifier.';

comment on column Lostpet.idcurrency
is 'Currency identifier.';

comment on column lostpet.founddate
is 'Pet found date.';

comment on column Lostpet.lostdate
is 'Pet lost date.';

comment on column Lostpet.placelost
is 'Pet lost place.';

comment on column Lostpet.placefound
is 'Pet found place.';

comment on column Lostpet.reward
is 'Lost pet reward.';

comment on column Lostpet.foundercarnet
is 'Pet founder carnet.';

comment on column Lostpet.ownerappear ---------------------------------------------------------------
is 'Pet owner carnet .';

comment on column Lostpet.lastmodificationdate
is 'Last modification date.';

comment on column Lostpet.lastmodificationUser
is 'Last user who modified.';

comment on column Lostpet.createduser 
is 'Username of the user who made an insert.';

comment on column Lostpet.datecreated
is 'Username of the user who made an insert.';

--------------otherpets---------------------------
comment on table otherpets
is 'Table that saves other pet photos.';

comment on column otherpets.idotherpets
is 'Other pets identifier.';

comment on column otherpets.idadoptionform
is 'Adoptionform identifier.';

comment on column otherpets.photo
is 'Photo of other pets.';

comment on column otherpets.timewithowner
is 'Time with its actual owner.';

comment on column otherpets.datecreated 
is 'Insertion date.';

comment on column otherpets.lastmodificationdate
is 'Last modification date.';

comment on column otherpets.lastmodificationUser
is 'Last user who modified.';

comment on column otherpets.createduser 
is 'Username of the user who made an insert.';
------------------------person---------------------
comment on table person
is 'Table that saves people.';

comment on column person.idperson
is 'Person identifier.';

comment on column person.firstname
is 'Person first name.';

comment on column person.secondname
is 'Person second name.'; 

comment on column person.firstsurname
is 'Person first surname.';

comment on column person.secondsurname
is 'Person second surname.';

comment on column person.birthdate
is 'Person birthdate.';

comment on column person.genre
is 'Person genre.';

comment on column person.carnet
is 'Person carnet.';

comment on column person.datecreated 
is 'Insertion date.';

comment on column person.lastmodificationdate
is 'Last modification date.';

comment on column person.lastmodificationUser
is 'Last user who modified.';

comment on column person.createduser 
is 'Username of the user who made an insert.';
----------------------personxbannedlist-----------------------
comment on table personxbannedlist
is 'Table that saves relations between people and bannedlists.';

comment on column personxbannedlist.idperson
is 'Person identifier.';

comment on column personxbannedlist.idpersonxbannedlist
is 'Personxabannedlist identifier.';

comment on column personxbannedlist.idbannedlist
is 'Bannedlist identifier.';

comment on column personxbannedlist.reason
is 'Reason to be in bannedlist.';

comment on column personxbannedlist.insertiondate
is 'Insertion date in bannedlist.'; 


comment on column personxbannedlist.datecreated 
is 'Insertion date.';

comment on column personxbannedlist.lastmodificationdate
is 'Last modification date.';

comment on column personxbannedlist.lastmodificationUser
is 'Last user who modified.';

comment on column personxbannedlist.createduser 
is 'Username of the user who made an insert.';
--------------------personxdistrict--------------------------------
comment on table personxdistrict
is 'Table that saves relations between people and district.';

comment on column personxdistrict.idperson
is 'Person identifier.';

comment on column personxdistrict.idpersonxdistrict
is 'Personxdistrict identifier.';

comment on column personxdistrict.iddistrict
is 'District identifier.';

comment on column personxdistrict.datecreated 
is 'Insertion date.';

comment on column personxdistrict.lastmodificationdate
is 'Last modification date.';

comment on column personxdistrict.lastmodificationUser
is 'Last user who modified.';

comment on column personxdistrict.createduser 
is 'Username of the user who made an insert.';
---------------------personxemail---------------------------------
comment on table personxemail
is 'Table that saves relations between people and email.';

comment on column personxemail.idperson
is 'Person identifier.';

comment on column personxdistrict.idpersonxemail
is 'Personxemail identifier.';

comment on column personxdistrict.idemail
is 'Email identifier.';

comment on column personxemail.datecreated 
is 'Insertion date.';

comment on column personxemail.lastmodificationdate
is 'Last modification date.';

comment on column personxemail.lastmodificationUser
is 'Last user who modified.';

comment on column personxemail.createduser 
is 'Username of the user who made an insert.';
-------------------personxlostpet--------------------------------
comment on table personxlostpet
is 'Table that saves relations between people and lostpets.';

comment on column personxlostpet.idperson
is 'Person identifier.';

comment on column personxlostpet.idpersonxlostpet
is 'Personxlostpet identifier.';

comment on column personxlostpet.idlostpet
is 'Lost pet identifier.';

comment on column personxlostpet.datecreated 
is 'Insertion date.';

comment on column personxlostpet.lastmodificationdate
is 'Last modification date.';

comment on column personxlostpet.lastmodificationUser
is 'Last user who modified.';

comment on column personxlostpet.createduser 
is 'Username of the user who made an insert.';
-------------------personxphone----------------------------------
comment on table personxphone
is 'Table that saves relations between people and phones.';

comment on column personxphone.idperson
is 'Person identifier.';

comment on column personxphone.idpersonxphone
is 'Personxphone identifier.';

comment on column personxphone.idphone
is 'Phone identifier.';

comment on column personxlostpet.datecreated 
is 'Insertion date.';

comment on column personxlostpet.lastmodificationdate
is 'Last modification date.';

comment on column personxlostpet.lastmodificationUser
is 'Last user who modified.';

comment on column personxlostpet.createduser 
is 'Username of the user who make an insert.';
---------------------Pet----------------------------------
comment on table pet
is 'Table that saves pets.';

comment on column pet.idpet
is 'Pet identifier.';

comment on column pet.idpetstate
is 'Pet state identifier.';

comment on column pet.idtrainingdificulty
is 'Training dificulty identifier.';

comment on column pet.idpettype
is 'Pet type identifier.';

comment on column pet.idenergylevel
is 'Energy level identifier.';

comment on column pet.idseverity
is 'Severity identifier.';

comment on column pet.idadoptiontest
is 'Adoption test identifier.';

comment on column pet.idchip
is 'Chip identifier.';

comment on column pet.idbreed
is 'Breed identifier.';

comment on column pet.petname
is 'Pets name.';

comment on column pet.petsize
is 'Pet size.';

comment on column pet.note
is 'Pet note.';

comment on column pet.neededspace
is 'Space needed by pet.';
---------------------------petstate-----------------
comment on table petstate
is 'Table that saves pets state.';

comment on column petstate.idpetstate
is 'Pet state identifier.';

comment on column petstate.petstate
is 'Pet state.';

comment on column petstate.datecreated 
is 'Insertion date.';

comment on column petstate.lastmodificationdate
is 'Last modification date.';

comment on column petstate.lastmodificationUser
is 'Last user who modified.';

comment on column petstate.createduser 
is 'Username of the user who made an insert.';
------------------------pettype-----------------------
comment on table pettype
is 'Table that saves pets type.';

comment on column pettype.idpettype
is 'Pet type identifier.';

comment on column pettype.pettype
is 'Pet type.';

comment on column pettype.datecreated 
is 'Insertion date.';

comment on column pettype.lastmodificationdate
is 'Last modification date.';

comment on column pettype.lastmodificationUser
is 'Last user who modified.';

comment on column pettype.createduser 
is 'Username of the user who made an insert.';
-------------------------------petxsickness----------
comment on table petxsickness
is 'Table that saves relations between pet and sickness.';

comment on column petxsickness.idpet
is 'Pet identifier.';

comment on column petxsickness.idpetxsickness
is 'Petxsickness identifier.';

comment on column personxsickness.idsickness
is 'Sickness identifier.';

comment on column personxsickness.datecreated 
is 'Insertion date.';

comment on column personxsickness.lastmodificationdate
is 'Last modification date.';

comment on column personxsickness.lastmodificationUser
is 'Last user who modified.';

comment on column personxsickness.createduser 
is 'Username of the user who made an insert.';
----------------phone---------------------------------
comment on table phone
is 'Table that saves phones.';

comment on column phone.idphone
is 'Phone identifier.';

comment on column phone.phonenumber
is 'Phone number.';

comment on column phone.datecreated 
is 'Insertion date.';

comment on column phone.lastmodificationdate
is 'Last modification date.';

comment on column phone.lastmodificationUser
is 'Last user who modified.';

comment on column phone.createduser 
is 'Username of the user who make an insert.';
--------------photo------------------------------
comment on table photo
is 'Table that saves photos.';

comment on column photo.idphoto
is 'Photo identifier.';

comment on column photo.idadopterpets
is 'Adopter pet identifier.';

comment on column photo.idpet
is 'Pet identifier.';

comment on column photo.photo
is 'Photo.';

comment on column photo.photodescription
is 'Photo description.';

comment on column photo.datecreated 
is 'Insertion date.';

comment on column photo.lastmodificationdate
is 'Last modification date.';

comment on column photo.lastmodificationUser
is 'Last user who modified.';

comment on column photo.createduser 
is 'Username of the user who made an insert.';

-----------------Province------------------------------
comment on table province
is 'Table that saves provinces.';

comment on column province.idprovince
is 'Province identifier.';

comment on column district.idcountry
is 'Country identifier.';

comment on column province.provincename
is 'Province name.';

comment on column province.datecreated 
is 'Insertion date.';

comment on column province.lastmodificationdate
is 'Last modification date.';

comment on column province.lastmodificationUser
is 'Last user who modified.';

comment on column province.createduser 
is 'Username of the user who made an insert.';
---------------Rescue center----------------------------
comment on table rescuecenter
is 'Table that saves rescue centers.';

comment on column rescuecenter.idrescuecenter
is 'Rescue center identifier.';

comment on column rescuecenter.iddistrict
is 'District identifier.';

comment on column rescuecenter.rescuecentername
is 'Rescue center name.';

comment on column rescuecenter.rescuecentertype
is 'Rescue center type.';

comment on column rescuecenter.datecreated 
is 'Insertion date.';

comment on column rescuecenter.lastmodificationdate
is 'Last modification date.';

comment on column rescuecenter.lastmodificationUser
is 'Last user who modified.';

comment on column rescuecenter.createduser 
is 'Username of the user who made an insert.';
----------------rescuecenteruser-----------------------------
comment on table rescuecenteruser
is 'Table that saves rescue center users.';

comment on column rescuecenteruser.idrescuecenteruser
is 'Rescue center user identifier.';

comment on column rescuecenteruser.idperson
is 'Person identifier.';

comment on column rescuecenteruser.usernames
is 'Rescue center username.';

comment on column rescuecenteruser.userpassword
is 'Rescue center password.';

comment on column rescuecenteruser.datecreated 
is 'Insertion date.';

comment on column rescuecenteruser.lastmodificationdate
is 'Last modification date.';

comment on column rescuecenteruser.lastmodificationUser
is 'Last user who modified.';

comment on column rescuecenteruser.createduser 
is 'First user who made an insert.';

----------------rescuecenterxemail-----------------------------
comment on table rescuecenterxemail
is 'Table that saves the relationship between recue centers and emails.';

comment on column rescuecenterxemail.idrescuecenterxemail
is 'rescuecenterxemail identifier.';

comment on column rescuecenterxemail.idrescuecenter
is 'Rescue center identifier.';

comment on column rescuecenterxemail.idemail
is 'Email identifier.';

comment on column rescuecenterxemail.datecreated 
is 'Insertion date.';

comment on column rescuecenterxemail.lastmodificationdate
is 'Last modification date.';

comment on column rescuecenterxemail.lastmodificationUser
is 'Last user who modified.';

comment on column rescuecenterxemail.createduser 
is 'First user who made an insert.';

----------------rescuecenterxphone-----------------------------
comment on table rescuecenterxphone
is 'Table that saves the relationship between recue centers and emails.';

comment on column rescuecenterxphone.idrescuecenterxphone
is 'Rescue center x phone identifier.';

comment on column rescuecenterxphone.idrescuecenter
is 'Rescue center identifier.';

comment on column rescuecenterxphone.idphone
is 'Phone identifier.';

comment on column rescuecenterxphone.datecreated 
is 'Insertion date.';

comment on column rescuecenterxphone.lastmodificationdate
is 'Last modification date.';

comment on column rescuecenterxphone.lastmodificationUser
is 'Last user who modified.';

comment on column rescuecenterxphone.createduser 
is 'First user who made an insert.';

----------------rescuecenterxrescuer-----------------------------
comment on table rescuecenterxrescuer
is 'Table that saves the relationship between recue centers and rescuers.';

comment on column rescuecenterxrescuer.idrescuecenterxrescuer
is 'rescuecenterxrescuer identifier.';

comment on column rescuecenterxrescuer.idrescuecenter
is 'Rescue center identifier.';

comment on column rescuecenterxrescuer.idrescuer
is 'Rescuer identifier.';

comment on column rescuecenterxrescuer.datecreated 
is 'Insertion date.';

comment on column rescuecenterxrescuer.lastmodificationdate
is 'Last modification date.';

comment on column rescuecenterxrescuer.lastmodificationUser
is 'Last user who modified.';

comment on column rescuecenterxrescuer.createduser 
is 'First user who made an insert.';

----------------rescuecxcandidate-----------------------------
comment on table rescuecxcandidate
is 'Table that saves the relationship between recue centers and candidates.';

comment on column rescuecxcandidate.idrescuecenterxcandidate
is 'rescuecenterxcandidate identifier.';

comment on column rescuecxcandidate.idrescuecenter
is 'Rescue center identifier.';

comment on column rescuecxcandidate.idadoptioncandidate
is 'Adoption candidate identifier.';

comment on column rescuecxcandidate.datecreated 
is 'Insertion date.';

comment on column rescuecxcandidate.lastmodificationdate
is 'Last modification date.';

comment on column rescuecxcandidate.lastmodificationUser
is 'Last user who modified.';

comment on column rescuecxcandidate.createduser 
is 'First user who made an insert.';

----------------Rescuer-----------------------------
comment on table rescuer
is 'Table that saves rescuers.';

comment on column rescuer.idrescuer
is 'Rescue center identifier.';

comment on column rescuer.idperson
is 'Person identifier.';

comment on column rescuer.datecreated 
is 'Insertion date.';

comment on column rescuer.lastmodificationdate
is 'Last modification date.';

comment on column rescuer.lastmodificationUser
is 'Last user who modified.';

comment on column rescuer.createduser 
is 'First user who made an insert.';

----------------rescuerxpet-----------------------------
comment on table rescuerxpet
is 'Table that saves rescuers.';

comment on column rescuerxpet.idrescuer
is 'Rescue center identifier.';

comment on column rescuerxpet.idperson
is 'Person identifier.';

comment on column rescuerxpet.datecreated 
is 'Insertion date.';

comment on column rescuerxpet.lastmodificationdate
is 'Last modification date.';

comment on column rescuerxpet.lastmodificationUser
is 'Last user who modified.';

comment on column rescuerxpet.createduser 
is 'First user who made an insert.';

----------------severity-----------------------------
comment on table severity
is 'Table that saves severity level for pets.';

comment on column severity.idseverity
is 'severity identifier.';

comment on column severity.grade
is 'Holds the grade severity';

comment on column severity.datecreated 
is 'Insertion date.';

comment on column severity.lastmodificationdate
is 'Last modification date.';

comment on column severity.lastmodificationUser
is 'Last user who modified.';

comment on column severity.createduser 
is 'First user who made an insert.';

----------------sickness-----------------------------
comment on table sickness
is 'Table that saves the sickness associated to the pet';

comment on column sickness.idsickness
is 'sickness identifier.';

comment on column sickness.sickness
is 'Holds sickness name';

comment on column sickness.datecreated 
is 'Insertion date.';

comment on column sickness.lastmodificationdate
is 'Last modification date.';

comment on column sickness.lastmodificationUser
is 'Last user who modified.';

comment on column sickness.createduser 
is 'First user who made an insert.';

----------------sicknessxtreatment-----------------------------
comment on table sicknessxtreatment
is 'Table that saves the relationship betweeen sickness and treatment';

comment on column sicknessxtreatment.idsicknessxtreatment
is 'sicknessxtreatment identifier.';

comment on column sicknessxtreatment.idsickness
is 'sickness identifier';

comment on column sicknessxtreatment.idtreatment
is 'treatment identifier';

comment on column sicknessxtreatment.datecreated 
is 'Insertion date.';

comment on column sicknessxtreatment.lastmodificationdate
is 'Last modification date.';

comment on column sicknessxtreatment.lastmodificationUser
is 'Last user who modified.';

comment on column sicknessxtreatment.createduser 
is 'First user who made an insert.';

----------------trainingdificulty-----------------------------
comment on table trainingdificulty
is 'Table that saves the training dificulty';

comment on column trainingdificulty.idtrainingdificulty
is 'training dificulty identifier.';

comment on column trainingdificulty.dificultylevel
is 'Holds the level of training dificulty';

comment on column trainingdificulty.datecreated 
is 'Insertion date.';

comment on column trainingdificulty.lastmodificationdate
is 'Last modification date.';

comment on column trainingdificulty.lastmodificationUser
is 'Last user who modified.';

comment on column trainingdificulty.createduser 
is 'First user who made an insert.';

----------------treatment-----------------------------
comment on table treatment
is 'Table that saves the treatment for a pet';

comment on column treatment.idtreatment
is 'treatment identifier.';

comment on column treatment.treatment
is 'Holds the treatment';

comment on column treatment.datecreated 
is 'Insertion date.';

comment on column treatment.lastmodificationdate
is 'Last modification date.';

comment on column treatment.lastmodificationUser
is 'Last user who modified.';

comment on column treatment.createduser 
is 'First user who made an insert.';








