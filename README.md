# TESTING PR ACTIONS STUFF

# docker-viaaas
[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/RoblKyogre/docker-viaaas/docker-ci.yml)](https://github.com/RoblKyogre/docker-viaaas/actions/workflows/docker-ci.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/roblkyogre/docker-viaaas)](https://hub.docker.com/r/roblkyogre/docker-viaaas)
[![Docker Image Version (tag)](https://img.shields.io/docker/v/roblkyogre/docker-viaaas/latest)](https://hub.docker.com/r/roblkyogre/docker-viaaas/tags)

[VIAaaS](https://github.com/ViaVersion/VIAaaS) as a Docker Container

[Docker Hub](https://hub.docker.com/r/roblkyogre/docker-viaaas/) | [GitHub Repo](https://github.com/RoblKyogre/docker-viaaas/)

## Running

- Download the `docker-compose.yml` and `docker.env` files:
  ```
  wget https://github.com/RoblKyogre/docker-viaaas/raw/main/docker-compose.yml
  wget https://github.com/RoblKyogre/docker-viaaas/raw/main/docker.env
  ```

- Edit `docker.env` to fit your preferences.

- After that, start the container with this command:
  ```
  docker compose up -d
  ```

- To stop the server, use this command:
  ```
  docker compose down
  ```

- To update the image, use this command:
  ```
  docker compose pull
  ```
