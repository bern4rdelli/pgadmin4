# Use DBeaver: http://dbeaver.jkiss.org/download/


# ~PgAdmin4~
~PgAdmin4 server for local environment~

## ~Running~

```
docker run -d -v /pgadmin4/queries:/pgadmin4/queries --name PgAdmin4 --restart always -p 5050:5050 bernardelli/pgadmin4:latest
```
