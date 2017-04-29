# JSP boilerplate

A JSP based conteinered application with Maven, Docker, MySQL and some samples.

## How to use

1. Install Docker in your host machine.
1. Run `docker-compose pull` to download container images
1. Install maven on your host (maybe I will move this to a container)
1. Execute `mvn install` to build Java classes and download .jar files
1. Launch with `docker-compose up` and open your browser
1. The default address is `http://localhost:8080` but this can be changed in `docker-compose.yml`

## Important notes

`web.xml` file is located on `src/main/webapp/WEB-INF`.

This project is in package `br.ufscar`.

A database dump file could be placed on `database\data` folder. When docker starts MySQL all scrips in that folder will be started.
