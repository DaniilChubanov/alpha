SELECT
	/* Выведем макс цену за год для товара  */
	i.itemId,
	MAX(price_per_year)
FROM 
	(SELECT 
	/* Сосчитает сумму цен для кадлого товара в каждом году */
		p.itemId,
		YEAR(p.date),
		SUM(i.price) AS price_per_year
	FROM Purchases AS p
	LEFT JOIN Items AS i
	USING(itemId)
	GROUP BY i.itemId, YEAR(p.date)) AS subq
GROUP BY i.itemId 
