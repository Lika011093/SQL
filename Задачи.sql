1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd

select model, speed, hd
from pc
where price < 500

==============================================================

2. Найдите производителей принтеров. Вывести: maker

select DISTINCT maker
from product
where type = 'Printer'

==============================================================

3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.

Select model, ram, screen
from Laptop
where price > 1000

==============================================================

4. Найдите все записи таблицы Printer для цветных принтеров.

Select *
from Printer
where color = 'y'

==============================================================

5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.

Select model, speed, hd
from PC
where cd in ('12x', '24x') and price < 600

==============================================================

6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.

Select distinct maker, speed
from Laptop join Product
on Product.model = Laptop.model
where hd >= 10

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

select maker 
from product 
where type='PC' and maker not in
(select maker from product where type = 'Laptop')
group by maker

==============================================================

9.Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

select maker
from Product JOIN PC
ON PC.model = Product.model
where speed >= 450
group by maker
