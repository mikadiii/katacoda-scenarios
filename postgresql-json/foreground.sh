docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d postgres
docker exec -it some-postgres psql -U postgres