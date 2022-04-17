docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d postgres
sleep 10
docker exec -it some-postgres psql -U postgres