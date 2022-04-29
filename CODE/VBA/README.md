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

## 