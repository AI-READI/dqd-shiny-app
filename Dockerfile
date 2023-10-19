FROM rocker/shiny-verse:latest

RUN rm -r /srv/shiny-server/*;
RUN apt update; \
    apt install -y default-jdk; \
    R CDM javareconf; \
    R -e "install.packages('remotes')"; \
    R -e "remotes::install_github('OHDSI/DataQualityDashboard')"; \
    cp -r /usr/local/lib/R/site-library/DataQualityDashboard/shinyApps/* /srv/shiny-server/

#This environment variable is included for testing purpose.
ENV jsonPath="/srv/shiny-server/www/results.json"
