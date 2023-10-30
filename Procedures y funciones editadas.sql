
insert into adopterpets (idadopterpets,timewithowner,idadoptionform)
values(adopterpets_seq.nextval,'10-10-2023',9);

alter table personxbannedlist add reason varchar2(100);

CREATE OR REPLACE PROCEDURE getAdopters(
    carnetp IN person.carnet%TYPE,
    v_cursor OUT SYS_REFCURSOR,
    v_record_count OUT NUMBER
) AS 
BEGIN
    OPEN v_cursor FOR
    SELECT p.firstname, p.firstsurname, pe.petname, d.districtname, c.cantonname, 
           pr.provincename, co.countryname, ph.phonenumber, p.carnet, 
           af.qualification, ap.timewithowner
    FROM person p
    JOIN rescuecenteruser rcu ON p.idperson = rcu.idperson
    JOIN adoptioncandidate ac ON rcu.idrescuecenteruser = ac.idrescuecenteruser
    JOIN adoptionform af ON ac.idadoptioncandidate = af.idadoptioncandidate
    JOIN adoptiontest at ON af.idadoptiontest = at.idadoptiontest
    JOIN pet pe ON at.idadoptiontest = pe.idadoptiontest
    JOIN adopterpets ap ON ap.idadoptionform = af.idadoptionform
    JOIN personxphone pxp ON pxp.idperson = p.idperson
    JOIN phone ph ON pxp.idphone = ph.idphone
    JOIN personxdistrict pxd ON pxd.idperson = p.idperson
    JOIN district d ON pxd.iddistrict = d.iddistrict
    JOIN canton c ON d.idcanton = c.idcanton
    JOIN province pr ON c.idprovince = pr.idprovince
    JOIN country co ON pr.idcountry = co.idcountry
    WHERE p.carnet = NVL(carnetp, p.carnet);
    
    -- Obtener la cantidad de registros consultados
    SELECT COUNT(*) INTO v_record_count FROM (
        SELECT 1
        FROM person p
        JOIN rescuecenteruser rcu ON p.idperson = rcu.idperson
        JOIN adoptioncandidate ac ON rcu.idrescuecenteruser = ac.idrescuecenteruser
        JOIN adoptionform af ON ac.idadoptioncandidate = af.idadoptioncandidate
        JOIN adoptiontest at ON af.idadoptiontest = at.idadoptiontest
        JOIN pet pe ON at.idadoptiontest = pe.idadoptiontest
        JOIN adopterpets ap ON ap.idadoptionform = af.idadoptionform
        JOIN personxphone pxp ON pxp.idperson = p.idperson
        JOIN phone ph ON pxp.idphone = ph.idphone
        JOIN personxdistrict pxd ON pxd.idperson = p.idperson
        JOIN district d ON pxd.iddistrict = d.iddistrict
        JOIN canton c ON d.idcanton = c.idcanton
        JOIN province pr ON c.idprovince = pr.idprovince
        JOIN country co ON pr.idcountry = co.idcountry
        WHERE p.carnet = NVL(carnetp, p.carnet)
    );
END getAdopters;
/
SET SERVEROUTPUT ON;

DECLARE
    v_cursor SYS_REFCURSOR;
    v_record_count NUMBER;
    v_name person.firstname%TYPE;
    v_surname person.firstsurname%TYPE;
    v_petname pet.petname%TYPE;
    v_district district.districtname%TYPE;
    v_canton canton.cantonname%TYPE;
    v_province province.provincename%TYPE;
    v_country country.countryname%TYPE;
    v_phone phone.phonenumber%TYPE;
    v_cedula person.carnet%TYPE;
    v_qualification adoptionform.qualification%TYPE;
    v_timewo adopterpets.timewithowner%TYPE;
BEGIN
    getAdopters(NULL, v_cursor, v_record_count);

    LOOP
        FETCH v_cursor INTO v_name, v_surname, v_petname, v_district, v_canton, v_province, v_country, v_phone, v_cedula, v_qualification, v_timewo;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ', Surname: ' || v_surname || ', Pet: ' || v_petname || ', District: '||  v_district || ', Canton: '||  v_canton || ', Province: ' || v_province || ', Country: '||  v_country || ', Phone: '||  v_phone || ', Carnet: ' || v_cedula || ', Qualification: ' || v_qualification || ', Time with Owner: ' || v_timewo);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total Records: ' || v_record_count);
    CLOSE v_cursor;
END;
/


------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE getAdoptersPet(
    carnetp IN person.carnet%TYPE,
    v_cursor OUT SYS_REFCURSOR,
    v_record_count OUT NUMBER
) AS 
BEGIN
    OPEN v_cursor FOR
    SELECT p.firstname, p.firstsurname, pe.petname, d.districtname, c.cantonname,
           pr.provincename, co.countryname, ph.phonenumber, p.carnet, af.qualification, ap.timewithowner
    FROM person p
    JOIN rescuecenteruser rcu ON p.idperson = rcu.idperson
    JOIN adoptioncandidate ac ON rcu.idrescuecenteruser = ac.idrescuecenteruser
    JOIN adoptionform af ON ac.idadoptioncandidate = af.idadoptioncandidate
    JOIN adoptiontest at ON af.idadoptiontest = at.idadoptiontest
    JOIN pet pe ON at.idadoptiontest = pe.idadoptiontest
    JOIN adopterpets ap ON ap.idadoptionform = af.idadoptionform
    JOIN personxphone pxp ON pxp.idperson = p.idperson
    JOIN phone ph ON pxp.idphone = ph.idphone
    JOIN personxdistrict pxd ON pxd.idperson = p.idperson
    JOIN district d ON pxd.iddistrict = d.iddistrict
    JOIN canton c ON d.idcanton = c.idcanton
    JOIN province pr ON c.idprovince = pr.idprovince
    JOIN country co ON pr.idcountry = co.idcountry
    WHERE p.carnet = NVL(carnetp, p.carnet);
    
    -- Obtiene el número de filas afectadas
    SELECT COUNT(*) INTO v_record_count FROM (
        SELECT p.firstname
        FROM person p
        JOIN rescuecenteruser rcu ON p.idperson = rcu.idperson
        JOIN adoptioncandidate ac ON rcu.idrescuecenteruser = ac.idrescuecenteruser
        JOIN adoptionform af ON ac.idadoptioncandidate = af.idadoptioncandidate
        JOIN adoptiontest at ON af.idadoptiontest = at.idadoptiontest
        JOIN pet pe ON at.idadoptiontest = pe.idadoptiontest
        JOIN adopterpets ap ON ap.idadoptionform = af.idadoptionform
        JOIN personxphone pxp ON pxp.idperson = p.idperson
        JOIN phone ph ON pxp.idphone = ph.idphone
        JOIN personxdistrict pxd ON pxd.idperson = p.idperson
        JOIN district d ON pxd.iddistrict = d.iddistrict
        JOIN canton c ON d.idcanton = c.idcanton
        JOIN province pr ON c.idprovince = pr.idprovince
        JOIN country co ON pr.idcountry = co.idcountry
        WHERE p.carnet = NVL(carnetp, p.carnet)
    );
END getAdoptersPet;
/
SET SERVEROUTPUT ON;
DECLARE
    v_cursor SYS_REFCURSOR;
    v_record_count NUMBER;
    v_firstname person.firstname%TYPE;
    v_firstsurname person.firstsurname%TYPE;
    v_petname pet.petname%TYPE;
    v_districtname district.districtname%TYPE;
    v_cantonname canton.cantonname%TYPE;
    v_provincename province.provincename%TYPE;
    v_countryname country.countryname%TYPE;
    v_phonenumber phone.phonenumber%TYPE;
    v_carnet person.carnet%TYPE;
    v_qualification adoptionform.qualification%TYPE;
    v_timewithowner adopterpets.timewithowner%TYPE;
BEGIN
    -- Llama al procedimiento y pasa el carnet como parámetro
    getAdoptersPet(null, v_cursor, v_record_count);
    -- Recupera y muestra los resultados del cursor
    LOOP
        FETCH v_cursor INTO v_firstname, v_firstsurname, v_petname, v_districtname, v_cantonname, v_provincename, v_countryname, v_phonenumber, 
                            v_carnet, v_qualification, v_timewithowner;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('First Name: ' || v_firstname);
        DBMS_OUTPUT.PUT_LINE('Last Name: ' || v_firstsurname);
        DBMS_OUTPUT.PUT_LINE('Pet Name: ' || v_petname);
        DBMS_OUTPUT.PUT_LINE('District Name: ' || v_districtname);
        DBMS_OUTPUT.PUT_LINE('Canton Name: ' || v_cantonname);
        DBMS_OUTPUT.PUT_LINE('Province Name: ' || v_provincename);
        DBMS_OUTPUT.PUT_LINE('Country Name: ' || v_countryname);
        DBMS_OUTPUT.PUT_LINE('Phone Number: ' || v_phonenumber);
        DBMS_OUTPUT.PUT_LINE('Carnet: ' || v_carnet);
        DBMS_OUTPUT.PUT_LINE('Qualification: ' || v_qualification);
        DBMS_OUTPUT.PUT_LINE('Time with Owner: ' || v_timewithowner);
    END LOOP;
    -- Muestra el total de registros consultados
    DBMS_OUTPUT.PUT_LINE('Total Records: ' || v_record_count);
    CLOSE v_cursor;
END;
/
---------------------------------------------------------------------------------------------
alter table bannedlist
add reasonn varchar2(100);
alter table bannedlist
add insertiondate date;
update personxbannedlist
set insertiondate = '10-10-2022'
where idpersonxbannedlist = 7;

