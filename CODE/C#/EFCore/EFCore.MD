
# EF CORE

## 建立資料庫
* 先在localdb中建立LanguageCourse資料庫


## 安裝所需套件
1. Power Shell 安裝
    * 首先要先安裝 dotnet ef 的全域工具，才能使用dotnet ef的指令
        ```
        dotnet tool install --global dotnet-ef
        ```
2. Nuget安裝
    * > Microsoft.EntityFrameworkCore.SqlServer
    * > Microsoft.EntityFrameworkCore.Design
    * > Microsoft.EntityFrameworkCore.Tools

## 建立
* 指令說明：

    ``` cmd
    dotnet ef dbcontext scaffold \
    "<連線字串>" \
    "<使用的資料庫提供者套件>" \
    -o <是否要輸出在另外一個資料夾> <輸出的資料夾> \
    -c <名稱Context> \
    -f
    ```
* 本範例使用 `Microsoft.EntityFrameworkCore.SqlServer`
    ```cmd
    dotnet ef dbcontext scaffold \
    "Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=LanguageCourse;Integrated Security=True;Connect Timeout=30;" \
    "Microsoft.EntityFrameworkCore.SqlServer" \
    -o ./Models \
    -c LanguageCourseContext \
    -f
    ```

## 參考 
> https://ithelp.ithome.com.tw/articles/10240045