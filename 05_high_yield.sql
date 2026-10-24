-- applicant, admission, enrolled data for New York colleges and universities
--4 year schools used as students treat 2 and 4 year schools differently “(removed 3 schools)”


--schools with specific programs and in-person only offerings convert
-- admits at high rates because students choose them for the program 
--and location

--monroe university also offers niche programs found out through further investigation and is very affordable

SELECT 
hd.INSTNM AS Schools,
 ROUND((adm.ENRLT*1.0/adm.ADMSSN ),3) AS Yield,

CASE 
when adm.ADMSSN *1.0/adm.APPLCN < .25 THEN 'Highly selective'
when adm.ADMSSN *1.0/adm.APPLCN <= .60 THEN 'Selective'
ELSE'Less Selective'
END AS Tier

FROM adm
INNER JOIN hd
ON adm.UNITID = hd.UNITID 
WHERE hd.STABBR = 'NY' AND hd.ICLEVEL = '1'
AND CAST (adm.APPLCN AS INTEGER)>500
ORDER BY Yield DESC
;

--SELECT INSTNM, ICLEVEL
--FROM hd
--WHERE INSTNM = 'Circle in the Square Theatre School'