update personxbannedlist
set insertiondate = '10-10-2023'
where idpersonxbannedlist = 8;

update personxbannedlist
set insertiondate = '10-10-2021'
where idpersonxbannedlist = 9;

update personxbannedlist
set insertiondate = '10-10-2020'
where idpersonxbannedlist = 10;

update personxbannedlist
set insertiondate = '10-10-2024'
where idpersonxbannedlist = 11;

CREATE OR REPLACE PROCEDURE getBannedAllPeople(
    v_identificador in number,
    v_cursor OUT SYS_REFCURSOR,
    v_total_records OUT NUMBER -- Variable para almacenar el total de registros
)
AS
BEGIN
    -- Subconsulta para contar el total de registros
    SELECT COUNT(*) INTO v_total_records
    FROM person p
    JOIN personxbannedlist pxb ON p.idperson = pxb.idperson
    JOIN bannedlist bl ON pxb.idbannedlist = bl.idbannedlist
    JOIN rescuecenter rc ON rc.idrescuecenter = bl.idrescuecenter
    JOIN personxdistrict pxd ON pxd.idperson = p.idperson
    JOIN district d ON pxd.iddistrict = d.iddistrict
    JOIN canton c ON d.idcanton = c.idcanton
    JOIN province pr ON c.idprovince = pr.idprovince
    JOIN country co ON pr.idcountry = co.idcountry
    JOIN personxemail pxe ON pxe.idperson = p.idperson
    JOIN email e ON pxe.idemail = e.idemail
    JOIN personxphone pxp ON pxp.idperson = p.idperson
    JOIN phone ph ON pxp.idphone = ph.idphone
    where bl.idrescuecenter = NVL(v_identificador,bl.idrescuecenter);
    -- Consulta principal para abrir el cursor
    OPEN v_cursor FOR
    SELECT pxb.insertiondate,
           p.firstname,
           p.firstsurname,
           d.districtname,
           c.cantonname,
           pr.provincename,
           co.countryname,
           e.email,
           rc.rescuecentername,
           ph.phonenumber,
           p.carnet,
           pxb.reason
    FROM person p
    JOIN personxbannedlist pxb ON p.idperson = pxb.idperson
    JOIN bannedlist bl ON pxb.idbannedlist = bl.idbannedlist
    JOIN rescuecenter rc ON rc.idrescuecenter = bl.idrescuecenter
    JOIN personxdistrict pxd ON pxd.idperson = p.idperson
    JOIN district d ON pxd.iddistrict = d.iddistrict
    JOIN canton c ON d.idcanton = c.idcanton
    JOIN province pr ON c.idprovince = pr.idprovince
    JOIN country co ON pr.idcountry = co.idcountry
    JOIN personxemail pxe ON pxe.idperson = p.idperson
    JOIN email e ON pxe.idemail = e.idemail
    JOIN personxphone pxp ON pxp.idperson = p.idperson
    JOIN phone ph ON pxp.idphone = ph.idphone
    where bl.idrescuecenter = NVL(v_identificador,bl.idrescuecenter)
    ORDER BY pxb.insertiondate;
END getBannedAllPeople;
/
SET SERVEROUTPUT ON;

DECLARE
    v_cursor SYS_REFCURSOR;
    v_total_records NUMBER;
    v_insertiondate DATE;
    v_firstname VARCHAR2(100);
    v_firstsurname VARCHAR2(100);
    v_districtname VARCHAR2(100);
    v_cantonname VARCHAR2(100);
    v_provincename VARCHAR2(100);
    v_countryname VARCHAR2(100);
    v_email VARCHAR2(100);
    v_rescuecentername VARCHAR2(100);
    v_phonenumber VARCHAR2(20);
    v_carnet VARCHAR2(20);
    v_reason VARCHAR2(100);
BEGIN
    -- Llama al procedimiento y obtén el cursor y el total de registros
    getBannedAllPeople(null,v_cursor, v_total_records);

    -- Itera a través del cursor y muestra los detalles de cada registro
    LOOP
        FETCH v_cursor INTO v_insertiondate, v_firstname, v_firstsurname, v_districtname, 
                            v_cantonname, v_provincename, v_countryname, v_email, 
                            v_rescuecentername, v_phonenumber, v_carnet, v_reason;
        EXIT WHEN v_cursor%NOTFOUND;
        
        -- Muestra los detalles de cada registro
        DBMS_OUTPUT.PUT_LINE('Insertion Date: ' || v_insertiondate);
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_firstname);
        DBMS_OUTPUT.PUT_LINE('Surname: ' || v_firstsurname);
        DBMS_OUTPUT.PUT_LINE('District: ' || v_districtname);
        DBMS_OUTPUT.PUT_LINE('Canton: ' || v_cantonname);
        DBMS_OUTPUT.PUT_LINE('Province: ' || v_provincename);
        DBMS_OUTPUT.PUT_LINE('Country: ' || v_countryname);
        DBMS_OUTPUT.PUT_LINE('Email: ' || v_email);
        DBMS_OUTPUT.PUT_LINE('Rescue Center: ' || v_rescuecentername);
        DBMS_OUTPUT.PUT_LINE('Phone Number: ' || v_phonenumber);
        DBMS_OUTPUT.PUT_LINE('Carnet: ' || v_carnet);
        DBMS_OUTPUT.PUT_LINE('Reason: ' || v_reason);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    END LOOP;
    
    -- Muestra el total de registros consultados
    DBMS_OUTPUT.PUT_LINE('Total Records: ' || v_total_records);
    
    -- Cierra el cursor
    CLOSE v_cursor;
END;
/

------------------------------------------------------------------------------------------------------------
update adoptionform
set idadoptiontest = 8
where idadoptionform =9;
create or replace procedure getPetsInAdoption(v_cursor out sys_refcursor)
as  begin
open v_cursor for
select pty.pettype, count(*) as totalpets from
pet pe 
join pettype pty on pty.idpettype = pe.idpettype
join petstate pt on pt.idpetstate = pe.idpetstate
where pt.idpetstate = 2
group by pty.pettype;
end getPetsInAdoption;
/
set serveroutput on;
DECLARE
    pet_cursor SYS_REFCURSOR;
    pet_type VARCHAR2(50);
    total_pets NUMBER;
BEGIN
    -- Llama al procedimiento y pasa el cursor como parámetro
    getPetsInAdoption(pet_cursor);
    
    -- Imprime los resultados
    LOOP
        FETCH pet_cursor INTO pet_type, total_pets;
        EXIT WHEN pet_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Pet Type: ' || pet_type || ', Total Pets: ' || total_pets);
    END LOOP;
    
    -- Cierra el cursor después de usarlo
    CLOSE pet_cursor;
END;
/

---------------------------------------------------------------------------------------------------------

create or replace procedure rangeAge(v_genre in varchar2,v_cursor out sys_refcursor,v_total out number)
as begin
open v_cursor for
select '0-18' rango , count(1)
FROM person p
    JOIN rescuecenteruser rcu ON p.idperson = rcu.idperson
    JOIN adoptioncandidate ac ON rcu.idrescuecenteruser = ac.idrescuecenteruser
    JOIN adoptionform af ON ac.idadoptioncandidate = af.idadoptioncandidate
    JOIN adoptiontest at ON af.idadoptiontest = at.idadoptiontest
    JOIN pet pe ON at.idadoptiontest = pe.idadoptiontest
    JOIN adopterpets ap ON ap.idadoptionform = af.idadoptionform
    where p.birthdate is not null and p.genre = NVL(v_genre,p.genre)
    and trunc((sysdate-p.birthdate)/365)between 0 and 18
    union
select '19-30' rango , count(1)
FROM person p
    JOIN rescuecenteruser rcu ON p.idperson = rcu.idperson
    JOIN adoptioncandidate ac ON rcu.idrescuecenteruser = ac.idrescuecenteruser
    JOIN adoptionform af ON ac.idadoptioncandidate = af.idadoptioncandidate
    JOIN adoptiontest at ON af.idadoptiontest = at.idadoptiontest
    JOIN pet pe ON at.idadoptiontest = pe.idadoptiontest
    JOIN adopterpets ap ON ap.idadoptionform = af.idadoptionform
    where p.birthdate is not null and p.genre = NVL(v_genre,p.genre)
    and trunc((sysdate-p.birthdate)/365)between 19 and 30
    union
    select '31-45' rango , count(1)
FROM person p
    JOIN rescuecenteruser rcu ON p.idperson = rcu.idperson
    JOIN adoptioncandidate ac ON rcu.idrescuecenteruser = ac.idrescuecenteruser
    JOIN adoptionform af ON ac.idadoptioncandidate = af.idadoptioncandidate
    JOIN adoptiontest at ON af.idadoptiontest = at.idadoptiontest
    JOIN pet pe ON at.idadoptiontest = pe.idadoptiontest
    JOIN adopterpets ap ON ap.idadoptionform = af.idadoptionform
    where p.birthdate is not null and p.genre = NVL(v_genre,p.genre)
    and trunc((sysdate-p.birthdate)/365)between 31 and 45
    union
    select '46-60' rango , count(1)
FROM person p
    JOIN rescuecenteruser rcu ON p.idperson = rcu.idperson
    JOIN adoptioncandidate ac ON rcu.idrescuecenteruser = ac.idrescuecenteruser
    JOIN adoptionform af ON ac.idadoptioncandidate = af.idadoptioncandidate
    JOIN adoptiontest at ON af.idadoptiontest = at.idadoptiontest
    JOIN pet pe ON at.idadoptiontest = pe.idadoptiontest
    JOIN adopterpets ap ON ap.idadoptionform = af.idadoptionform
    where p.birthdate is not null and p.genre = NVL(v_genre,p.genre)
    and trunc((sysdate-p.birthdate)/365)between 46 and 60
    union
