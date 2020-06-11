create table tbHospital
(
Hospital_ID int primary key ,
Hospital_Name nvarchar(100),
Hospital_Adress nvarchar(100)
)

create table tbPatient
(
Patient_ID int primary key ,
Patient_Name nvarchar(100),
patient_phone int
)

create table tbDepartment
(
Department_ID int primary key ,
Department_Name nvarchar(100)
)

create table tbDoctor
(
Doctor_ID int primary key ,
Doctor_Name nvarchar(100)
)

create table tbMedical_record
(
Medical_record_ID int primary key ,
Patient_ID int,
Doctor_ID int,
Hospital_ID int,
Department_ID int,
Date_examination date,
Cost_treatment int
)

insert into tbHospital values(1,'Newledge','new street')
insert into tbHospital values(2,'ledgeing','cairo street')
insert into tbHospital values(3,'best','newyork street')
insert into tbHospital values(4,'the one','alex street')
insert into tbHospital values(5,'future','london street')

insert into tbPatient values(1,'ezzat',01235545659)
insert into tbPatient values(2,'ahmed',01535956551)
insert into tbPatient values(3,'mohamed',01165456650)
insert into tbPatient values(4,'maryo',01046546553)
insert into tbPatient values(5,'magdy',01235567858)
insert into tbPatient values(6,'mahmoud',01235567858)

insert into tbDepartment values(1,'surgery')
insert into tbDepartment values(2,'brain')
insert into tbDepartment values(3,'heart')
insert into tbDepartment values(4,'eyes')
insert into tbDepartment values(5,'bones')

insert into tbDoctor values(1,'ahmed')
insert into tbDoctor values(2,'mohamed')
insert into tbDoctor values(3,'ali')
insert into tbDoctor values(4,'magdy')
insert into tbDoctor values(5,'ramy')

insert into tbMedical_record values(1,1,1,1,1,'1-1-2020',1000)
insert into tbMedical_record values(2,2,2,2,2,'2-2-2020',2000)
insert into tbMedical_record values(3,3,3,3,3,'3-3-2020',3000)
insert into tbMedical_record values(4,4,4,4,4,'4-4-2020',4000)
insert into tbMedical_record values(5,5,5,5,5,'5-5-2020',5000)


--how to use ascii code?
SELECT ASCII(Patient_Name) AS NumCodeOfFirstChar
FROM tbPatient;

--how to select char?
SELECT CHAR(100) AS CodeToCharacter;

--how to serarch for a letter in a word and return position?
 
SELECT CHARINDEX('t', 'Doctor') AS MatchPosition;

--how to connect two strings with each other?

SELECT CONCAT('ahmed', 'mohamed');

--how to calculate the length of an expression?

SELECT DATALENGTH('Department');

--how to Compares two SOUNDEX values, and return an integer?

SELECT DIFFERENCE('Patient_ID', 'Patient_Name');

-- how to extract 3 characters from a string?

SELECT LEFT('Hospital_ID', 3) AS ExtractString;

--how to Convert the text to lower-case?

SELECT LOWER('DATABASE IS FUN!');

--how to Remove leading spaces from a string?

SELECT LTRIM('     Hospital Managment') AS LeftTrimmedString;

--how to Return a Unicode string with bracket delimiters (default)?

SELECT QUOTENAME('Hospital');

--how to replace a letter with another letter?

SELECT REPLACE('Hoskital_Name', 'k', 'p');

--how to reapeat a string many times?

SELECT REPLICATE('patient_ID', 3);

--how to Extract 3 characters from a string (starting from right)?

SELECT RIGHT('Medical_record', 3) AS ExtractString;

--how to Remove trailing spaces from a string?

SELECT RTRIM('Medical_record     ') AS RightTrimmedString;

--how to Delete 3 characters from a string, starting in position 1, and then insert "Patient" in position 1?

SELECT STUFF('Patient_ID', 1, 3, 'Department');

--how to Extract 3 characters from a string, starting in position 1?

SELECT SUBSTRING('Patient Name', 1, 3) AS ExtractString;

--how to Return an integer value (the Unicode value), for the first character of the input expression?

SELECT UNICODE('Doctor');

--how to Return a string with 10 spaces?

SELECT SPACE(10);

--how to Convert the text to upper-case?

SELECT UPPER('Medical record');

--how to select Top 5 Medical Records most old from Medical record table ?

select Top 5 Medical_record_ID from tbMedical_record 

--how to Return the position of a pattern in a string?

SELECT PATINDEX('%Departments%', 'surgery');

--how to Select Statements using Count and Group Functions?

SELECT COUNT(Patient_ID)
  FROM tbPatient

SELECT COUNT(Department_ID)
FROM tbDepartment

--how to Select Statements using Sub Query?

SELECT Department_Name
  FROM tbDepartment 
 WHERE Department_ID IN (SELECT Patient_ID 
                          FROM tbPatient
                          WHERE Patient_ID > 2) 

SELECT Department_Name
  FROM tbDepartment 
 WHERE Department_ID IN (SELECT Doctor_ID 
                          FROM tbDoctor
                          WHERE Doctor_ID > 3)

--how to Select Statements using Different Joins? 

--inner join:
SELECT tbMedical_record.Medical_record_ID, tbPatient.Patient_ID
FROM tbMedical_record
INNER JOIN tbPatient ON tbMedical_record.Patient_ID = tbPatient.Patient_ID;

--Left Join:

SELECT tbPatient.Patient_ID, tbMedical_record.Medical_record_ID
FROM tbPatient
LEFT JOIN tbMedical_record ON tbPatient.Patient_ID = tbMedical_record.Patient_ID
ORDER BY tbPatient.Patient_Name;

--right join:

SELECT tbMedical_record.Medical_record_ID, tbPatient.Patient_Name, tbPatient.Patient_ID
FROM tbMedical_record
RIGHT JOIN tbPatient ON tbMedical_record.Patient_ID = tbPatient.Patient_ID
ORDER BY tbMedical_record.Medical_record_ID;

--Full Join:

SELECT tbPatient.Patient_Name, tbMedical_record.Medical_record_ID
FROM tbPatient
FULL OUTER JOIN tbMedical_record ON tbPatient.Patient_ID=tbMedical_record.Patient_ID
ORDER BY tbPatient.Patient_Name;

--Self Join:

SELECT A.Patient_Name AS Patient_Name1, A.patient_phone
FROM tbPatient A, tbPatient B
WHERE A.Patient_ID <> B.Patient_ID
AND A.patient_phone = B.patient_phone
ORDER BY A.patient_phone;


--how to do the Update Statement?

 UPDATE tbMedical_record
   SET Cost_treatment = 1
 WHERE Cost_treatment > 50


 --how to do the Delete Statement?

 DELETE tbPatient
 WHERE Patient_ID = 6