FROM docker.elastic.co/kibana/kibana:5.6.7

USER root
ENV KIBANA_VERSION=5.6.7
RUN ./bin/kibana-plugin install https://github.com/datasweet-fr/kibana-datasweet-formula/releases/download/v1.0.2/datasweet_formula-1.0.2_kibana-${KIBANA_VERSION}.zip
USER kibana
