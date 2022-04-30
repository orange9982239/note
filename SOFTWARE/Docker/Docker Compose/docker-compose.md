# Docker Compose

> 這東西用起來有點像武功秘笈
> 配合portainer後非常方便

## gitea
``` yaml
version: "3"

networks:
  gitea:
    external: false

services:
  server:
    image: gitea/gitea:1.13.1
    container_name: gitea
    environment:
      - USER_UID=1000
      - USER_GID=1000
    restart: always
    networks:
      - gitea
    volumes:
      - /srv/gitea/data:/data
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
    ports:
      - "8080:3000"
      - "2022:22"
```

## Mssql
``` yaml
version: "3.9"
services:
  mssql:
    container_name: mssql
    user: root
    image: "mcr.microsoft.com/mssql/server:2019-latest"
    restart: always
    ports:
      - "1433:1433"
    environment:
      SA_PASSWORD: "#dbpassword#"
      ACCEPT_EULA: "Y"
      MSSQL_PID: "Express"
    volumes:
      - "smb:/var/opt/mssql/share"
      - "/srv/mssql:/var/opt/mssql"

volumes:
  smb:
    driver_opts:
      type: cifs
      o: "username=administrator,password=#dbpassword#"
      device: "//192.168.1.1/enroll"

#mssql cannot read sftp file...
#volumes:
#  # sudo docker plugin install vieux/sshfs
#  sshfs:
#    name: sshfs
#    driver: vieux/sshfs:latest
#    driver_opts:
#      sshcmd: "administrator@192.168.1.1:/d:/MSSQL_BAK/enroll"
#      password: "#dbpassword#"
#      allow_other: ""
```


## Gitlab

> 少年不要衝動想衝latest最新版，會哭的
> 穩定才是正道的光 
``` yaml 
version: "3.6"
services:
  gitlab:
    container_name: gitlab
    image: gitlab/gitlab-ce:13.12.15-ce.0 #latest
    restart: always
    privileged: true
    ports:
      - '8080:80'
      - '8443:443'
      - '8022:22'
    volumes:
      - /srv/gitlab/data:/var/opt/gitlab
      - /srv/gitlab/logs:/var/log/gitlab
      - /srv/gitlab/config:/etc/gitlab
```
<!--
# environment:
#   - GITLAB_ROOT_PASSWORD=#password#
#   - GITLAB_ROOT_EMAIL=administrator@nttu.edu.tw 
-->
- ref
  - https://zhuanlan.zhihu.com/p/201097039

## code-server
``` yaml 
version: "3"
services:
  codeserver:
    container_name: code-server
    image: codercom/code-server
    ports:
      - "6000:8080"
    volumes:
      - "/usr/local/code-server/project:/home/coder/project"
    environment:
      PASSWORD: "#password#"
    restart: always
    user: "0:0"
```

## codimd
``` yaml 
version: "3"
services:
  database:
    image: postgres:11.6-alpine
    environment:
      - POSTGRES_USER=#dbaccount#
      - POSTGRES_PASSWORD=#dbpassword#
      - POSTGRES_DB=codimd
    volumes:
      - "database-data:/var/lib/postgresql/data"
    restart: always
  codimd:
    image: hackmdio/hackmd:2.3.2
    environment:
      - CMD_DB_URL=postgres://#dbaccount#:#dbpassword#@database/codimd
      - CMD_USECDN=false
    depends_on:
      - database
    ports:
      - "3000:3000"
    volumes:
      - upload-data:/home/hackmd/app/public/uploads
    restart: always
volumes:
  database-data: {}
  upload-data: {}
```

## minio
``` yaml 
version: '3.1'
services: 
    minio:
      image: minio/minio
      container_name: minio
      restart: always
      #ports:
        #- 9001:9000
      #command: server /data
      ports:
        - 9001:9001
        - 9002:9002

      command: server /data --console-address ':9001' --address ':9002'
      #  9001 管理端
      #  9002 客戶端 顯示檔案
      #  url + 桶名稱 + 檔案名稱
      #  url => https://minio.dev.orange.tw/
      #  桶名稱 => test
      #  檔案名稱 => A13116XXXX_110年個人申請第二階段指定項目甄試報名費.pdf
      #  https://minio.dev.orange.tw/test/A13116XXXX_110年個人申請第二階段指定項目甄試報名費.pdf
      environment:
        MINIO_ROOT_USER: #account#           #管理后台用户名
        MINIO_ROOT_PASSWORD: #password#      #管理后台密码，最小8个字符
      volumes:
        - ./data:/data                       #映射当前目录下的data目录至容器内/data目录
        - ./config:/root/.minio/             #映射配置目录
```


## nextcloud
``` yaml 
version: '2'

volumes:
  nextcloud:
  db:

services:
  db:
    image: mariadb
    restart: always
    command: --transaction-isolation=READ-COMMITTED --binlog-format=ROW --innodb_read_only_compressed=OFF
    volumes:
      - db:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=#password#
      - MYSQL_PASSWORD=#password#
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
      - NEXTCLOUD_TRUSTED_DOMAINS=nextcloud.dev.orange.tw
  app:
    image: nextcloud
    restart: always
    ports:
      - 5000:80
    #command: ['--innodb_read_only_compressed=OFF']
    links:
      - db
    volumes:
      - nextcloud:/var/www/html
    environment:
      - MYSQL_PASSWORD=#password#
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
      - MYSQL_HOST=db
```

## nginx-proxy-manager
``` yaml 
version: '3'
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      - '80:80'
      - '81:81'
      - '443:443'
    environment:
      DB_MYSQL_HOST: "db"
      DB_MYSQL_PORT: 3306
      DB_MYSQL_USER: "npm"
      DB_MYSQL_PASSWORD: "npm"
      DB_MYSQL_NAME: "npm"

    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
  db:
    image: 'jc21/mariadb-aria:latest'
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: 'npm'
      MYSQL_DATABASE: 'npm'
      MYSQL_USER: 'npm'
      MYSQL_PASSWORD: 'npm'
    volumes:
      - ./data/mysql:/var/lib/mysql
```

## wikijs
``` yaml 
version: "3"
services:

  db:
    image: postgres:11-alpine
    environment:
      POSTGRES_DB: wiki
      POSTGRES_PASSWORD: wikijsrocks
      POSTGRES_USER: wikijs
    logging:
      driver: "none"
    restart: unless-stopped
    volumes:
      - db-data:/var/lib/postgresql/data

  wiki:
    image: requarks/wiki:2
    depends_on:
      - db
    environment:
      DB_TYPE: postgres
      DB_HOST: db
      DB_PORT: 5432
      DB_USER: wikijs
      DB_PASS: wikijsrocks
      DB_NAME: wiki
    restart: unless-stopped
    ports:
      - "4000:3000"

volumes:
  db-data:
```

## good docs
> https://blog.gurucomputing.com.au/doing-more-with-docker/deploying-outline-wiki/