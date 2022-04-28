# 日期時間

## 日期時間處理
- HTML INPUT
    ``` html
    <!-- 日期 -->
    <input id="inputDate" type="date">
    <!-- 日期時間 -->
    <input id="inputDateTime" type="datetime-local">
    ```
    > js 取回格式
    ``` js
    console.log(inputDate.value)
    // "2021-11-02"
    console.log(inputDateTime.value)
    // "2021-11-03T18:08"
    ```
- JS date format
    ``` js
    var date = new Date();
    console.log(date.toISOString())
    //"2021-11-27T09:52:37.090Z"
    // ISO時間 將時間用UTC格式紀錄(時區+0,台灣要+8)
    console.log(date.toDateString())
    //"Sat Nov 27 2021"
    console.log(date.toLocaleDateString())
    //"2021/11/27"
    console.log(date.toLocaleString())
    //"2021/11/27 下午5:52:37"
    ```
- momentjs
    > document => https://momentjs.com/
    - 引入 JS
        ``` html
        <!-- 引入moment.js https://momentjs.com/ -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" referrerpolicy="no-referrer"></script>
        ```
    - 轉格式
        ``` js
        var date = new Date();
        moment(date).format("YYYY-MM-DD")
        // '2021-11-27'
        moment(date).format("YYYY-MM-DDTHH:mm")
        // '2021-11-27T18:27'
        ```

## EXAMPLE
- HTML
    > HTML 引入 moment.js
    ``` html
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width">
            <!-- 引入moment.js https://momentjs.com/ -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" referrerpolicy="no-referrer"></script>
            <title>JS Bin</title>
        </head>
        <body>
            <!-- 放兩個html dom -->
            <input id="inputDate" type="date">
            <input id="inputDateTime" type="datetime-local">
        </body>
        <script>
            var date = new Date();
            //回填html
            inputDate.value = moment(date).format("YYYY-MM-DD")
            inputDateTime.value = moment(date).format("YYYY-MM-DDTHH:mm")
        </script>
    </html>
    ```