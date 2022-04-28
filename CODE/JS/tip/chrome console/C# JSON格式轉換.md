
## 取得一份C#中也能用的 json string 格式
> chrome console => `JSON.stringify(#Jarray#).replaceAll("\"","\\\"")`

> js 物件/陣列 JSON.stringify() 壓製成string，再用replaceAll代換"=>\"則為C#中可用格式。


``` js
JSON.stringify([
    {
        "id":"A123123123",
        "name":"王曉明",
        "enroitems":[
            {
                "id":"1",
                "name":"資管碩班",
                "price":"1200"
            },
            {
                "id":"1",
                "name":"資管博班",
                "price":"1500"
            }
        ]
    },
    {
        "id":"B123123123",
        "name":"王曉明2",
        "enroitems":[
            {
                "id":"1",
                "name":"資工碩班",
                "price":"1200"
            },
            {
                "id":"1",
                "name":"資工博班",
                "price":"1500"
            }
        ]
    }
]).replaceAll("\"","\\\"")

// '[{\\"id\\":\\"A123123123\\",\\"name\\":\\"王曉明\\",\\"enroitems\\":[{\\"id\\":\\"1\\",\\"name\\":\\"資管碩班\\",\\"price\\":\\"1200\\"},{\\"id\\":\\"1\\",\\"name\\":\\"資管博班\\",\\"price\\":\\"1500\\"}]},{\\"id\\":\\"B123123123\\",\\"name\\":\\"王曉明2\\",\\"enroitems\\":[{\\"id\\":\\"1\\",\\"name\\":\\"資工碩班\\",\\"price\\":\\"1200\\"},{\\"id\\":\\"1\\",\\"name\\":\\"資工博班\\",\\"price\\":\\"1500\\"}]}]'
```