# subQuery
> 查詢時使用subQuery先過濾可以減少資料量，增加JOIN效能。

```sql
SELECT 
    * 
FROM 
    (
        SELECT 
            *
        FROM 
            表1
        WHERE 
            表1條件
    ) AS  表1  
    INNER JOIN  (
        SELECT 
            * 
        FROM 
            表2 
        WHERE 
            表2條件
    ) AS  表2 
    ON 表1.K1 = 表2.K2  
    LEFT JOIN  (
        SELECT 
            * 
        FROM 
            表3 
        WHERE 
            表3條件
    ) AS  表3 
    ON 表1.K1 = 表3.K3
```