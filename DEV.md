Install

- get sources from https://github.com/dim-dimus/hozdvor

- set settings to .hosts:

127.0.0.1 hozdvor.local

- set settings to .hosts and xampp/apache/conf/extra/httpd-vhosts:

<VirtualHost hozdvor.local:80>
    DocumentRoot "D:/source/hozdvor/public"
    ServerName hozdvor.local
    ErrorLog "logs/hozdvor.local-error.log"
    CustomLog "logs/hozdvor.local-access.log" combined
    <Directory "D:/source/hozdvor/public">
           AllowOverride All
        Options Indexes FollowSymLinks MultiViews
        Require all granted
    </Directory>
</VirtualHost>

- create mysql database "hozdvor_yupe" (encoding  utf-8) 

- copy file /protected/config/db_live and save it as db.php

- edit db.php: set db connection options:

'connectionString' => 'mysql:host=127.0.0.1;port=3306;dbname=hozdvor_yupe',
'username' => 'root',
'password' => '',

- import /protected/data/hozdvor_yupe.sql to new database

- launch hozdvor.local