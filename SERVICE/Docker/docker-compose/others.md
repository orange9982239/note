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
#   - GITLAB_ROOT_PASSWORD=<<password>>
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
      PASSWORD: "<<password>>"
    restart: always
    user: "0:0"
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

## LimeSurvey
``` yaml 
version: '3'
services:
  limesurvey:
    hostname: LimeSurvey
    restart: always
    ports:
      - "8888:80"
    volumes:
      - limesurvey_mysql:/var/lib/mysql
      - limesurvey_config:/app/application/config
      - limesurvey_upload:/app/upload
    image:
      crramirez/limesurvey:latest
volumes:
  limesurvey_mysql:
  limesurvey_config:
  limesurvey_upload:
```
