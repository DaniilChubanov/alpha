SELECT
	/* Выведем макс цену за месяц и соотв ей месяц */
	MONTH(p.date),
	MAX(price_per_month)
FROM Users as u
LEFT JOIN
	(SELECT 
	/* Считаем цену заказов за каждый месяц
	 для каждого потребителя */
		p.userId,
		MONTH(p.date),
		SUM(i.price) AS price_per_month
	FROM Purchases AS p
	LEFT JOIN Items AS i
	USING(itemId)
	GROUP BY p.userId, MONTH(p.date)) AS subq
USING(userId)
WHERE u.age>=36
