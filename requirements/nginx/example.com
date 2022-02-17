server  {
	listen 443 ssl default_server;
	listen [::]:443 default_server;

	ssl_certificate		/etc/nginx/ssl/example.com.pem;
	ssl_certificate_key	/etc/nginx/ssl/example.com-key.pem;

	root /var/www/example.com/html;

	index index.html index.htm index.nginx-debian.html;

	server_name example.com;

	location / {
		try_files $uri $uri/ =404;
	}
}