select '61-75' rango , count(1)
FROM person p
    JOIN rescuecenteruser rcu ON p.idperson = rcu.idperson
    JOIN adoptioncandidate ac ON rcu.idrescuecenteruser = ac.idrescuecenteruser
    JOIN adoptionform af ON ac.idadoptioncandidate = af.idadoptioncandidate
    JOIN adoptiontest at ON af.idadoptiontest = at.idadoptiontest
    JOIN pet pe ON at.idadoptiontest = pe.idadoptiontest
    JOIN adopterpets ap ON ap.idadoptionform = af.idadoptionform
    where p.birthdate is not null and p.genre = NVL(v_genre,p.genre)
    and trunc((sysdate-p.birthdate)/365)between 61 and 75
union
select '75<edad' rango , count(1)
FROM person p
    JOIN rescuecenteruser rcu ON p.idperson = rcu.idperson
    JOIN adoptioncandidate ac ON rcu.idrescuecenteruser = ac.idrescuecenteruser
    JOIN adoptionform af ON ac.idadoptioncandidate = af.idadoptioncandidate
    JOIN adoptiontest at ON af.idadoptiontest = at.idadoptiontest
    JOIN pet pe ON at.idadoptiontest = pe.idadoptiontest
    JOIN adopterpets ap ON ap.idadoptionform = af.idadoptionform
    where p.birthdate is not null and p.genre = NVL(v_genre,p.genre)
    and trunc((sysdate-p.birthdate)/365)>=76;
SELECT COUNT(*) INTO v_total
    FROM person p
    JOIN rescuecenteruser rcu ON p.idperson = rcu.idperson
    JOIN adoptioncandidate ac ON rcu.idrescuecenteruser = ac.idrescuecenteruser
    JOIN adoptionform af ON ac.idadoptioncandidate = af.idadoptioncandidate
    JOIN adoptiontest at ON af.idadoptiontest = at.idadoptiontest
    JOIN pet pe ON at.idadoptiontest = pe.idadoptiontest
    JOIN adopterpets ap ON ap.idadoptionform = af.idadoptionform
    WHERE p.birthdate IS NOT NULL AND p.genre = NVL(v_genre, p.genre);
end rangeAge;
/
SET SERVEROUTPUT ON;

DECLARE
    v_cursor SYS_REFCURSOR;
    v_total number;
    rango VARCHAR2(10);
    total NUMBER;
BEGIN
    rangeAge('Femenino', v_cursor,v_total); -- Cambia 'Femenino' por el género que desees
    DBMS_OUTPUT.PUT_LINE('Total de registros consultados: ' || v_total);
    -- Mostrar resultados
    DBMS_OUTPUT.PUT_LINE('RANGO   | TOTAL');
    DBMS_OUTPUT.PUT_LINE('--------|-------');
    LOOP
        FETCH v_cursor INTO rango, total;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(rango || ' | ' || total);
    END LOOP;
    CLOSE v_cursor;
