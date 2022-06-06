1. ������� ����� ������, �������� � ������ �������� ����� ��� ���� �� ���������� ����� 500 ���. �������: model, speed � hd

select model, speed, hd
from pc
where price < 500

==============================================================

2. ������� �������������� ���������. �������: maker

select DISTINCT maker
from product
where type = 'Printer'

==============================================================

3. ������� ����� ������, ����� ������ � ������� ������� ��-���������, ���� ������� ��������� 1000 ���.

Select model, ram, screen
from Laptop
where price > 1000

==============================================================

4. ������� ��� ������ ������� Printer ��� ������� ���������.

Select *
from Printer
where color = 'y'

==============================================================

5. ������� ����� ������, �������� � ������ �������� ����� ��, ������� 12x ��� 24x CD � ���� ����� 600 ���.

Select model, speed, hd
from PC
where cd in ('12x', '24x') and price < 600

==============================================================

6. ��� ������� �������������, ������������ ��-�������� c ������� �������� ����� �� ����� 10 �����, ����� �������� ����� ��-���������. �����: �������������, ��������.

Select distinct maker, speed
from Laptop join Product
on Product.model = Laptop.model
where hd >= 10

==============================================================

7. ������� ������ ������� � ���� ���� ��������� � ������� ��������� (������ ����) ������������� B (��������� �����).

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

8. ������� �������������, ������������ ��, �� �� ��-��������.

select maker 
from product 
where type='PC' and maker not in
(select maker from product where type = 'Laptop')
group by maker

==============================================================

9.������� �������������� �� � ����������� �� ����� 450 ���. �������: Maker

select maker
from Product JOIN PC
ON PC.model = Product.model
where speed >= 450
group by maker
