1.Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd

SELECT model, speed, hd
FROM pc
WHERE price < 500

==============================================================

2. Найдите производителей принтеров. Вывести: make

SELECT DISTINCT maker
FROM product
WHERE type = 'Printer'

==============================================================

3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.

SELECT model, ram, screen
FROM Laptop
WHERE price > 1000

==============================================================

4. Найдите все записи таблицы Printer для цветных принтеров.

SELECT *
FROM Printer
WHERE color = 'y'

==============================================================

5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.

SELECT model, speed, hd
FROM PC
WHERE cd in ('12x', '24x') and price < 600

==============================================================

6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. 
Вывод: производитель, скорость.

SELECT distinct maker, speed
FROM Laptop join Product
ON Product.model = Laptop.model
WHERE hd >= 10

==============================================================

7. Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

SELECT a.model, price 
FROM (SELECT model, price 
 FROM PC 
 UNION
 SELECT model, price 
  FROM Laptop
 UNION
 SELECT model, price 
 FROM Printer
 ) AS a JOIN 
 Product p ON a.model = p.model
WHERE p.maker = 'B'

==============================================================

8. Найдите производителя, выпускающего ПК, но не ПК-блокноты.

SELECT maker 
FROM product 
WHERE type='PC' and maker not in
(select maker from product where type = 'Laptop')
GROUP BY maker

==============================================================

9.Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

SELECT maker
FROM Product JOIN PC
ON PC.model = Product.model
WHERE speed >= 450
GROUP BY maker

==============================================================

10. Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price

SELECT model, price
FROM Printer
WHERE price = (select MAX(price) from Printer)

==============================================================

11. Найдите среднюю скорость ПК.

SELECT AVG(speed) AS Avg_speed
FROM PC

==============================================================

12. Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.

SELECT AVG (speed) AS Avg_speed
FROM Laptop
WHERE price > 1000

==============================================================

13. Найдите среднюю скорость ПК, выпущенных производителем A.

SELECT AVG(speed) AS Avg_speed 
FROM PC JOIN Product
ON Product.model = PC.model
WHERE maker = 'A'

==============================================================

14. Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.

SELECT Ships.class AS class, Ships.name AS name, country
FROM Ships JOIN Classes 
ON Classes.class = Ships.class
WHERE numGuns >= 10

==============================================================

15. Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD

SELECT hd
FROM PC
GROUP BY hd
HAVING COUNT(hd) >=2

==============================================================

16. Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), 
Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.

SELECT DISTINCT PC_1.model, PC_2.model, PC_1.speed, PC_1.ram
FROM PC PC_1, PC PC_2
WHERE PC_1.speed = PC_2.speed AND PC_1.ram = PC_2.ram AND PC_1.model > PC_2.model

==============================================================

17. Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed

SELECT DISTINCT type, laptop.model, speed
FROM Laptop JOIN Product
ON Product.model =Laptop.model
WHERE speed < ALL (SELECT speed FROM PC)

==============================================================

18. Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price

SELECT maker, price
FROM Printer JOIN Product
ON Product.model = Printer.model
WHERE price = (SELECT MIN(price) 
 FROM Printer WHERE color = 'y') AND color = 'y'
GROUP BY maker, price

==============================================================

19. Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана.

SELECT DISTINCT maker, AVG(screen) AS Avg_screen
FROM Laptop JOIN Product
ON Product.model = Laptop.model
GROUP BY maker

==============================================================

20. Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.

SELECT Maker, COUNT(model) AS avg_model
FROM Product
WHERE type = 'PC'
GROUP BY Maker
HAVING COUNT(model) >= 3

==============================================================

21. Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена.

SELECT maker, MAX(price) AS max_price
FROM Product JOIN PC
ON PC.model = Product.model
WHERE type = 'PC'
GROUP BY maker

==============================================================

22. Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. 
Вывести: speed, средняя цена.

SELECT speed, AVG(price) AS avg_price
FROM PC 
WHERE speed > '600'
GROUP BY speed

==============================================================

23. Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
Вывести: Maker

SELECT maker
FROM Product JOIN PC
ON PC.model = Product.model
WHERE speed >= '750'
INTERSECT
SELECT maker
FROM Product JOIN Laptop
ON Laptop.model = Product.model
WHERE speed >= '750'

==============================================================

24. Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.

SELECT model 
FROM (SELECT model, price FROM PC
UNION
SELECT model, price FROM Laptop
UNION
SELECT model, price FROM Printer) 
this_table 
WHERE price = (SELECT MAX(price) 
FROM(SELECT model, price FROM PC
UNION
SELECT model, price FROM Laptop
UNION
SELECT model, price FROM Printer) 
this_table_2
)

==============================================================

25. Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM.
Вывести: Maker

SELECT DISTINCT maker
FROM PC JOIN Product
ON Product.model = PC.model WHERE maker 
IN(
SELECT DISTINCT maker FROM Product WHERE type = 'Printer'
)
AND speed = (SELECT MAX(speed) FROM PC WHERE ram = (SELECT MIN(ram) FROM PC))
AND ram = (SELECT MIN(ram) FROM PC)




