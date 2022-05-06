# CTE

> * CTE後面也可以跟其他的CTE，但只能使用一個with，多個CTE中間用逗號（,）分隔。
> * WITH開頭，多個CTE中間用逗號（,）分隔，
> * CTE只能用一次，若想多次使用，請用暫存表或DECLARE TABLE。

## Basic
```sql
;WITH
    cte1 AS
    (
        SELECT *
        FROM table1
    ),
    cte2 AS
    (
        SELECT *
        FROM table2
    )
SELECT 
    *
FROM 
    cte1 A 
    INNER JOIN cte2 B 
    ON A.id = B.id
```