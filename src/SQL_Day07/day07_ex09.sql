SELECT address,
trim_scale(ROUND((MAX(age)-(MIN(age)/MAX(age)::DECIMAL)), 2)) AS formula,
trim_scale(ROUND(AVG(age), 2)) AS average,
CASE
	WHEN ROUND((MAX(age)-(MIN(age)/MAX(age)::DECIMAL)), 2) > ROUND(AVG(age), 2) THEN 'true'
	ELSE 'false'
END AS comparison
FROM person
GROUP BY 1
ORDER BY 1;