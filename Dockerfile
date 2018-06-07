FROM docker.elastic.co/kibana/kibana:5.6.8

ENV KIBANA_VERSION=5.6.8

RUN ./bin/kibana-plugin install https://github.com/fbaligand/kibana-enhanced-table/releases/download/v0.2.0/enhanced-table-0.2.0_${KIBANA_VERSION}.zip
RUN ./bin/kibana-plugin install http://static.miadata.dk/downloads/datasweet_formula-1.0.2_kibana-5.6.8.zip
