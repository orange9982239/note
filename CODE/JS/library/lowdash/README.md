# lowdash
> Lodash 目前主要用來處理資料。

# Install
[cdnjs](https://cdnjs.com/libraries/lodash.js)

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
```

# Example
## 給假資料
```js
let data = [
    {id:'1',name:'exam1',sex:true ,mail:'exam1@mail.com'},
    {id:'2',name:'exam2',sex:true ,mail:'exam2@mail.com'},
    {id:'3',name:'exam3',sex:false,mail:'exam3@mail.com'},
    {id:'4',name:'exam4',sex:false,mail:'exam4@mail.com'},
    {id:'5',name:'exam5',sex:false,mail:'exam5@mail.com'}
];
```

## filter 過濾
```js
let filted_data = _.filter(data, (x) => { return x.sex; });
console.log(filted_data);
// [
//     {
//         "id": "1",
//         "name": "exam1",
//         "sex": true,
//         "mail": "exam1@mail.com"
//     },
//     {
//         "id": "2",
//         "name": "exam2",
//         "sex": true,
//         "mail": "exam2@mail.com"
//     }
// ]
```

## find 回傳第一個符合條件的元素
```js
let finded_data = _.filter(data, (x) => { return (x.name == 'exam1'); });
console.log(finded_data);
// [
//     {
//         "id": "1",
//         "name": "exam1",
//         "sex": true,
//         "mail": "exam1@mail.com"
//     }
// ]
```

## map 映射物件為另一格物件
```js
let mapped_data = _.map(data, (x)=>{ return {
    'id*2': (parseInt(x.id) * 2),
    'name_2': `${x.name}_2`,
    'changed_mail': x.mail.replaceAll('mail.com','mail.com.tw')
}})
console.log(mapped_data);
// [
//     {
//         "id*2": 2,
//         "name_2": "exam1_2",
//         "changed_mail": "exam1@mail.com.tw"
//     },
//     {
//         "id*2": 4,
//         "name_2": "exam2_2",
//         "changed_mail": "exam2@mail.com.tw"
//     },
//     {
//         "id*2": 6,
//         "name_2": "exam3_2",
//         "changed_mail": "exam3@mail.com.tw"
//     },
//     {
//         "id*2": 8,
//         "name_2": "exam4_2",
//         "changed_mail": "exam4@mail.com.tw"
//     },
//     {
//         "id*2": 10,
//         "name_2": "exam5_2",
//         "changed_mail": "exam5@mail.com.tw"
//     }
// ]
```