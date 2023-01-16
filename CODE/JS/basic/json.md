# json 處理

## 兩大方法
1. 反序列化(將`文字`轉為`js物件或array`)
```js
JSON.parse()
```

1. 序列化(`js物件或array`轉`文字`)
```js
JSON.stringify()
```
## 取值
1. array資料
```js
data = [
    {
        'row0col1':'row0col1val',
        'row0col2':'row0col2val'
    },
    {
        'row1col1':'row1col1val',
        'row1col2':'row1col2val'
    },
    {
        'row2col1':'row2col1val',
        'row2col2':'row2col2val'
    }
]

console.log(data[0])
// out
// {
//     "row0col1": "row0col1val",
//     "row0col2": "row0col2val"
// }
```

2. object資料
```js
data = {
    'row0col1':'row0col1val',
    'row0col2':'row0col2val'
}

console.log(data.row0col1)
// out
// row0col1val
```
 