END;
/
----------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE topNDogsBreedAdopted(
    v_number IN NUMBER,
    v_cursor OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN v_cursor FOR
    SELECT breed, total_adoptions
    FROM (
        SELECT br.breed, COUNT(*) AS total_adoptions
        FROM person p
        JOIN rescuecenteruser rcu ON p.idperson = rcu.idperson
        JOIN adoptioncandidate ac ON rcu.idrescuecenteruser = ac.idrescuecenteruser
        JOIN adoptionform af ON ac.idadoptioncandidate = af.idadoptioncandidate
        JOIN adoptiontest at ON af.idadoptiontest = at.idadoptiontest
        JOIN pet pe ON at.idadoptiontest = pe.idadoptiontest
        JOIN adopterpets ap ON ap.idadoptionform = af.idadoptionform
        JOIN breed br ON br.idbreed = pe.idbreed
        WHERE ap.idadoptionform = af.idadoptionform
        GROUP BY br.breed
        ORDER BY COUNT(*) DESC
    )
    WHERE ROWNUM <= v_number;
END topNDogsBreedAdopted;
/
SET SERVEROUTPUT ON;

DECLARE
    v_cursor SYS_REFCURSOR;
    breed_name VARCHAR2(255);
    total_adoptions NUMBER;
BEGIN
    topNDogsBreedAdopted(1, v_cursor); 
    LOOP
        FETCH v_cursor INTO breed_name, total_adoptions;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Raza: ' || breed_name || ', Adopciones: ' || total_adoptions);
    END LOOP;
    CLOSE v_cursor;
END;
/
---------------------------------------------------------------------------------------------------------
update rescuerxpet
set investment = 500
where investment =0;
create sequence rescuecenterxrescuer_seq
start with 1
increment by 1
nocache
nocycle;
insert into rescuecenterxrescuer(idrescuecenterxrescuer,idrescuecenter,idrescuer)
values(rescuecenterxrescuer_seq.nextval,2,2);
insert into rescuecenterxrescuer(idrescuecenterxrescuer,idrescuecenter,idrescuer)
values(rescuecenterxrescuer_seq.nextval,3,3);
insert into rescuecenterxrescuer(idrescuecenterxrescuer,idrescuecenter,idrescuer)
values(rescuecenterxrescuer_seq.nextval,4,4);
insert into rescuecenterxrescuer(idrescuecenterxrescuer,idrescuecenter,idrescuer)
values(rescuecenterxrescuer_seq.nextval,5,5);
insert into rescuecenterxrescuer(idrescuecenterxrescuer,idrescuecenter,idrescuer)
values(rescuecenterxrescuer_seq.nextval,9,6);

CREATE OR REPLACE PROCEDURE getAverageInversionAdopted(
    code IN NUMBER,
    v_cursor OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN v_cursor FOR
    SELECT a.idpet, ((a.num_adp / b.allpets)*100) AS avg_adoption_ratio, ((a.petinv / b.totalinv)*100) AS avg_investment_ratio
    FROM (
        SELECT pe.idpet, SUM(rxp.investment) AS petinv, COUNT(*) AS num_adp
        FROM person p
        JOIN rescuecenteruser rcu ON p.idperson = rcu.idperson
        JOIN adoptioncandidate ac ON rcu.idrescuecenteruser = ac.idrescuecenteruser
        JOIN adoptionform af ON ac.idadoptioncandidate = af.idadoptioncandidate
        JOIN adoptiontest at ON af.idadoptiontest = at.idadoptiontest
        JOIN pet pe ON at.idadoptiontest = pe.idadoptiontest
        JOIN adopterpets ap ON ap.idadoptionform = af.idadoptionform
        JOIN rescuerxpet rxp ON rxp.idpet = pe.idpet
        WHERE ap.idadoptionform = af.idadoptionform
        GROUP BY pe.idpet
    ) a,
    (
        SELECT COUNT(*) AS allpets, SUM(rxp.investment) AS totalinv
        FROM pet pe
        JOIN rescuerxpet rxp ON rxp.idpet = pe.idpet
        join rescuer r on rxp.idrescuer = r.idrescuer
        JOIN rescuecenterxrescuer rxr ON r.idrescuer = rxr.idrescuer
        where rxr.idrescuecenter = code
    ) b ;
END getAverageInversionAdopted;
/
SET SERVEROUTPUT ON;

DECLARE
    v_cursor SYS_REFCURSOR;
    pet_id NUMBER;
    avg_adoption_ratio NUMBER;
    avg_investment_ratio NUMBER;
BEGIN
    getAverageInversionAdopted(3, v_cursor); -- Cambia el código de rescate según tus necesidades
    LOOP
        FETCH v_cursor INTO pet_id, avg_adoption_ratio, avg_investment_ratio;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID Mascota: ' || pet_id  || ', Ratio Adopción: '||  avg_adoption_ratio ||', Ratio Inversión: ' || avg_investment_ratio);
    END LOOP;
    CLOSE v_cursor;
END;
/
----------------getcountries---------------------------------------------


create or replace procedure getCountries( v_cursor out sys_refcursor)
as begin open v_cursor for
select countryname from country
;
end getCountries;
/
DECLARE
    v_cursor SYS_REFCURSOR;
    country_name VARCHAR2(100);
BEGIN
    getCountries( v_cursor);
    DBMS_OUTPUT.PUT_LINE('Results:');
    LOOP
        FETCH v_cursor INTO country_name;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(' Country Name: ' || country_name);
    END LOOP;
    CLOSE v_cursor;
END;
/

-----------------------------------getProvinces-----------------------------------------
CREATE OR REPLACE PROCEDURE getProvinces(
    v_country IN VARCHAR2,
    v_cursor OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN v_cursor FOR
    SELECT pr.provincename
    FROM country co
    JOIN province pr ON co.idcountry = pr.idcountry
    WHERE co.countryname = NVL(v_country, co.countryname);
END getProvinces;
/

SET SERVEROUTPUT ON;
DECLARE
    v_country_name VARCHAR2(50) := 'Costa Rica';
    v_cursor SYS_REFCURSOR;
    v_province_name VARCHAR2(50);
BEGIN
    getProvinces(v_country_name, v_cursor);
    LOOP
        FETCH v_cursor INTO v_province_name;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Province Name: ' || v_province_name);
    END LOOP;
    CLOSE v_cursor;
END;
/
-------------------ObtenerCanton--------------------------------------
CREATE OR REPLACE PROCEDURE getCanton(
    v_country IN VARCHAR2,
    v_province IN VARCHAR2,
    v_cursor OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN v_cursor FOR
    SELECT ca.cantonname
    FROM country co
    JOIN province pr ON co.idcountry = pr.idcountry
    JOIN canton ca ON ca.idprovince = pr.idprovince
    WHERE co.countryname = NVL(v_country, co.countryname)
    AND pr.provincename = NVL(v_province, pr.provincename);
END getCanton;
/

SET SERVEROUTPUT ON;
DECLARE
    v_country_name VARCHAR2(50) := 'Costa Rica';
    v_province_name VARCHAR2(50) := 'Cartago';
    v_cursor SYS_REFCURSOR;
    v_canton_name VARCHAR2(50);
BEGIN
    getCanton(v_country_name, v_province_name, v_cursor);
    LOOP
        FETCH v_cursor INTO v_canton_name;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Canton Name: ' || v_canton_name);
    END LOOP;
    CLOSE v_cursor;
END;
/
-----------------------getdistricts------------------------------
CREATE OR REPLACE PROCEDURE getDistrict(
    v_country IN VARCHAR2,
    v_province IN VARCHAR2,
    v_canton in varchar2,
    v_cursor OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN v_cursor FOR
    SELECT d.districtname
    FROM country co
    JOIN province pr ON co.idcountry = pr.idcountry
    JOIN canton ca ON ca.idprovince = pr.idprovince
    join district d on d.idcanton = ca.idcanton
    WHERE co.countryname = NVL(v_country, co.countryname)
    AND pr.provincename = NVL(v_province, pr.provincename) and
    ca.cantonname = NVL(v_canton,ca.cantonname);
END getDistrict;
/

SET SERVEROUTPUT ON;
DECLARE
    v_country_name VARCHAR2(50) := 'Costa Rica';
    v_province_name VARCHAR2(50) := 'Cartago';
    v_canton varchar2 (50) := 'Paraiso';
    v_cursor SYS_REFCURSOR;
    v_canton_name VARCHAR2(50);
BEGIN
    getDistrict(v_country_name, v_province_name,v_canton, v_cursor);
    LOOP
        FETCH v_cursor INTO v_canton_name;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Canton Name: ' || v_canton_name);
    END LOOP;
    CLOSE v_cursor;
END;
/
---------------------------getPetStates-----------------------------------------
create or replace procedure getPetStates( v_cursor out sys_refcursor)
as begin open v_cursor for
select petstate from petstate
;
end getPetStates;
/
DECLARE
    v_cursor SYS_REFCURSOR;
    country_name number(1);
BEGIN
    getPetStates( v_cursor);
    DBMS_OUTPUT.PUT_LINE('Results:');
    LOOP
        FETCH v_cursor INTO country_name;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(' Country Name: ' || country_name);
    END LOOP;
    CLOSE v_cursor;
END;
/
----------------------------getTrainingDificulty------------------
create or replace procedure getTrainingDificulty( v_cursor out sys_refcursor)
as begin open v_cursor for
select difficultylevel from trainingdificulty
;
end getTrainingDificulty;
/
DECLARE
    v_cursor SYS_REFCURSOR;
    country_name number(1);
BEGIN
    getTrainingDificulty( v_cursor);
    DBMS_OUTPUT.PUT_LINE('Results:');
    LOOP
        FETCH v_cursor INTO country_name;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(' Country Name: ' || country_name);
    END LOOP;
    CLOSE v_cursor;
END;
/
-----------------------------getPetType---------------------------------------
create or replace procedure getPetType( v_cursor out sys_refcursor)
as begin open v_cursor for
select pettype from pettype
;
end getPetType;
/
DECLARE
    v_cursor SYS_REFCURSOR;
    country_name varchar2(20);
BEGIN
    getPetType( v_cursor);
    DBMS_OUTPUT.PUT_LINE('Results:');
    LOOP
        FETCH v_cursor INTO country_name;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(' Pet Type: ' || country_name);
    END LOOP;
    CLOSE v_cursor;
END;
/
--------------------getEnergyLevel------------------------
create or replace procedure getEnergyLevel( v_cursor out sys_refcursor)
as begin open v_cursor for
select energylevel from energylevel
;
end getEnergyLevel;
/
DECLARE
    v_cursor SYS_REFCURSOR;
    country_name number(1);
BEGIN
    getEnergyLevel( v_cursor);
    DBMS_OUTPUT.PUT_LINE('Results:');
    LOOP
        FETCH v_cursor INTO country_name;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(' Energy Level: ' || country_name);
    END LOOP;
    CLOSE v_cursor;
END;
/
---------------------GetSeverity--------------------
create or replace procedure getSeverity( v_cursor out sys_refcursor)
as begin open v_cursor for
select grade from Severity
;
end getSeverity;
/
DECLARE
    v_cursor SYS_REFCURSOR;
    country_name number(1);
BEGIN
    getSeverity( v_cursor);
    DBMS_OUTPUT.PUT_LINE('Results:');
    LOOP
        FETCH v_cursor INTO country_name;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(' Energy Level: ' || country_name);
    END LOOP;
    CLOSE v_cursor;
END;
/
---------------------------GetBreed-----------------
create or replace procedure getBreed( v_cursor out sys_refcursor)
as begin open v_cursor for
select breed from breed
;
end getBreed;
/
DECLARE
    v_cursor SYS_REFCURSOR;
    country_name varchar2(30);
BEGIN
    getBreed( v_cursor);
    DBMS_OUTPUT.PUT_LINE('Results:');
    LOOP
        FETCH v_cursor INTO country_name;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(' Breed: ' || country_name);
    END LOOP;
    CLOSE v_cursor;
END;
/

--------------------GetColors-----------------------
create or replace procedure getColor( v_cursor out sys_refcursor)
as begin open v_cursor for
select color from color
;
end getColor;
/
DECLARE
    v_cursor SYS_REFCURSOR;
    country_name varchar2(30);
BEGIN
    getColor( v_cursor);
    DBMS_OUTPUT.PUT_LINE('Results:');
    LOOP
        FETCH v_cursor INTO country_name;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(' Breed: ' || country_name);
    END LOOP;
    CLOSE v_cursor;
END;
/
--------------------Here is a other insertion------------
insert into sickness(idsickness,sickness)
values(sickness_seq.nextval,'Other');
---------------getsicknessPerName-----------------------

----------------------------------------------------inserts------------------------------------------------------------------------------------------------------
------------------PersonInsertionUser---------------------------------
CREATE OR REPLACE PROCEDURE insertRescueCenterUser(
    pIdPerson IN NUMBER,
    pUsername IN VARCHAR2,
    pUserPassword IN VARCHAR2
)
AS
BEGIN
    INSERT INTO rescueCenterUser(idRescuecenteruser, idPerson, usernames, userPassword)
    VALUES (rescueCenterUser_seq.nextval, pIdPerson, pUsername, pUserPassword);
    COMMIT;
END insertRescueCenterUser;
/
------------------------------PersoninsertionAdoptant-----------------------------

CREATE OR REPLACE PROCEDURE insertPersonAdoptant (
    pfirstName IN VARCHAR2,
    psecondName IN VARCHAR2,
    pfirstSurname IN VARCHAR2,
    psecondSurname IN VARCHAR2,
    pbirthDate IN DATE,
    pgenre IN VARCHAR2,
    pcarnet IN NUMBER,
    pusernamep IN VARCHAR2,
    ppasswordp IN VARCHAR2,
    gmailp in varchar2,
    phonep in varchar2,
    countryp in varchar2,
    provincep in varchar2,
    cantonp in varchar2,
    districtp in varchar2,
    resCenter in varchar2
)
AS
idendistrict number(6);
idresCenter number(6);
idpersonp number(6);
BEGIN
    idresCenter := getIdRCPerName(resCenter);
     idendistrict:= getDistrictpername(countryp,provincep,cantonp,districtp);
    INSERT INTO person(idPerson, firstName, secondName, firstSurname, secondSurname, birthDate, genre, carnet)
    VALUES (person_seq.nextval, pfirstName, psecondName, pfirstSurname, psecondSurname, pbirthDate, pgenre, pcarnet);
    insertRescueCenterUser(person_seq.currval, pusernamep, ppasswordp);
    insert into phone(idphone,phonenumber)
    values(phone_seq.nextval,phonep);
    insert into email(idemail,email)
    values(email_seq.nextval,gmailp);
    insert into personxemail(idpersonxemail,idperson,idemail)
    values (personxemail_seq.nextval,person_seq.currval,email_seq.currval);
    insert into personxphone(idpersonxphone,idperson,idphone)
    values (personxphone_seq.nextval,person_seq.currval,phone_seq.currval);
    insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
    values(personxdistrict_seq.nextval,person_seq.currval,idendistrict);
    insert into adoptioncandidate(idadoptioncandidate,idrescuecenteruser)
    values(adoptioncandidate_seq.nextval,rescuecenteruser_seq.currval);
    insert into rescuecxcandidate(idrescuexcandidate,idrescuecenter,idadoptioncandidate)
    values(rescuexcandidate_seq.nextval,idresCenter,adoptionCandidate_seq.currval);
    COMMIT;   
END insertPersonAdoptant;
/

SET SERVEROUTPUT ON;

DECLARE
    v_firstName VARCHAR2(50) := 'Vidal';
    v_secondName VARCHAR2(50) := 'Doe';
    v_firstSurname VARCHAR2(50) := 'Smith';
    v_secondSurname VARCHAR2(50) := 'Floresa';
    v_birthDate DATE := TO_DATE('2000-01-01', 'YYYY-MM-DD');
    v_genre VARCHAR2(10) := 'Masculino';
    v_carnet NUMBER := 123457789;
    v_username VARCHAR2(50) := 'example';
    v_password VARCHAR2(50) := 'example';
    v_email VARCHAR2(50) := 'example@example.com';
    v_phone VARCHAR2(15) := 98877698;
    v_country VARCHAR2(50) := 'Costa Rica';
    v_province VARCHAR2(50) := 'Cartago';
    v_canton VARCHAR2(50) := 'Paraiso';
    v_district VARCHAR2(50) := 'Paraiso';
    v_rescue_center VARCHAR2(50) := 'CartagoRescuers';
BEGIN
    insertPersonAdoptant(
        v_firstName,
        v_secondName,
        v_firstSurname,
       v_secondSurname,
        v_birthDate,
       v_genre,
        v_carnet,
        v_username,
         v_password,
         v_email,
         v_phone,
         v_country,
         v_province,
        v_canton,
        v_district,
         v_rescue_center
    );

    DBMS_OUTPUT.PUT_LINE('Person inserted successfully.');
END;
/
------------------------------insertpersonrescuer---------------------------------------------------
CREATE OR REPLACE PROCEDURE insertPersonRescuer (
    pfirstName IN VARCHAR2,
    psecondName IN VARCHAR2,
    pfirstSurname IN VARCHAR2,
    psecondSurname IN VARCHAR2,
    pbirthDate IN DATE,
    pgenre IN VARCHAR2,
    pcarnet IN NUMBER,
    pusernamep IN VARCHAR2,
    ppasswordp IN VARCHAR2,
    gmailp in varchar2,
    phonep in varchar2,
    countryp in varchar2,
    provincep in varchar2,
    cantonp in varchar2,
    districtp in varchar2,
    resCenter in varchar2
)
AS
idendistrict number(6);
idresCenter number(6);

BEGIN
    idresCenter := getIdRCPerName(resCenter);
     idendistrict:= getDistrictpername(countryp,provincep,cantonp,districtp);
    INSERT INTO person(idPerson, firstName, secondName, firstSurname, secondSurname, birthDate, genre, carnet)
    VALUES (person_seq.nextval, pfirstName, psecondName, pfirstSurname, psecondSurname, pbirthDate, pgenre, pcarnet);
    
    insertRescueCenterUser(person_seq.currval, pusernamep, ppasswordp);
    
    insert into phone(idphone,phonenumber)
    values(phone_seq.nextval,phonep);
    
    insert into email(idemail,email)
    values(email_seq.nextval,gmailp);
    
    insert into personxemail(idpersonxemail,idperson,idemail)
    values (personxemail_seq.nextval,person_seq.currval,email_seq.currval);
    
    insert into personxphone(idpersonxphone,idperson,idphone)
    values (personxphone_seq.nextval,person_seq.currval,phone_seq.currval);
    
    insert into personxdistrict(idpersonxdistrict,idperson,iddistrict)
    values(personxdistrict_seq.nextval,person_seq.currval,idendistrict);
    
    insert into rescuer(idrescuer,idperson)
    values(rescuer_seq.nextval,person_seq.currval);
    
    insert into rescuecenterxrescuer(idrescuecenterxrescuer,idrescuecenter,idrescuer)
    values(rescuecenterxrescuer_seq.nextval,idresCenter,rescuer_seq.currval);
    
    COMMIT;   
END insertPersonRescuer;
/
----------------------prueba---------------------------------------
SET SERVEROUTPUT ON;

DECLARE
    v_firstName VARCHAR2(50) := 'Roberto';
    v_secondName VARCHAR2(50) := 'Dober';
    v_firstSurname VARCHAR2(50) := 'Sqeuira';
    v_secondSurname VARCHAR2(50) := 'djoe';
    v_birthDate DATE := TO_DATE('1977-01-01', 'YYYY-MM-DD');
    v_genre VARCHAR2(10) := 'Masculino';
    v_carnet NUMBER := 123457289;
    v_username VARCHAR2(50) := 'example2';
    v_password VARCHAR2(50) := 'example2';
    v_email VARCHAR2(50) := 'examne@example.com';
    v_phone VARCHAR2(15) := 98177698;
    v_country VARCHAR2(50) := 'Costa Rica';
    v_province VARCHAR2(50) := 'Cartago';
    v_canton VARCHAR2(50) := 'Paraiso';
    v_district VARCHAR2(50) := 'Paraiso';
    v_rescue_center VARCHAR2(50) := 'CartagoRescuers';
BEGIN
    insertPersonAdoptant(
        v_firstName,
        v_secondName,
        v_firstSurname,
       v_secondSurname,
        v_birthDate,
       v_genre,
        v_carnet,
        v_username,
         v_password,
         v_email,
         v_phone,
         v_country,
         v_province,
        v_canton,
        v_district,
         v_rescue_center
    );

    DBMS_OUTPUT.PUT_LINE('Person inserted successfully.');
END;
/
-------------------------insertRescueCenter---------------------------------------------

create or replace PROCEDURE insertRescueCenter
(pIdDistrict IN NUMBER, pRescueCenterName IN VARCHAR2, pRescueCenterType IN NUMBER)
AS
BEGIN
    INSERT INTO RescueCenter(idRescueCenter, idDistrict, rescueCenterName, rescuecentertype)
        VALUES (rescueCenter_seq.nextval, pIdDistrict, pRescueCenterName, pRescueCenterType);
    COMMIT;
END insertRescueCenter;
/
--------------------------full insertion RescueCenter---------------------------------------
create or replace procedure fullInsertRescueCenter(countryp in varchar2,provincep in varchar2,cantonp in varchar2,districtp in varchar2,namep in varchar2,ptype in number)
as idendistrict number(6);
begin
idendistrict:= getDistrictpername(countryp,provincep,cantonp,districtp); 
insertRescueCenter(idendistrict,namep,ptype);
end fullInsertRescueCenter;
/
------------------prueba-----------------
-- Definir variables de entrada
DECLARE
    v_countryp VARCHAR2(50) := 'Costa Rica';
    v_provincep VARCHAR2(50) := 'Cartago';
    v_cantonp VARCHAR2(50) := 'Paraiso';
    v_districtp VARCHAR2(50) := 'Paraiso';
    v_namep VARCHAR2(50) := 'ParaisoRescuers';
    v_ptype NUMBER := 1;
BEGIN
    -- Llamar al procedimiento fullInsertRescueCenter con las variables de entrada
    fullInsertRescueCenter(v_countryp, v_provincep, v_cantonp, v_districtp, v_namep, v_ptype);
    -- Commitear los cambios
    COMMIT;
    -- Mostrar un mensaje para indicar que la operación fue exitosa
    DBMS_OUTPUT.PUT_LINE('Procedimiento ejecutado exitosamente.');
END;
/
------------------PetInsertion---------------------------------------------------------------------
create or replace procedure insertionPet(petstatep in number,trainingdificultyp in number,pettypep in number,energylevelp in number, severityp in number,chipp in number,petnamep in varchar2,petsizep in varchar2,notep in varchar2, neededspacep in varchar2, breedp in varchar2, petcolorp in varchar2,usernamep in varchar2)
as idenpetstate number(6);identp number(6);idenpt number(6);idenel number(6);idenseverity number(6);idenbreed number(6);idencolor number(6); idenuser number(6); idenRescuer number(6);
begin
idenpetstate := getpetstatepernum(petstatep);
identp:=getTDpernum(trainingdificultyp);
idenpt:=getPTperName(pettypep);
idenel:=getELperNum(energylevelp);
idenseverity:=getSeverityperNum(severityp);
idenbreed:=getBreedpername(idenbreed);
idencolor:=getPetColorPerName(petcolorp);
idenuser:=getIdPersonPerUsernames(usernamep);
idenRescuer:= getIdRescuerPerIdPerson(idenRescuer);
insert into adoptiontest(idadoptiontest)
VALUES(adoptiontest_seq.nextval);
insert into chip(idchip,enabled,code)
values(chip_seq.nextval,1,chipp);
insert into pet(idpet,idpetstate,idtrainingdificulty,idpettype,idenergylevel,idseverity,idchip,idadoptiontest,petname,petsize,note,neededspace,idbreed)
values(pet_seq.nextval,idenpetstate,identp,idenpt,idenel,idenseverity,chip_seq.currval,adoptiontest_seq.currval,petnamep,petsizep,notep,neededspacep,idenbreed)
;
insert into colorxpet (idcolorxpet,idcolor,idpet)
values(colorxpet_seq.nextval,idencolor,pet_seq.currval);
insert into rescuerxpet(idrescuerxpet,idrescuer,idpet)
values(rescuerxpet_seq.nextval,idenRescuer,pet_seq.currval);

commit;
end insertionPet;
/
------------------------insertionSickPet---------------------
create or replace procedure insertionSickPet(petstatep in number,trainingdificultyp in number,pettypep in number,energylevelp in number, severityp in number,chipp in number,petnamep in varchar2,petsizep in varchar2,notep in varchar2, neededspacep in varchar2, breedp in varchar2, petcolorp in varchar2,sicknessp in varchar2,treatmentp in  varchar2,usernamep in varchar2)
as idenpetstate number(6);identp number(6);idenpt number(6);idenel number(6);idenseverity number(6);idenbreed number(6);idencolor number(6);idensickness number(6);idenuser number(6); idenRescuer number(6);
begin
idenpetstate := getpetstatepernum(petstatep);
identp:=getTDpernum(trainingdificultyp);
idenpt:=getPTperName(pettypep);
idenel:=getELperNum(energylevelp);
idenseverity:=getSeverityperNum(severityp);
idenbreed:=getBreedpername(idenbreed);
idencolor:=getPetColorPerName(petcolorp);
idensickness:=getSicknessPerName(sicknessp);
idenuser:=getIdPersonPerUsernames(usernamep);
idenRescuer:= getIdRescuerPerIdPerson(idenRescuer);
insert into adoptiontest(idadoptiontest)
VALUES(adoptiontest_seq.nextval);
insert into chip(idchip,enabled,code)
values(chip_seq.nextval,1,chipp);
insert into pet(idpet,idpetstate,idtrainingdificulty,idpettype,idenergylevel,idseverity,idchip,idadoptiontest,petname,petsize,note,neededspace,idbreed)
values(pet_seq.nextval,idenpetstate,identp,idenpt,idenel,idenseverity,chip_seq.currval,adoptiontest_seq.currval,petnamep,petsizep,notep,neededspacep,idenbreed)
;
insert into colorxpet (idcolorxpet,idcolor,idpet)
values(colorxpet_seq.nextval,idencolor,pet_seq.currval);
insert into petxsickness(idpetxsickness,idpet,idsickness)
values (petxsickness_seq.nextval,pet_seq.currval,idensickness);
insert into treatment(idtreatment,treatment)
values(treatment_seq.nextval,treatmentp);
insert into sicknessxtreatment(IDSICKNESSXTREATMENT,idsickness,idtreatment)
values(sicknessxtreatment_seq.nextval,sicknessp,treatment_seq.currval);
insert into rescuerxpet(idrescuerxpet,idrescuer,idpet)
values(rescuerxpet_seq.nextval,idenRescuer,pet_seq.currval);
commit;
end insertionSickPet;
/
-------------------LostPetInsertion------------------------
alter table lostpet
modify placelost number(6) constraint lostpet_placelost_fk references district(iddistrict);
---------------------------
insert into lostpet(idlostpet, idpet, idcurrency, lostdate, placelost, reward, foundercarnet)
values(lostpet_seq.nextval, 5, 2, TO_DATE('23-10-2023', 'DD-MM-YYYY'), 252, 100000, 305390790)


alter table photo
add idpet number(6) constraint photo_idpet_fk references pet(idpet);

alter table adoptionform
add photospace blob;
---------------------------

create or replace procedure insertionLostPet(petstatep in number,trainingdificultyp in number,pettypep in number,energylevelp in number, severityp in number,chipp in number,petnamep in varchar2,petsizep in varchar2,notep in varchar2,
neededspacep in varchar2, breedp in varchar2, petcolorp in varchar2,usernamep in varchar2,petphoto in blob,countryp in varchar2, provincep in varchar2,cantonp in varchar2,districtp in varchar2,lostdatep in date,rewardp in number,currencyp in number,carnetp in number)
as idenpetstate number(6);identp number(6);idenpt number(6);idenel number(6);idenseverity number(6);idenbreed number(6);idencolor number(6); idendistrict number(6); idenCurrency number(6);idenuser number(6); idenRescuer number(6);
begin
idenpetstate := getpetstatepernum(petstatep);
identp:=getTDpernum(trainingdificultyp);
idenpt:=getPTperName(pettypep);
idenel:=getELperNum(energylevelp);
idenseverity:=getSeverityperNum(severityp);
idenbreed:=getBreedpername(idenbreed);
idencolor:=getPetColorPerName(petcolorp);
idendistrict:=getdistrictpername(countryp,provincep,cantonp,districtp);
idencurrency:=getIdCurrencyPerName(currencyp);
idenuser:=getIdPersonPerUsernames(usernamep);
idenRescuer:= getIdRescuerPerIdPerson(idenRescuer);
insert into adoptiontest(idadoptiontest)
VALUES(adoptiontest_seq.nextval);
insert into chip(idchip,enabled,code)
values(chip_seq.nextval,1,chipp);
insert into pet(idpet,idpetstate,idtrainingdificulty,idpettype,idenergylevel,idseverity,idchip,idadoptiontest,petname,petsize,note,neededspace,idbreed)
values(pet_seq.nextval,idenpetstate,identp,idenpt,idenel,idenseverity,chip_seq.currval,adoptiontest_seq.currval,petnamep,petsizep,notep,neededspacep,idenbreed)
;
insert into colorxpet (idcolorxpet,idcolor,idpet)
values(colorxpet_seq.nextval,idencolor,pet_seq.currval);
insert into rescuerxpet(idrescuerxpet,idrescuer,idpet)
values(rescuerxpet_seq.nextval,idenRescuer,pet_seq.currval);
insert into lostpet(idlostpet,idpet,idcurrency,lostdate,placelost,reward,foundercarnet)
values(lostpet_seq.nextval,pet_seq.currval,idencurrency,lostdatep,idendistrict,rewardp,carnetp);
insert into photo(idphoto,photo,photodescription,idpet)
values(photo_seq.nextval,petphoto,'Animal Lost',pet_seq.currval);
commit;
end insertionLostPet;
/
-----------------insertionSickPetLost--------------------------
create or replace procedure insertionSickLostPet(petstatep in number,trainingdificultyp in number,pettypep in number,energylevelp in number, severityp in number,chipp in number,petnamep in varchar2,petsizep in varchar2,notep in varchar2,
neededspacep in varchar2, breedp in varchar2, petcolorp in varchar2,usernamep in varchar2,petphoto in blob,countryp in varchar2, provincep in varchar2,cantonp in varchar2,districtp in varchar2,lostdatep in date,rewardp in number,currencyp in number,carnetp in number,sicknessp in varchar2,treatmentp in  varchar2)
as idenpetstate number(6);identp number(6);idenpt number(6);idenel number(6);idenseverity number(6);idenbreed number(6);idencolor number(6); idendistrict number(6); idenCurrency number(6);idenuser number(6); idenRescuer number(6);idensickness number(6);

begin
idenpetstate := getpetstatepernum(petstatep);
identp:=getTDpernum(trainingdificultyp);
idenpt:=getPTperName(pettypep);
idenel:=getELperNum(energylevelp);
idenseverity:=getSeverityperNum(severityp);
idenbreed:=getBreedpername(idenbreed);
idencolor:=getPetColorPerName(petcolorp);
idensickness:=getSicknessPerName(sicknessp);
idendistrict:=getdistrictpername(countryp,provincep,cantonp,districtp);
idencurrency:=getIdCurrencyPerName(currencyp);
idenuser:=getIdPersonPerUsernames(usernamep);
idenRescuer:= getIdRescuerPerIdPerson(idenRescuer);
insert into adoptiontest(idadoptiontest)
VALUES(adoptiontest_seq.nextval);
insert into chip(idchip,enabled,code)
values(chip_seq.nextval,1,chipp);
insert into pet(idpet,idpetstate,idtrainingdificulty,idpettype,idenergylevel,idseverity,idchip,idadoptiontest,petname,petsize,note,neededspace,idbreed)
values(pet_seq.nextval,idenpetstate,identp,idenpt,idenel,idenseverity,chip_seq.currval,adoptiontest_seq.currval,petnamep,petsizep,notep,neededspacep,idenbreed)
;
insert into colorxpet (idcolorxpet,idcolor,idpet)
values(colorxpet_seq.nextval,idencolor,pet_seq.currval);
insert into rescuerxpet(idrescuerxpet,idrescuer,idpet)
values(rescuerxpet_seq.nextval,idenRescuer,pet_seq.currval);
insert into lostpet(idlostpet,idpet,idcurrency,lostdate,placelost,reward,foundercarnet)
values(lostpet_seq.nextval,pet_seq.currval,idencurrency,lostdatep,idendistrict,rewardp,carnetp);
insert into petxsickness(idpetxsickness,idpet,idsickness)
values (petxsickness_seq.nextval,pet_seq.currval,idensickness);
insert into treatment(idtreatment,treatment)
values(treatment_seq.nextval,treatmentp);
insert into photo(idphoto,idpet,photo,photodescription)
values(photo_seq.nextval,pet_seq.currval,petphoto,'Animal Lost');
insert into sicknessxtreatment(IDSICKNESSXTREATMENT,idsickness,idtreatment)
values(sicknessxtreatment_seq.nextval,sicknessp,treatment_seq.currval);
commit;
end insertionSickLostPet;
/
------------------insertionFullAdoptionForm------------------------
CREATE OR REPLACE PROCEDURE insertionFullAdoptionForm(
    interestp IN NUMBER,
    ishouseownerp IN NUMBER,
    authorizationp IN NUMBER,
    budgetp IN NUMBER,
    daitip IN VARCHAR2,
    motivep IN VARCHAR2,
    qualificationp IN NUMBER,
    adoptiontestp IN NUMBER,
    carereasonp IN NUMBER,
    spacephotop IN BLOB,
    petsPhoto IN BLOB,
    usernamep IN VARCHAR2
) AS
    ideninterest NUMBER(6);
    idenrc NUMBER(6);
    idenrcu NUMBER(6);
BEGIN
    ideninterest := getIdInterestPerNum(interestp);
    idenrc := getIdRCPerIdAT(adoptiontestp);
    idenrcu := getIdRCUPerUsernames(usernamep);

    INSERT INTO adoptioncandidate(idadoptioncandidate, idrescuecenteruser)
    VALUES(adoptioncandidate_seq.nextval, idenrcu);

    INSERT INTO rescuecxcandidate(idrescuexcandidate, idrescuecenter, idadoptioncandidate)
    VALUES(rescuexcandidate_seq.nextval, idenrc, adoptioncandidate_seq.currval);

    INSERT INTO adoptionform(
        idadoptionform, idinterest, ishouseowner, aauthorization, budget, dailytime,
        motive, qualification, idadoptiontest, carereason, idadoptioncandidate, photospace
    ) VALUES(
        adoptionform_seq.nextval, ideninterest, ishouseownerp, authorizationp, budgetp, daitip,
        motivep, qualificationp, adoptiontestp, carereasonp, adoptioncandidate_seq.currval, spacephotop
    );
    INSERT INTO otherpets (idotherpets,idadoptionform,photo)
    values (otherpets_seq.nextval,adoptionform_seq.currval,petsphoto);
    COMMIT;
END insertionFullAdoptionForm;
/



----------------insertPersonInBannedlist--------------------------
create or replace procedure insertPersonInBannedList(carnetp IN NUMBER,usernamep IN VARCHAR2)
AS 
    idenbl NUMBER(6);
    idenperson NUMBER(6);
   
BEGIN
    idenbl := getIdBlPerUsernames(usernamep);
    idenperson:=getIdPersonPerCarnet(carnetp);
    insert into personxbannedlist(idpersonxbannedlist,idbannedlist,idperson)
    values(personxbannedlist_seq.nextval,idenbl,idenperson);
end insertPersonInBannedList;
/
----------------insertHostHomeForm------------------------------
create or replace procedure insertHostHomeForm(pettypep IN varchar2,usernamep IN VARCHAR2,sizehousep IN NUMBER,dm IN NUMBER,dop IN VARCHAR2)
AS 
    idenpt NUMBER(6);
    idenrcu NUMBER(6);
   
BEGIN
    idenpt := getPTPerName(pettypep);
    idenrcu:=getIdPersonPerCarnet(usernamep);
    insert into hosthomeform(idhosthomeform,idrescuecenteruser,idpettype,sizehouse,donationmoney,donationother)
    values(hosthomeform_seq.nextval,idenrcu,idenpt,sizehousep,dm,dop);
end insertHostHomeForm;
/
----------------getIdPersonPerCarnet----------------------------
CREATE OR REPLACE FUNCTION getIdPersonPerCarnet(cname IN number) RETURN NUMBER
IS
    idc NUMBER(6);
BEGIN
    SELECT idperson INTO idc FROM person
    WHERE carnet= cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getIdPersonPerCarnet;
/
DECLARE
    v_country_name number := 301000001;
    v_country_id NUMBER;
BEGIN
    v_country_id := getIdPersonPerCarnet(v_country_name);
    
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Country ID for ' ||  v_country_name || ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Country not found: ' || v_country_name);
    END IF;
END;
/
---------------getIdBLPerUsernames------------------------------
CREATE OR REPLACE FUNCTION getIdBlPerUsernames(cname IN VARCHAR2) RETURN NUMBER IS
    idc NUMBER(6);
BEGIN
    SELECT bl.idbannedlist INTO idc FROM rescuecenteruser rcu
    join person p on rcu.idperson = p.idperson
    join rescuer r on r.idperson = p.idperson
    join bannedlistxrescuer bxr on bxr.idrescuer = r.idrescuer
    join bannedlist bl on bl.idbannedlist = bxr.idbannedlist
    WHERE rcu.usernames = cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getIdBlPerUsernames;
/

DECLARE
    v_country_name VARCHAR2(100) := 'pochosayayin1';
    v_country_id NUMBER(6);
BEGIN
    v_country_id := getIdBlPerUsernames(v_country_name);
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Person ID for ' || v_country_name ||  ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Person not found: ' || v_country_name);
    END IF;
END;
/

----------------getIdRCUPerUsernames----------------------------
CREATE OR REPLACE FUNCTION getIdRCUPerUsernames(cname IN VARCHAR2) RETURN NUMBER IS
    idc NUMBER(6);
BEGIN
    SELECT c.idrescuecenteruser INTO idc FROM rescuecenteruser c 
    WHERE c.usernames = cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getIdRCUPerUsernames;
/

DECLARE
    v_country_name VARCHAR2(100) := 'pochosayayin20';
    v_country_id NUMBER(6);
BEGIN
    v_country_id := getIdRCUPerUsernames(v_country_name);
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Person ID for ' || v_country_name ||  ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Person not found: ' || v_country_name);
    END IF;
END;
/
-----------------getIdRCPerUsername-----------------
CREATE OR REPLACE FUNCTION getIdRCPerUsername(cname IN VARCHAR2) RETURN NUMBER IS
    idc NUMBER(6);
BEGIN
    SELECT c.idrescuecenteruser INTO idc FROM rescuecenteruser c 
    WHERE c.usernames = cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getIdRCPerUsername;
/

DECLARE
    v_country_name VARCHAR2(100) := 'pochosayayin20';
    v_country_id NUMBER(6);
BEGIN
    v_country_id := getIdRCPerUsername(v_country_name);
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Person ID for ' || v_country_name ||  ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Person not found: ' || v_country_name);
    END IF;
END;
/
-----------------getIdRCPerIdAT---------------------------------
CREATE OR REPLACE FUNCTION getIdRCPerIdAT(cname IN number) RETURN NUMBER
IS
    idc NUMBER(6);
BEGIN
    SELECT rxr.idRescuecenter INTO idc FROM pet pe
    join rescuerxpet rxp on pe.idpet = rxp.idpet
    join rescuecenterxrescuer rxr on rxr.idrescuer = rxp.idrescuer
    WHERE pe.idadoptiontest= cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getIdRCPerIdAT;
/
DECLARE
    v_country_name number := 3;
    v_country_id NUMBER;
BEGIN
    v_country_id := getIdRCPerIdAT(v_country_name);
    
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Country ID for ' ||  v_country_name || ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Country not found: ' || v_country_name);
    END IF;
