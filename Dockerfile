FROM rocker/shiny-verse:latest

RUN rm -r /srv/shiny-server/*;

COPY shinyApps/ /srv/shiny-server/

RUN apt update; \
    apt install -y default-jdk; \
    R CDM javareconf; \
    R -e "install.packages('remotes')"; \
    R -e "remotes::install_github('OHDSI/DataQualityDashboard')"

#This environment variable is included for testing purpose.
ENV jsonPath='/srv/shiny-server/www/results.json'