# minio

``` yaml 
version: '3.1'
services: 
  minio:
    image: minio/minio
    container_name: minio
    restart: always
    ports:
      - 9000:9000
    command: server /data
    environment:
      MINIO_ROOT_USER: <<minioaccount>>                 #管理后台用户名
      MINIO_ROOT_PASSWORD: <<miniopassword>>        #管理后台密码，最小8个字符
        volumes:
      - /srv/minio/data:/data                             #映射当前目录下的data目录至容器内/data目录
      - /srv/minio/config:/root/.minio/                 #映射配置目录
```

## 存取
1. 取檔案
> `url + 桶名稱 + 檔案名稱`
* https://minio.dev.orange.tw/
* 桶名稱 => test
* 檔案名稱 => A13.pdf
* 檔案url => https://minio.dev.orange.tw/test/A13.pdf


## 管理端、客戶端分離
```yaml
    ports:
      - 9001:9001
      - 9002:9002
    command: server /data --console-address ':9001' --address ':9002'
    #  9001 管理端
    #  9002 客戶端 顯示檔案
```

## 掛載SMB
```yaml
volumes:
  smb:
  driver_opts:
  type: cifs
  o: "username=<<cifsaccount>>,password=<<cifspassword>>"
  device: "//192.168.1.1/minio"
```