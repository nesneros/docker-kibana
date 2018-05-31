FROM docker.elastic.co/kibana/kibana:5.6.8

USER root
ENV KIBANA_VERSION=5.6.8
RUN ./bin/kibana-plugin install http://static.miadata.dk/downloads/datasweet_formula-1.0.2_kibana-5.6.8.zip
USER kibana