END;
/
-----------------getIdInterestPerNum---------------------------
CREATE OR REPLACE FUNCTION getIdInterestPerNum(cname IN number) RETURN NUMBER
IS
    idc NUMBER(6);
BEGIN
    SELECT idinterest INTO idc FROM interest WHERE interestrate= cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getIdInterestPerNum;
/
DECLARE
    v_country_name number := 1;
    v_country_id NUMBER;
BEGIN
    v_country_id := getIdInterestPerNum(v_country_name);
    
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Country ID for ' ||  v_country_name || ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Country not found: ' || v_country_name);
    END IF;
END;
/
------------------getIdAdoptionTestPerNum----------------------

------------------getIdCurrencyPerName-------------------------
CREATE OR REPLACE FUNCTION getIdCurrencyPerName(cname IN VARCHAR2) RETURN NUMBER IS
    idc NUMBER(6);
BEGIN
    SELECT c.idcurrency INTO idc FROM currency c 
    WHERE c.currency = cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getIdCurrencyPerName;
/

DECLARE
    v_country_name VARCHAR2(100) := 'Colon costarricense';
    v_country_id NUMBER(6);
BEGIN
    v_country_id := getIdCurrencyPerName(v_country_name);
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Person ID for ' || v_country_name ||  ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Person not found: ' || v_country_name);
    END IF;
