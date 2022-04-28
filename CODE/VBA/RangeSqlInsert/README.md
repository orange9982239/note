

# VBA RangeSqlInsert

## 一、 功能概述
* EXCEL表

    |   |    A      |  B    |
    |---|-----------|------ |
    | 1 |   柳橙	|  10分 |
    | 2 |   芭樂	|  3分  |
    | 3 |   香蕉	|  5分  |

* 半自動轉換內容為SQL INSERT。`(INSERT INTO FRUIT VALUES)` 這一段要先填好
    ``` sql
    INSERT INTO FRUIT VALUES  ('柳橙','10分');
    INSERT INTO FRUIT VALUES  ('芭樂','3分');
    INSERT INTO FRUIT VALUES  ('香蕉','5分')
    ```

## 二、 使用公式方式呼叫

1. 輸入公式
    > ![20211223204439](https://raw.githubusercontent.com/orange9982239/ImageHosting/master/images/20211223204439.png)
    > 1. 第一參數 => 指定儲存格
     > 2. 第二參數 => SQL INSERT 前半句`(INSERT INTO #TABLE_NAME# VALUES)`

## 三、 建立Function
1. 開VBE編輯工具
    * <kbd>Alt</kbd> + <kbd>F11</kbd>

2. 建立模組
    * 右鍵 => 插入 => 模組
    * ![20211223202421](https://raw.githubusercontent.com/orange9982239/ImageHosting/master/images/20211223202421.png)

3. 加入Function
    * 貼上程式碼
    ``` vb
    Function RangeInsert(selectRange As Range, insertSql As String) As String
        Dim selectArray As Variant
        selectArray = selectRange.Value
        
        concatString = ""
        For i = 1 To selectRange.Rows.Count
            RowData = "("
            For j = 1 To selectRange.Columns.Count
                'MsgBox selectArray(i, j)
                RowData = RowData & "'" & selectArray(i, j) & "'" & ","
            Next j
            RowData = Left(RowData, Len(RowData) - 1)
            RowData = RowData & ")"
            RowData = RowData & ";" & vbCrLf
            RowData = insertSql & " " & RowData
            
            concatString = concatString + RowData
        Next i
        concatString = Left(concatString, Len(concatString) - 3) 'vbCrLf *2 ","*1 共三位
        RangeInsert = concatString
    End Function
    ```
