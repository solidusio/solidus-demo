docker-compose up -d postgres
export DATABASE_URL=postgres://postgres:postgres@`docker-compose port postgres 5432`
echo $DATABASE_URL
bundle exec rails server