END;
/
-----------------functions extras----------------------------
CREATE OR REPLACE FUNCTION getIdPersonPerUsernames(cname IN VARCHAR2) RETURN NUMBER IS
    idc NUMBER(6);
BEGIN
    SELECT p.idperson INTO idc FROM person p JOIN rescuecenteruser rcu ON rcu.idperson = p.idperson
    WHERE rcu.usernames = cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getIdPersonPerUsernames;
/

DECLARE
    v_country_name VARCHAR2(100) := 'pochosayayin20';
    v_country_id NUMBER(6);
BEGIN
    v_country_id := getIdPersonPerUsernames(v_country_name);
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Person ID for ' || v_country_name ||  ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Person not found: ' || v_country_name);
    END IF;
END;
/
-------------------getIdACPerUsernames-----------------------
-------------------

-------------------getIdRescuerPerIdPerson-------------------
CREATE OR REPLACE FUNCTION getIdRescuerPerIdPerson(cname IN VARCHAR2) RETURN NUMBER IS
    idc NUMBER(6);
BEGIN
    SELECT r.idrescuer INTO idc FROM rescuer r
    WHERE r.idperson = cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getIdRescuerPerIdPerson;
/

DECLARE
    v_country_name number(6) := 1;
    v_country_id NUMBER(6);
