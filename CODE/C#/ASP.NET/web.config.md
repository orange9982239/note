# web.config

## connectionStrings連線字串
> Ms SQL connectionStrings 格式     
```xml
Data Source=localhost,1433;           //主機IP,Port
Initial Catalog=education;            //DB Name
User ID=sa;                           //acc
Password=mypass                       //pw
providerName="System.Data.SqlClient"  //連線驅動程式
Persist Security Info=True;           //當連線建立成功之後，就會立即將「敏感資訊」清除
trusted_connection=true;              //使用windows認證，不用UserID/Password
Integrated Security=SSPI;             //使用windows認證，不用UserID/Password
```
* ref
    * [SQL Server connection strings](https://www.connectionstrings.com/sql-server/)
        
### connectionStrings在web.config 檔案內結構
        
```xml
<configuration>
    <connectionStrings>
        <add name="Test" connectionString="Data Source=.;Initial Catalog=OmidPayamak;Integrated Security=True" providerName="System.Data.SqlClient" />
    </connectionStrings>
</configuration>
```
        
# 上傳檔案大小限制
    
```xml
<configuration>
  <system.web>
    <httpRuntime maxRequestLength = "2048" executionTimeout="3600" requestLengthDiskThreshold="2048" />
  </system.web>
  <system.webServer>
    <security>
      <requestFiltering>
        <requestLimits maxAllowedContentLength="20480000"></requestLimits>
      </requestFiltering>
    </security>
  </system.webServer>
</configuration>
```
* ref    
    * [Site crashes when uploading file size is more than 2 MB (VS 2010, .Net 4.0).](https://www.codeproject.com/Questions/636644/Site-crashes-when-uploading-file-size-is-more-than)

# C# 取用web.config
        
```csharp
//1.先引用System.Configuration
using System.Configuration;
string conStr = ConfigurationManager.ConnectionStrings["Test"].ToString();

//2.直接用
var connection = System.Configuration.ConfigurationManager.ConnectionStrings["Test"].ConnectionString;
```