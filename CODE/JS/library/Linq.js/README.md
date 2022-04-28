# Linq.js
> 用法語C#中Linq相似，可以方便的過濾及映射物件，個人常用於讀取JSON並過濾

# Install
1. use script
    https://unpkg.com/browse/linq@4.0.0/
2. use npm
    ```bash
    npm install linq@3
    ```
# Example
* tips
    > where 與 select 中參數 x, i
    > * 第一個參數 x => `[array]中的{物件}`
    > * 第二個參數 i => `{物件}在[array]中的index`
## 以index 當成條件過濾 (Where in Index)
```js
const Enumerable = require('linq')
let jsonData = [
    {
        "account": "A123123123",
        "password": "11111111"
    },
    {
        "account": "B123123123",
        "password": "22222222"
    },
    {
        "account": "C123123123",
        "password": "33333333"
    },
    {
        "account": "D123123123",
        "password": "44444444"
    }
];

let fulted_jsonData = Enumerable.from(jsonData)     //讀取json
    .where((x, i) => { return [1,2].includes(i);})  //過濾第1、2列資料
    .toArray();                                     //重新轉為陣列

console.log(fulted_jsonData)
// output =>
// [
//     {
//         "account": "A123123123",
//         "password": "11111111"
//     },
//     {
//         "account": "B123123123",
//         "password": "22222222"
//     }
// ]
```



## 降List過濾並轉為其他物件
```js
const Enumerable = require('linq')
let jsonData = [
    {
        "account": "A123123123",
        "password": "11111111"
    },
    {
        "account": "B123123123",
        "password": "22222222"
    },
    {
        "account": "C123123123",
        "password": "33333333"
    },
    {
        "account": "D123123123",
        "password": "44444444"
    }
];

let fulted_jsonData = Enumerable.from(jsonData)                 //讀取json
    .where((x, i) => { return x.account == 'B123123123';})      //過濾account 為 'B123123123'的資料。  
    .select((x, i) => {                                         //轉為其他物件，可自行增加欄位
        return {
            "index": i,
            "account": x.account,
            "password": x.password
        }
    })
    .toArray();

console.log(fulted_jsonData)
// output =>
// [
//     {
//         "index": 0,
//         "account": "A123123123",
//         "password": "11111111"
//     }
// ]
```

# Ref
1. https://github.com/mihaifm/linq