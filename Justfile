start:
    docker compose -f secad.docker-compose.yml up

rebuild:
    docker compose -f secad.docker-compose.yml up --build

down:
    docker compose -f secad.docker-compose.yml down

nuke:
    docker compose -f secad.docker-compose.yml down -v
    docker volume rm $(docker volume ls -q)