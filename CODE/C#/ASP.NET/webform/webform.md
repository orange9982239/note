# webform

## CommandArgument 傳值
* aspx

```html
<asp:Button ID="Button1" runat="server" OnCommand="CallMe_Click" Text="Button1" CommandArgument="Button1" />
<asp:Button ID="Button2" runat="server" OnCommand="CallMe_Click" Text="Button2" CommandArgument="Button2" /><br />
<br />
<asp:ImageButton ID="ImageButton1" runat="server" OnCommand="CallMe_Click" CommandArgument="ImageButton1" />
<asp:ImageButton ID="ImageButton2" runat="server" OnCommand="CallMe_Click" CommandArgument="ImageButton2" />
<br />
<br />
<asp:LinkButton ID="LinkButton1" runat="server" OnCommand="CallMe_Click" CommandArgument="LinkButton1" >LinkButton1</asp:LinkButton>
<asp:LinkButton ID="LinkButton2" runat="server" OnCommand="CallMe_Click" CommandArgument="LinkButton2">LinkButton2</asp:LinkButton>
```

* aspx.cs
```csharp
protected void CallMe_Click(object sender, CommandEventArgs e)
{
    Response.Write("<script>alert('你按下的是" + e.CommandArgument.ToString() + "');</script>");
}
```
* ref
  * [專解疑難雜症的程式筆記](http://codingnoteofccs.blogspot.com/2014/03/)


## 事件
### DDL change 
* aspx

```html
OnSelectedIndexChanged="DDL_IndexChanged"
```

* aspx.cs
```csharp
protected void ddComapanyFilter_SelectedIndexChanged(object sender, EventArgs e)
{
//code
}
```

## RowDataBound
* aspx

```html
OnRowDataBound="GV1_RowDataBound"
```

* aspx.cs
```csharp
protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
{
//code
}
```

## Postback
### 頁面第一次載入時才要執行的事件
* aspx.cs

```csharp
if(!IsPostBack)
{
	//頁面第一次載入時才要執行的事件
}
```

* ref
  * https://ithelp.ithome.com.tw/articles/10222506
### 不跳回頂端
* aspx

```html
OnRowDataBound="GV1_RowDataBound"
```


## Session 
```csharp
//設定Session
Session["user"] = "小明";

//取Session
(string)HttpContext.Current.Session["user"]
```


## WebMethod
> 當作webform版本的web api可以進行ajax操作
<!-- 未完成 -->
### web.config設定
  1. 接收post/get
  2. 解除Json max length
### 使用WebMethod
 1. aspx中使用
     1. 引用using
     2. 程式結構
     3. 範例
 2. asmx中使用
     1. 引用using
     2. 程式結構
     3. 範例


## DropdownList

### DropDownList 基本操作
```csharp
//**在最後一個項目添加：**
DropDownList.Items.Add("text");
DropDownList.Items.Add(new ListItem("text","value"));    

//在指定的位置添加一項目(index請改成數字)
DropDownList.Items.Insert(index, new ListItem("text","value"));

//移除指定的項目
DropDownList.Items.Remove("text");
DropDownList.Items.RemoveAt(index);

//移除所有的項目
DropDownList.Items.Clear();

//項目的總數
DropDownList.Items.Count;
```

* ref 
  * https://dotblogs.com.tw/mis0800/2014/01/26/142181

### DataSet => DropDownList 
* aspx

```html
<asp:DropDownList ID="MyDropDownList" runat="server" DataTextField="SomeString" DataValueField="SomeUniqueId" />
```

* aspx.cs
```csharp
protected void Page_Load(object sender, EventArgs e)
{
    var myDataSet = new DataSet(); // replace with your dataset
    MyDropDownList.DataSource = myDataSet;
    MyDropDownList.DataBind();
}
```
* ref
  * https://social.msdn.microsoft.com/Forums/en-US/06a7e990-39e5-4a8a-a8ed-f0b42225d3da/fill-dropdown-list-from-dataset?forum=aspgettingstarted



### DropDownList 下拉預設選定資料
```csharp
DropDownList.Items.FindByText("").Selected = true;
DropDownList.Items.FindByValue(yourValue).Selected = true;
```
* ref
  * https://m.blueshop.com.tw/Thread.aspx?tbfumsubcde=BRD20100325223933ZTW