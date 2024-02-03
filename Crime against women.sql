# Update the state names as there was a mismatch
UPDATE crime.crimes_against_women 
SET `STATE/UT` = CASE `STATE/UT`  
WHEN 'A&N Islands' THEN 'A & N ISLANDS' 
WHEN 'D&N Haveli' THEN 'D & N HAVELI'
WHEN 'Delhi UT' THEN 'DELHI'
else crime.crimes_against_women.`STATE/UT`  
END ; 

# Check whether the names got updated
SELECT `STATE/UT` FROM crime.crimes_against_women
where `STATE/UT` ='A&N Islands' OR `STATE/UT` ='D&N Haveli' OR `STATE/UT` = 'Delhi UT';

# Count the total number of states in the db
SELECT count(distinct `STATE/UT`) as total_states FROM crime.crimes_against_women;
# Get the list of distinct states
SELECT distinct `STATE/UT`as distinct_states FROM crime.crimes_against_women;
# Get the list of distinct districts
SELECT distinct district as distinct_districts FROM crime.crimes_against_women;
# Count the total number of district in the db
SELECT count(distinct district) as total_district FROM crime.crimes_against_women;

# Count the total number of all the crimes from 2001 to 2014
SELECT 
 sum(rape) as total_rapes, 
 sum(`Kidnapping and Abduction`) as total_kidnapping_and_Abduction, 
 sum(`Dowry Deaths`) as total_Dowry_Deaths,
 sum(`Assault on women with intent to outrage her modesty`) as total_assaults,
 sum(`Insult to modesty of Women`) as total_modestyInsults,
 sum(`Cruelty by Husband or his Relatives`) as total_domesticAbuse,
 sum(`Importation of Girls`) as total_importation
FROM crime.crimes_against_women;

# Count the total number crimes state and year wise
SELECT `STATE/UT`, year, district,
(rape + `Kidnapping and Abduction` +`Dowry Deaths`
 + `Assault on women with intent to outrage her modesty`
 + `Insult to modesty of Women`
 + `Cruelty by Husband or his Relatives` +`Importation of Girls`) AS total_crimes 
FROM crime.crimes_against_women
ORDER BY `STATE/UT`, year;

# Count the total number crimes in 2001 
SELECT `STATE/UT`, year, district,
(rape + `Kidnapping and Abduction` +`Dowry Deaths`
 + `Assault on women with intent to outrage her modesty`
 + `Insult to modesty of Women`
 + `Cruelty by Husband or his Relatives` +`Importation of Girls`) AS total_crimes 
FROM crime.crimes_against_women
WHERE YEAR = 2001
ORDER BY `STATE/UT`;

# Count the total number crimes in 2001 IN DELHI
SELECT `STATE/UT`, year, district,
(rape + `Kidnapping and Abduction` +`Dowry Deaths`
 + `Assault on women with intent to outrage her modesty`
 + `Insult to modesty of Women`
 + `Cruelty by Husband or his Relatives` +`Importation of Girls`) AS total_crimes 
FROM crime.crimes_against_women
WHERE YEAR = 2001 AND `STATE/UT` = 'DELHI'
ORDER BY `STATE/UT`;

# Count the total assault on women IN DELHI
SELECT `STATE/UT`, 
SUM(`Assault on women with intent to outrage her modesty`)
FROM crime.crimes_against_women
WHERE `STATE/UT` = 'DELHI'



  


	





	