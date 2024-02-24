# docker-viaaas

[VIAaaS](https://github.com/ViaVersion/VIAaaS) as a Docker Container


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