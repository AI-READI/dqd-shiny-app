# DQD-READAI

Repo to store the Docker image that will be used to host the Shiny App for DQD READAI project. The image is based on the `rocker/shiny-verse` image. The base image exposes port 3838, which is where the Shiny app can be accessed on. Currently, it is configured to be run locally as follows:

```
docker build -t dqd_readai:test .
docker run -it -p 3838:3838 dqd_readai:test
```

To access the app, we can open a web browser window, and visit http://localhost:3838