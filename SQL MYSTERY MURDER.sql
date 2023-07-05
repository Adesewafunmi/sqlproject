-- you vaguely remember that the crime was a murder, that it took place in sql city
--on january 15,2018 and

SELECT * FROM crime_scene_report
WHERE crime_type = 'murder'
AND
date = 20180115
AND city= 'SQL City'

Security footage shows that there were 2 witnesses.
The first witness lives at the last house on "Northwestern Dr". 
The second witness, named Annabel, lives somewhere on "Franklin Ave".

SELECT * FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
--FIRST WITNNESS IS MORTY SCHAPIRO ,licence_id = 118009
--address_number =4919, ssn=111564949

SELECT * FROM person
WHERE name like '%Annabel%'
AND  address_street_name ='Franklin Ave' 
-- SECOND WITHNESS IS Annabel Miller, licence_id =490173
-- address_number =103 franklin Ave , ssn= 318771143

SELECT * FROM interview
 WHERE person_id = 14887
 --I heard a gunshot and then saw a man run out.
 --He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z".
-- Only gold members have those bags. The man got into a car with a plate that included "H42W".

SELECT * FROM interview
 WHERE person_id = 16371
 --I saw the murder happen, 
 --and I recognized the killer from my gym when I was working out last week on January the 9th.
 
 SELECT * FROM get_fit_now_member
 WHERE membership_status = 'gold'
   AND Id like '48Z%'
   
  SELECT p.name,p.ssn,d.plate_number,d.gender
  FROM person AS p
  LEFT JOIN drivers_license AS d
  ON p.license_id = d.id
  WHERE plate_number like  '%H42W%' OR '%H42W'OR 'H42W%'
  --THE MURDER IS JEREMY BOWERS
  
  
  
  
  
  SELECT * FROM interview
  WHERE person_id =67318
  I was hired by a woman with a lot of money. 
  I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. 
  I know that she attended the SQL Symphony Concert 3 times in December 2017.
  
  CREATE TABLE suspect AS SELECT * FROM drivers_license
  WHERE gender = 'female'
  AND height BETWEEN 65 AND 68
  AND hair_color = 'red'
  AND car_make = 'Tesla'
  --202298,291182,918773
  SELECT * FROM suspect
  
  SELECT s.id,s.age,s.height,p.id AS person_id,p.address_street_name,p.ssn,p.name
   FROM suspect AS s
   RIGHT JOIN Person AS p
   ON s.id = p.license_id
   --person id of three suspected killers are 99716,90700,78881
   
    SELECT * FROM facebook_event_checkin
   WHERE event_name = 'SQL Symphony Concert'
   AND date BETWEEN 20171201 AND 20171231
   AND person_id IN (99716,90700,78881)
   
   SELECT * FROM person
   WHERE id = 99716
   
   
   
  
  
  
  
  

  
  
  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
















































