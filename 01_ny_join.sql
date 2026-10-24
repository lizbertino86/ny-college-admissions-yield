-- applicant, admission, enrolled data for New York colleges and universities

SELECT hd.INSTNM, adm.APPLCN, adm.ADMSSN, adm.ENRLT,
 ROUND(adm.ADMSSN *1.0 / adm.APPLCN,3) AS Admit_rate,
 ROUND(adm.ENRLT*1.0/adm.ADMSSN, 3) AS yield
FROM adm
INNER JOIN hd
ON adm.UNITID = hd.UNITID 
WHERE hd.STABBR = 'NY' 
AND CAST (adm.APPLCN AS INTEGER)>500
ORDER BY Admit_rate;


