FROM docker.elastic.co/kibana/kibana:5.3.2

USER root

ENV KIBANA_VERSION=5.3.2

RUN apt-get update -y && apt-get install -y git npm libfreetype6 fontconfig \
    # Install c3 charts
    && cd /usr/share/kibana/plugins && git clone --depth=1 https://github.com/mstoyano/kbn_c3js_vis.git c3_charts \
    && cd c3_charts && rm -rf .git \
    && sed -Ei "s/(\"version\":).*,$/\1 \"$KIBANA_VERSION\",/" package.json \
    && npm install \
    # Install line sg
    && cd /usr/share/kibana/plugins && git clone --depth=1 https://github.com/sbeyn/kibana-plugin-line-sg.git line_sg \
    && cd line_sg && rm -rf .git \
    && sed -Ei "s/(\"version\":).*$/\1 \"$KIBANA_VERSION\"/" package.json 
    # APT clean up
#    && apt-get remove --purge -y git npm $(apt-mark showauto)\
#    && apt-get autoremove -y \
#    && rm -rf /var/lib/apt/lists/*

USER kibana

# See https://github.com/elastic/kibana/issues/6057
# This step might take a few minutes
#RUN /usr/share/kibana/bin/kibana 2>&1 | grep -m 1 "Optimization of .* complete in .* seconds"


