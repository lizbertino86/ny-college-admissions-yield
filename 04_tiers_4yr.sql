-- applicant, admission, enrolled data for New York colleges and universities
--used only 4 year schools because students treat 4 and 2 year schools differently
SELECT 
 COUNT(*)AS schools,
 ROUND(AVG(adm.ENRLT*1.0/adm.ADMSSN ),3) AS yield,

CASE 
when adm.ADMSSN *1.0/adm.APPLCN < .25 THEN 'Highly selective'
when adm.ADMSSN *1.0/adm.APPLCN <= .60 THEN 'Selective'
ELSE'Less Selective'
END AS tier

FROM adm
INNER JOIN hd
ON adm.UNITID = hd.UNITID 
WHERE hd.STABBR = 'NY' AND ICLEVEL = '1'
AND CAST (adm.APPLCN AS INTEGER)>500
GROUP BY tier
ORDER BY yield
;

