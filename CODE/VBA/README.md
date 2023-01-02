# VBA NOTE

## 常用函數
``` vb
Function splitIndex(inputString As String, splitStr As String, Optional index As Integer = 0)
    strArray = Split(inputString, splitStr)
    splitIndex = strArray(index)
End Function
```
``` vb
= splitIndex("123,456,678",",",2)
= "678"
```

## 用瀏覽器開網頁

```vb
Sub openUrl() 
    URL = "https://www.google.com.tw/" 
    CreateObject("WScript.Shell").Run ("cmd /c start " & URL) 
End Sub 
```

## 按下Enter時執行 
```vb
Private Sub TextBox2_KeyDown(ByVal KeyCode As MSForms.ReturnInteger, ByVal Shift As Integer) 
    If KeyCode = 13 Then 
        '... 
    End If 
End Sub 
```

## 資料庫內容放進下拉選單 

```vb
Set myCon = CreateObject("ADODB.Connection") 
myCon.Open tempSheet.Cells(8, 2) 
sql ="" 
Set myRs = myCon.Execute(sql) 
ComboBox1.Clear 
Do While Not myRs.EOF 
    ComboBox1.AddItem myRs(0) 
    myRs.MoveNexts 
Loop 
```

## VBA 密碼更改
1. 副檔名改zip
2. 取出`vbaProject.bin` => `zip檔案/xl/vbaProject.bin`
3. 用notepad++替換三行
    ```
    CMG="2D2F81B49F27A327A323A723A7"
    DPB="9C9E3025F0890D890D76F38A0D1A9F3635D44E8607D4CD2B0C2CEE3AE60EBAA7585DAC156B9D"
    GC="0B09A7DA17DB17DB17"
    ```
4. `vbaProject.bin`複蓋回zip檔案
5. 副檔名改回xlsm，打開VBA密碼變成`00000000`