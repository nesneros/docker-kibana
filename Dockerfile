FROM docker.elastic.co/kibana/kibana:5.3.0

# See https://github.com/elastic/kibana/issues/6057
# This step might take a few minutes
RUN /usr/share/kibana/bin/kibana 2>&1 | grep -m 1 "Optimization of .* complete in .* seconds"


