# nginx-proxy-manager

``` yaml
version: '3'
services:
	nginx-proxy-manager_ap:
		container_name: nginx-proxy-manager_ap
		image: 'jc21/nginx-proxy-manager:latest'
		restart: unless-stopped
		ports:
			- 80:80
			- 81:81
			- 443:443
		environment:
			DB_MYSQL_HOST: "nginx-proxy-manager_db"
			DB_MYSQL_PORT: 3306
			DB_MYSQL_USER: "npm"
			DB_MYSQL_PASSWORD: "npm"
			DB_MYSQL_NAME: "npm"
		volumes:
			- /srv/nginx-proxy-manager/data:/data
			- /srv/nginx-proxy-manager/letsencrypt:/etc/letsencrypt
	nginx-proxy-manager_db:
		container_name: nginx-proxy-manager_db
		image: 'jc21/mariadb-aria:latest'
		restart: unless-stopped
		environment:
			MYSQL_ROOT_PASSWORD: 'npm'
			MYSQL_DATABASE: 'npm'
			MYSQL_USER: 'npm'
			MYSQL_PASSWORD: 'npm'
		volumes:
			- /srv/nginx-proxy-manager/mysql:/var/lib/mysql
```