BEGIN
    v_country_id := getIdRescuerPerIdPerson(v_country_name);
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Person ID for ' || v_country_name ||  ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Person not found: ' || v_country_name);
    END IF;
END;
/
-------------------------------------------------------------
CREATE OR REPLACE FUNCTION getPetStatePerNum(cname IN number) RETURN NUMBER
IS
    idc NUMBER(6);
BEGIN
    SELECT idPetState INTO idc FROM PetState WHERE petstate= cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getPetStatePerNum;
/
DECLARE
    v_country_name number := 1;
    v_country_id NUMBER;
BEGIN
    v_country_id := getPetStatePerNum(v_country_name);
    
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Country ID for ' ||  v_country_name || ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Country not found: ' || v_country_name);
    END IF;
END;
/
---------------gettrainingdificultypernum-------------------------
CREATE OR REPLACE FUNCTION getTDPerNum(cname IN number) RETURN NUMBER
IS
    idc NUMBER(6);
BEGIN
    SELECT idTrainingDificulty INTO idc FROM trainingdificulty WHERE difficultylevel= cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getTDPerNum;
/
DECLARE
    v_country_name number := 1;
    v_country_id NUMBER;
BEGIN
    v_country_id := getTDPerNum(v_country_name);
    
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Country ID for ' ||  v_country_name || ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Country not found: ' || v_country_name);
    END IF;
END;
/
-----------------------------getenergylevelpernum----------------------------
CREATE OR REPLACE FUNCTION getELPerNum(cname IN number) RETURN NUMBER
IS
    idc NUMBER(6);
