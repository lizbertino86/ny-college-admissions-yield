-- applicant, admission, enrolled data for New York colleges and universities
--4 year schools used as students treat 2 and 4 year schools differently “(removed 3 schools)”
SELECT 
 COUNT(*)AS Schools,
 ROUND(AVG(adm.ENRLT*1.0/adm.ADMSSN ),3) AS Yield,

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
GROUP BY Tier
ORDER BY Yield
;

--SELECT INSTNM, ICLEVEL
--FROM hd
--WHERE INSTNM = 'Circle in the Square Theatre School'