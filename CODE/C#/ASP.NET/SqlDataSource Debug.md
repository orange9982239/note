# SqlDataSource Debug

> 如果你剛好控制不住自己的手用前端SqlDataSource處理SQL，或是接手了陳年老案...
> 
> 通常會因為`ASP.NET前端端無法放斷點`，無法取回參數而發生悲劇。


## SqlDataSource攔截參數及SQL方法
* *.aspx
> 在想要攔截參數的SqlDataSource中加入`OnSelecting="SDS_GV_Selecting`"
```html
<asp:SqlDataSource ID="SDS_GV" runat="server" 
    OnSelecting="SDS_GV_Selecting"
    ConnectionString="<%$ ConnectionStrings:enro_connection %>" 
    SelectCommand=""
    >
    <SelectParameters>
        <asp:ControlParameter Name="enat_year" ControlID="DDL_Year" Type="String" />
        <asp:ControlParameter Name="enat_yearcnt" ControlID="DDL_ActCnt" Type="String" />
        <asp:ControlParameter Name="enatd_id" ControlID="DDL_AcUnit" Type="String" />
        <asp:ControlParameter Name="paid" ControlID="RBL_Paid" Type="String" />
        <asp:ControlParameter Name="idno_" ControlID="TB_Idno" Type="String" DefaultValue="%" />
        <asp:ControlParameter Name="fee_pos_id" ControlID="DDL_FeeType" Type="String" DefaultValue="%" />
        <asp:ControlParameter Name="qual_pos_id" ControlID="DDL_QualPos" Type="String" DefaultValue="%" />
        <asp:ControlParameter Name="q002_id" ControlID="DDL_QualItem" Type="String" DefaultValue="%"/>
        <asp:ControlParameter Name="stud_uname" ControlID="TB_StudName" Type="String" DefaultValue="%" />
        <asp:ControlParameter Name="quota_pos_id" ControlID="DDL_Quota" Type="String" DefaultValue="%" />
        <asp:Parameter Name="enpt_status" Type="Int32" DefaultValue="1" />
    </SelectParameters>
</asp:SqlDataSource>
```
* *.aspx.cs
> 並在後端加入攔截方法SDS_GV_Selecting並下斷點。
```c#
protected void SDS_GV_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
{
    //接回SQL參數放入ExpandoObject
    var sqlParameters = new ExpandoObject() as IDictionary<string, Object>;
    foreach (SqlParameter Parameter in e.Command.Parameters)
    {
        sqlParameters.Add(Parameter.ParameterName, Parameter.Value);
    }

    //SQL參數轉回JSON
    string sqlParametersJson = Newtonsoft.Json.JsonConvert.SerializeObject(sqlParameters);
    //SQL指令
    string sqlString = e.Command.CommandText;

    System.Diagnostics.Debug.WriteLine(sqlParametersJson);
    System.Diagnostics.Debug.WriteLine(sqlString);
}
```

> 回SQL進行參數化查詢

```sql
-- 加入sqlParametersJson取回的參數
DECLARE @enat_year AS VARCHAR(MAX) = '111'
DECLARE @enat_yearcnt AS VARCHAR(MAX) = '10'
DECLARE @enatd_id AS VARCHAR(MAX) = '%'
DECLARE @paid AS VARCHAR(MAX) = '1'
DECLARE @idno_ AS VARCHAR(MAX) = '%'
DECLARE @fee_pos_id AS VARCHAR(MAX) = '%'
DECLARE @qual_pos_id AS VARCHAR(MAX) = '%'
DECLARE @q002_id AS VARCHAR(MAX) = '%'
DECLARE @stud_uname AS VARCHAR(MAX) = '%'
DECLARE @quota_pos_id AS VARCHAR(MAX) = '%'
DECLARE @enpt_status AS VARCHAR(MAX) = 1

-- 加入sqlString
SELECT 
    FILES.id_,
    FILES.idno_,
    q003_id_item_ = concat(FILE_ITEM.id_,': ', FILE_ITEM.item_),
    FILES.filename_
FROM 
    enroll_q004_qualify_filename FILES
    LEFT JOIN genl_st_state_item FILE_ITEM ON FILE_ITEM.id_ = FILES.q003_id_
        .
        .
        .
```