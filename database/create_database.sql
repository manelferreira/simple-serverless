create database simple_sls with encoding 'UTF8' template template0;

\connect simple_sls

CREATE USER sls_user WITH PASSWORD 'sls_password';

GRANT ALL PRIVILEGES ON DATABASE simple_sls TO sls_user;