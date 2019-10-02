SELECT
	/* Определяем возрастные группы */
	CASE WHEN age =>18 AND age<=25 THEN '18-25 y.o'
	WHEN age >=26 AND age<=35 THEN '25-35 y.o'
	 ELSE 'other' END AS age_group,
	AVG(price_per_month)
FROM Users as u
LEFT JOIN
	(SELECT 
	/* Считаем цену заказов за каждый месяц
	 для каждого потребителя */
		p.userId,
		MONTH(p.date)
		SUM(i.price) AS price_per_month
	FROM Purchases AS p
	LEFT JOIN Items AS i
	USING(itemId)
	GROUP BY p.userId, MONTH(p.date)) AS subq
USING(userId)
GROUP BY age_group 
