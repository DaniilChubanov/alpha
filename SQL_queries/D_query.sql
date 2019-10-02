SELECT
	p.itemId,
	SUM(i.price) AS price_per_item,
	SUM(i.price)/SUM(SUM(i.price))
FROM Purchases AS p
LEFT JOIN Items as i
USING(itemId)
GROUP BY p.itemId
ORDER BY p.itemId DESC
LIMIT 3
