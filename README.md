# SUM

5 + 3 + 3 + 2 + 2 + 2 + 2 + 1 = `20`

# THINGS I'VE DONE

List of `features` :

    - Gettinng started (5)

    - Docker Compose (3)

    - Authorization (3)

    - Pagination (2)

    - Authentication (2)

    - Search 'by title' (2)

    - Images (2)

    - Admin (1)

# HOW TO RUN DOCKER-COMPOSE

- docker-compose build

Configure container:

- docker-compose run web rails db:create

- docker-compose run web rails db:migrate

Add `user` and `article` to DB:

- docker-compose run web rails c

or you can do it through pgAdmin or VS Code plugins

! IF DB IS EMPTY YOU`LL GET ENDLESS REDIRECTION