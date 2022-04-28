# JS ARRAY 轉述狀結構使用LINQ.js

## 功能
> 將`帶有ParentId的Array`轉換成`樹狀結構`
- `帶有ParentId的Array`
    ``` json
    [
        {
            "id_": "TW",
            "cname_": "臺灣",
            "ename_": "Taiwan, Province of China",
            "postal_": null,
            "c001_id_parent_": null,
            "display_": "Y"
        },
        {
            "id_": "TW-CHA",
            "cname_": "彰化縣",
            "ename_": "Changhua County",
            "postal_": "o12",
            "c001_id_parent_": "TW",
            "display_": "Y"
        },
        {
            "id_": "TW-CYI",
            "cname_": "嘉義市",
            "ename_": "Chiayi City",
            "postal_": "o14",
            "c001_id_parent_": "TW",
            "display_": "Y"
        }
    ]
    ```
- `樹狀結構`
    ``` json
    [
    {
        "id_": "TW",
        "cname_": "臺灣",
        "ename_": "Taiwan, Province of China",
        "postal_": null,
        "c001_id_parent_": null,
        "display_": "Y",
        "Child": [
        {
            "id_": "TW-CHA",
            "cname_": "彰化縣",
            "ename_": "Changhua County",
            "postal_": "o12",
            "c001_id_parent_": "TW",
            "display_": "Y",
            "Child": []
        },
        {
            "id_": "TW-CYI",
            "cname_": "嘉義市",
            "ename_": "Chiayi City",
            "postal_": "o14",
            "c001_id_parent_": "TW",
            "display_": "Y",
            "Child": []
        }
        ]
    }
    ]
    ```


## 用法
### 一、引用linq.js
``` html
<script src="https://unpkg.com/linq@3.2.4/linq.min.js"></script></head>
```
  - document
    -  https://github.com/mihaifm/linq

### 二、生成樹狀結構`遞迴算法`
> * 要對上欄位
> * 加入Child欄位，並遞迴自己GetTree()
``` js
function GetTree(list,c001_id_parent_){
    return Enumerable.from(list).where(x=>x.c001_id_parent_ == c001_id_parent_)
    .select((x) => ({ 
        id_: x.id_,
        cname_: x.cname_,
        ename_: x.ename_,
        postal_: x.postal_,
        c001_id_parent_: x.c001_id_parent_,
        display_: x.display_,
        Child: GetTree(list, x.id_)
    }))
    .toArray();
}
```

### 三、調用
``` js
document.addEventListener("DOMContentLoaded",async function(){
    //#region 讀取 json file
    var data_taiwan = await fetch("data_taiwan.json")
        .then(response => response.json())
        .then(json =>{
            console.log(`load success!count=>${json.length}`)
            return json;
        });

    var data_world = await fetch("data_world.json")
        .then(response => response.json())
        .then(json => {
            console.log(`load success,count=>${json.length}`);
            return json;
        });
    //#endregion
    
    //印出 JArray
    console.log(GetTree(data_taiwan,null));
    console.log(GetTree(data_world,null));
    
    //印出 json
    console.log(JSON.stringify(GetTree(data_taiwan,null), null, 2));
    console.log(JSON.stringify(GetTree(data_world,null), null, 2));
});
```