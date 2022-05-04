# PVE 防火牆設定
## 一、資料中心防火牆
> 先設定好`允許管理的群組`，再開防火牆，以免鎖死自己。
1. IPSET => 設定好IPSET群組
    > 建立全組加入機器IP，後續用於管理權限較方便。
    ![20220430163300](https://raw.githubusercontent.com/orange9982239/ImageHosting/master/images/20220430163300.png)
    * 人的群組
	    1. 管理者(網管)
        2. 使用者(開發者)
    * 機器的群組
        1. PVE_WEBUI
	    2. 虛擬機們

2. 設定防火牆規則
![20220430164516](https://raw.githubusercontent.com/orange9982239/ImageHosting/master/images/20220430164516.png)
    1. 允許 SSH
    * ![20220430165055](https://raw.githubusercontent.com/orange9982239/ImageHosting/master/images/20220430165055.png)
    2. 允許 TCP 8006(PVE web管理介面)
    * ![20220430165419](https://raw.githubusercontent.com/orange9982239/ImageHosting/master/images/20220430165419.png)
3. 防火牆開起來
* ![20220430165730](https://raw.githubusercontent.com/orange9982239/ImageHosting/master/images/20220430165730.png)
## 二、節點防火牆
1. 防火牆開起來

## 三、啟用客體機防火牆
1. 設定防火牆規則
    1. 管理者(網管)
        * SSH
        * RDP
        * MSSQL
    2. 使用者(開發者)
        * MSSQL
2. 防火牆開起來