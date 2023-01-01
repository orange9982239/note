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