# Java boilerplate

A Java container application with Maven, Docker, MySQL and some samples.

## How to use

1. Install Docker in your host machine. Follow [docker documentation](https://docs.docker.com/engine/installation/) and don't forget the [optional steps](https://docs.docker.com/engine/installation/linux/linux-postinstall/) if running on Linux.
1. If you are running on Windows, make sure your [system met the minimum requirements](https://docs.docker.com/docker-for-windows/install/#what-to-know-before-you-install).
1. Run `docker-compose pull` to download container images
1. Execute `docker-compose run mvn` to build Java classes and download dependencies files.
1. Launch with `docker-compose up tomcat` and open your browser.
1. The default address is `http://localhost:8080` but this can be changed in `docker-compose.yml`.

## Important notes

This boilerplate uses [Maven Standard Directory Layout](https://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html) to organize the app.

`web.xml` file is located on `src/main/webapp/WEB-INF`.

Default project package is `br.ufscar`.

Maven container entrypoint is set to `mvn`, making easy to run maven commands (e.g: `docker-compose run mvn clean install`). Default command is `install`, so running `docker-compose run mvn` is the same as `mvn install`.

A database dump file could be placed on `database\data` folder. When MySQL container is created, all scripts in that folder will be executed.
