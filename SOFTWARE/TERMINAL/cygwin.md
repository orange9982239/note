# Cygwin 設定

# Install
* 文字編輯
  * vim
  * nano
* cli browser
  * wget
  * curl
  * openssl
* ssh
  * openssh
  * cygrunsrv
* 備份
  * rsync
* 加密
  * gnupg2

# cygrunsrv config (SSH server)
2. 設定cygrunsrv
    * 以管理員權限執行cygwin
    * cygwin bash
        ```bash
        ssh-host-config -y
        ```
3. 啟動服務=>`CYGWIN cygsshd`  
4. 防火牆允許22 Port


# Home Directory match Windows Home Directory
1. 編輯 設定檔案
    ```bash
    vim /etc/nsswitch.conf
    ```
2. 將 `# db_home:  /home/%U`改成`# db_home:  /%H`
3. 重啟cygwin，使用`pwd`命令檢查home目錄是否由`/home/<<user>>`變成`/cygdrive/c/Users/<<user>>`