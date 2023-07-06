/*you vaguely remember that the crime was a murder, that it took place in sql city
--on january 15,2018 */

SELECT * FROM crime_scene_report
WHERE crime_type = 'murder'
AND
date = 20180115
AND city= 'SQL City'

/*Security footage shows that there were 2 witnesses.
The first witness lives at the last house on "Northwestern Dr". 
The second witness, named Annabel, lives somewhere on "Franklin Ave".*/

--Find withness one
SELECT * FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
/*First withness is Morty Schapiro ,licence_id = 118009
address_number =4919, ssn=111564949, stays on Northwestern Dr */

--Find the withness two
SELECT * FROM person
WHERE name like '%Annabel%'
AND  address_street_name ='Franklin Ave' 
/* Second withness is Annabel Miller, licence_id =490173
 address_number is 103 franklin Ave , ssn= 318771143*/

-- Find the report of eye withnesses
SELECT * FROM interview
 WHERE person_id = 14887
 --Witness 1(Morty Schapiro)recounted "I heard a gunshot and then saw a man run out.
 --He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z".
-- Only gold members have those bags. The man got into a car with a plate that included "H42W".
 
 --Find the report of the withnesses
SELECT * FROM interview
 WHERE person_id = 16371
 --Withness 2 (Annabel Miller) recounted "I saw the murder happen, 
 --and I recognized the killer from my gym when I was working out last week on January the 9th.
 
 SELECT * FROM get_fit_now_member
 WHERE membership_status = 'gold'
   AND id like '48Z%'
   /* There are two suspects now;
   1. Joe Germuska with Id 48Z7A, person_id - 28819, membership_start_date- 20160305,
      membership_status- gold.
   2. Jeremy Bowers with Id- 48Z55, person_id-67318, membership_start_date-20160101,
   membership_status - gold.*/
   
   --Find more information on both suspects using the person_id
   select * from person
   where id in (28819, 67318)

   /* Joe Germuska: license_id - 173289, address_number - 111, address_street_name - Fisk Rd, ssn - 138909730
   Jeremy Bowers: license_id - 423327, address_number - 530, address_street_name - Washington Pl, Apt 3A 
   ssn - 138909730 */

  /*Using the license_id, find the plate number of both suspects based on witness one report of a car  
   with a plate that included "H42W".*/

  SELECT p.name,p.ssn,d.plate_number,d.gender
  FROM person AS p
  LEFT JOIN drivers_license AS d
  ON p.license_id = d.id
  WHERE plate_number like  '%H42W%' 
  --The murderer is JEREMY BOWERS
  
  
  
  /* Congrats, you found the murderer! But wait, there's more... If you think you're up for a challenge, 
   try querying the interview transcript of the murderer to find the real villain behind this crime. 
   If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries.
   Use this same INSERT statement with your new suspect to check your answer. */
   
  SELECT * FROM interview
  WHERE person_id =67318
  
  /*I was hired by a woman with a lot of money. 
  I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. 
  I know that she attended the SQL Symphony Concert 3 times in December 2017.*/
  
  CREATE TABLE villian AS SELECT * FROM drivers_license
  WHERE gender = 'female'
  AND height BETWEEN 65 AND 68
  AND hair_color = 'red'
  AND car_make = 'Tesla'
  /* there are three people who match the murderer's description
 1. id - 202298	age - 68	height - 66	eyecolor - "green"	haircolor - "red"	gender - "female"	
 plate_number - "500123"	carmake - "Tesla"	carmodel - "Model S"
 2. id - 291182	age - 65	height - 66	eyecolor - "blue"	haircolor - "red"	gender - "female"	
 plate_number - "08CM64"	carmake - "Tesla"	carmodel - "Model S"
 3. id- 918773	age-48	,height-65, eye colour-"black", hair colour-"red",gender-"female"
 plate_number"917UU3", car_make-"Tesla", car_model -model S"*/
  
  
  /* To find the name of the suspected villians , the person table will be searched
  the using the license_IDs from the drivers_license table */


  SELECT v.id,v.age,v.height,p.id AS person_id,p.address_street_name,p.ssn,p.name
   FROM villian AS v
   RIGHT JOIN Person AS p
   ON v.id = p.license_id
   /*The names and person id's of the suspected villians are; 
   Red Korb (78881), Regina George(90700)& Miranda Priestly(99716) respectively */
   
   /* Since the person attended the SQL Symphony Concert 3 times in December 2017, 
    the facebook event checkin table will be searched */
    SELECT * FROM facebook_event_checkin
   WHERE event_name = 'SQL Symphony Concert'
   AND date BETWEEN 20171201 AND 20171231
   AND person_id IN (99716,90700,78881)
   
   /* the person id of the villian is 99716, the villian name will be searched from the persons table*/
   
   SELECT * FROM person
   WHERE id = 99716
   -- the villian is Miranda Priestly
   
   
   
  
  
  
  
  

  
  
  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
















































