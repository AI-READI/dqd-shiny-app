# DataQualityDashboard Shiny App

This image contains the [Shiny App](https://www.rstudio.com/products/shiny/) for the [DataQualityDashboard](https://github.com/OHDSI/DataQualityDashboard/). It is based on the [`rocker/shiny-verse` image](https://rocker-project.org/images/versioned/shiny.html).

To build the image, use the following command:

```
docker build -t dqd-aireadi .
```

The following command will run the container in the background and serve it on the default port 3838.

```
docker run -d -it -p 3838:3838 dqd-aireadi
```

To access the app, open a web browser window and visit http://localhost:3838 once it is running.

Be default, the Shiny app uses the sample `results.json` from the DataQualityDashboard library. There are a couple methods to define another result source. The first method is to mount the `results.json` output file from the [`DataQualityDashboard::executeDqChecks`](https://ohdsi.github.io/DataQualityDashboard/) in a volume and set the `jsonPath` environment variable to its location.

```
docker run -d -p 3838:3838 \
-v /local/path/to/result.json:/container/path/to/result.json \
-e jsonPath=/container/path/to/result.json \
dqd_aireadi:test
```

Alternatively, if the `result.json` is available from an URL, use the address for the `jsonPath` environment variable.

```
docker run -d -p 3838:3838 \
-e jsonPath=https://example.com/result.json \
dqd_aireadi:test
```
