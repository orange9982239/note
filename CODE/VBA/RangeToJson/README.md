# VBA RangeToJson

## 一、 功能概述
* EXCEL表

    |   |    A  	|  B   |
    |---|-----------|------|
    | 1 |   Id  	| Name |
    | 2 |A123123123	|王Ｏ明|
    | 3 |A234234234	|柳Ｏ橙|

* 轉為JSON Array
    ``` json
    [
        {
            "Id": "A123123123",
            "Name": "王Ｏ明"
        },
        {
            "Id": "A234234234",
            "Name": "柳Ｏ橙"
        }
    ]
    ```

## 二、 使用公式方式呼叫
1. 指定儲存格呼叫公式，並選取範圍`(必須包含標題作為JSON的KEY)`。
    > =ExcelToJSON(A1:B3)
    * ![20211223202849](https://raw.githubusercontent.com/orange9982239/ImageHosting/master/images/20211223202849.png)
2. 即可取得JSON ARRAY字串
    * ![20211223203111](https://raw.githubusercontent.com/orange9982239/ImageHosting/master/images/20211223203111.png)
## 三、 建立Function
1. 開VBE編輯工具
    * <kbd>Alt</kbd> + <kbd>F11</kbd>

2. 建立模組
    * 右鍵 => 插入 => 模組
    * ![20211223202421](https://raw.githubusercontent.com/orange9982239/ImageHosting/master/images/20211223202421.png)
3. 加入Function
    * 貼上程式碼
    ``` vb
    Public Function ExcelToJSON(rng As Range) As String
        ' Check there must be at least two columns in the Excel file
        If rng.Columns.Count < 2 Then
            ExcelToJSON = CVErr(xlErrNA)
            Exit Function
        End If
        Dim dataLoop, headerLoop As Long
        ' Get the first row of the Excel file as a header
        Dim headerRange As Range: Set headerRange = Range(rng.Rows(1).Address)
        ' Count the number of columns of targeted Excel file
        Dim colCount As Long: colCount = headerRange.Columns.Count
        Dim JSON As String: JSON = "["
        For dataLoop = 1 To rng.Rows.Count
            ' Skip the first row of the Excel file because it is used as header
            If dataLoop > 1 Then
                ' Start data row
                Dim jsonData As String: jsonData = "{"
                ' Loop through each column and combine with the header
                For headerLoop = 1 To colCount
                    jsonData = jsonData & """" & headerRange.Value2(1, headerLoop) & """" & ":"
                    jsonData = jsonData & """" & rng.Value2(dataLoop, headerLoop) & """"
                    jsonData = jsonData & ","
                Next headerLoop
                ' Strip out the comma in last value of each row
                jsonData = Left(jsonData, Len(jsonData) - 1)
                ' End data row
                JSON = JSON & jsonData & "},"
            End If
        Next
        ' Strip out the last comma in last row of the Excel data
        JSON = Left(JSON, Len(JSON) - 1)
        JSON = JSON & "]"
        ExcelToJSON = JSON
    End Function
    ```