BEGIN
    SELECT idENERGYLEVEL INTO idc FROM ENERGYLEVEL WHERE energylevel= cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getELPerNum;
/
DECLARE
    v_country_name number := 1;
    v_country_id NUMBER;
BEGIN
    v_country_id := getELPerNum(v_country_name);
    
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Country ID for ' ||  v_country_name || ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Country not found: ' || v_country_name);
    END IF;
END;
/
-----------------------------getpettypepername--------------------------------
CREATE OR REPLACE FUNCTION getPTPerName(cname IN varchar2) RETURN NUMBER
IS
    idc NUMBER(6);
BEGIN
    SELECT idpettype INTO idc FROM pettype WHERE pettype= cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getPTPerName;
/
DECLARE
    v_country_name varchar2(25):= 'Dog';
    v_country_id NUMBER;
BEGIN
    v_country_id := getPTPerName(v_country_name);
    
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Country ID for ' ||  v_country_name || ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Country not found: ' || v_country_name);
    END IF;
END;
/
-------------------------------getseveritypernum----------------------------
CREATE OR REPLACE FUNCTION getSeverityPerNum(cname IN varchar2) RETURN NUMBER
IS
    idc NUMBER(6);
BEGIN
    SELECT idseverity INTO idc FROM severity WHERE grade= cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getSeverityPerNum;
/
DECLARE
    v_country_name number:= 1;
    v_country_id NUMBER;
BEGIN
    v_country_id := getSeverityPerNum(v_country_name);
    
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Country ID for ' ||  v_country_name || ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Country not found: ' || v_country_name);
    END IF;
END;
/
-----------------------------getbreedpername-------------
CREATE OR REPLACE FUNCTION getBreedPerName(cname IN varchar2) RETURN NUMBER
IS
    idc NUMBER(6);
BEGIN
    SELECT idbreed INTO idc FROM breed WHERE breed= cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getBreedPerName;
/
DECLARE
    v_country_name varchar2(25):= 'Rottweiler';
    v_country_id NUMBER;
BEGIN
    v_country_id := getBreedPerName(v_country_name);
    
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Country ID for ' ||  v_country_name || ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Country not found: ' || v_country_name);
    END IF;
END;
/
----------------------------getsicknesspername---------------------------------------
CREATE OR REPLACE FUNCTION getSicknessPerName(cname IN varchar2) RETURN NUMBER
IS
    idc NUMBER(6);
BEGIN
    SELECT idsickness INTO idc FROM sickness WHERE sickness= cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getSicknessPerName;
/
DECLARE
    v_country_name varchar2(25):= 'Ear infection';
    v_country_id NUMBER;
BEGIN
    v_country_id := getSicknessPerName(v_country_name);
    
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Country ID for ' ||  v_country_name || ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Country not found: ' || v_country_name);
    END IF;
END;
/
-------------------------getPetColorPerName--------------------------------------------------------
CREATE OR REPLACE FUNCTION getPetColorPerName(cname IN varchar2) RETURN NUMBER
IS
    idc NUMBER(6);
BEGIN
    SELECT idColor INTO idc FROM color WHERE color= cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getPetColorPerName;
/
DECLARE
        v_country_name varchar2(25):= 'White';
    v_country_id NUMBER;
BEGIN
    v_country_id := getPetColorPerName(v_country_name);
    
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Country ID for ' ||  v_country_name || ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Country not found: ' || v_country_name);
    END IF;
END;
/
-----------------------------COuntryinsertion------------------------------------------------------
create or replace PROCEDURE insertCountry
(pcountryName IN VARCHAR2)
AS
BEGIN
    INSERT INTO Country(idCountry, countryName)
    VALUES (country_seq.nextval, pcountryName);
    COMMIT;
END insertCountry;
/
create or replace procedure getIdCountry(v_country in varchar2 , v_cursor out sys_refcursor)
as begin open v_cursor for
select idcountry,countryname from country
where countryName = v_country;
end getIdCountry;
/
SET SERVEROUTPUT ON;

DECLARE
    v_cursor SYS_REFCURSOR;
    v_country_name VARCHAR2(50) := 'Costa Rica'; -- Reemplaza 'NombrePais' con el nombre del país que deseas buscar
    id_country number(6);
    country_name VARCHAR2(100);
BEGIN
    getIdCountry(v_country_name, v_cursor);
    DBMS_OUTPUT.PUT_LINE('Results:');
    LOOP
        FETCH v_cursor INTO id_country, country_name;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || id_country || ', Country Name: ' || country_name);
    END LOOP;
    CLOSE v_cursor;
END;
/
DELETE FROM COUNTRY
where idcountry=1;

-----------getcountryidpername-------------------------------------
CREATE OR REPLACE FUNCTION getCountryPerName(cname IN VARCHAR2) RETURN NUMBER
IS
    idc NUMBER(6);
BEGIN
    SELECT idcountry INTO idc FROM country WHERE countryname = cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getCountryPerName;
/
DECLARE
    v_country_name VARCHAR2(50) := 'Costa Rica';
    v_country_id NUMBER;
BEGIN
    v_country_id := getCountryPerName(v_country_name);
    
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Country ID for ' ||  v_country_name || ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Country not found: ' || v_country_name);
    END IF;
END;
/
------------------------province insertion------------------------------------------------------

create or replace PROCEDURE insertProvince
(pIdCountry IN NUMBER, pProvinceName IN VARCHAR2)
AS
BEGIN
    INSERT INTO Province(idProvince, idCountry, provinceName)
    VALUES (province_seq.nextval, pIdCountry, pProvinceName);
    COMMIT;
END insertProvince;
/
------------------------------------------------

------------------getprovincepername--------------
CREATE OR REPLACE FUNCTION getProvincePerName(cname IN VARCHAR2,pname in varchar2) RETURN NUMBER
IS
    idc NUMBER(6);
BEGIN
    SELECT pr.idprovince INTO idc FROM country co 
    join province pr on co.idcountry = pr.idcountry  
    WHERE co.countryname = cname and pr.provincename = pname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getProvincePerName;
/
DECLARE
    v_country_name VARCHAR2(50) := 'Costa Rica';
    v_province_name varchar2(50) := 'Heredia';
    v_country_id NUMBER;
BEGIN
    v_country_id := getProvincePerName(v_country_name,v_province_name);
    
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Country ID for ' ||  v_country_name || ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Country not found: ' || v_country_name);
    END IF;
END;
/


---------------------getcantonpername----------------------
CREATE OR REPLACE FUNCTION getCantonPerName(cname IN VARCHAR2, pname IN VARCHAR2, caname IN VARCHAR2) RETURN NUMBER
IS
    idc NUMBER(6);
BEGIN
    SELECT ca.idcanton INTO idc
    FROM country co
    JOIN province pr ON co.idcountry = pr.idcountry
    JOIN canton ca ON ca.idprovince = pr.idprovince
    WHERE co.countryname = cname AND pr.provincename = pname AND ca.cantonname = caname;
    
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getCantonPerName;
/
DECLARE
    v_country_name VARCHAR2(50) := 'Costa Rica';
    v_province_name VARCHAR2(50) := 'Heredia';
    v_canton_name VARCHAR2(50) := 'Barva';
    v_canton_id NUMBER;
BEGIN
    v_canton_id := getCantonPerName(v_country_name, v_province_name, v_canton_name);
    
    IF v_canton_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Canton ID for ' || v_canton_name || ' is: ' || v_canton_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Canton not found: ' || v_canton_name);
    END IF;
END;
/
-------------------------------------------------------distrito---------------------------------------

-------------------getdistrictpername-------------------------------------------
CREATE OR REPLACE FUNCTION getDistrictPerName(cname IN VARCHAR2, pname IN VARCHAR2, caname IN VARCHAR2, diname in varchar2) RETURN NUMBER
IS
    idc NUMBER(6);
BEGIN
    SELECT d.iddistrict INTO idc
    FROM country co
    JOIN province pr ON co.idcountry = pr.idcountry
    JOIN canton ca ON ca.idprovince = pr.idprovince
    join district d on d.idcanton = ca.idcanton
    WHERE co.countryname = cname AND pr.provincename = pname AND ca.cantonname = caname and d.districtname = diname;
    
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getDistrictPerName;
/
DECLARE
    v_country_name VARCHAR2(50) := 'Costa Rica';
    v_province_name VARCHAR2(50) := 'Cartago';
    v_canton_name VARCHAR2(50) := 'Paraiso';
    v_district_name varchar2(50) := 'Paraiso';
    v_canton_id NUMBER;
BEGIN
    v_canton_id := getDistrictPerName(v_country_name, v_province_name, v_canton_name,v_district_name);
    
    IF v_canton_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Canton ID for ' || v_canton_name || ' is: ' || v_canton_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Canton not found: ' || v_canton_name);
    END IF;
END;
/
-----------------getIdResciecenterPerName---------------------
CREATE OR REPLACE FUNCTION getIdRCPerName(cname IN VARCHAR2) RETURN NUMBER
IS
    idc NUMBER(6);
BEGIN
    SELECT idrescuecenter INTO idc FROM rescuecenter WHERE rescuecentername = cname;
    RETURN idc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getIdRCPerName;
/
DECLARE
    v_country_name VARCHAR2(50) := 'Independient';
    v_country_id NUMBER;
BEGIN
    v_country_id := getIdRCPerName(v_country_name);
    
    IF v_country_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Country ID for ' ||  v_country_name || ' is: ' || v_country_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Country not found: ' || v_country_name);
    END IF;
END;
/