FROM docker.elastic.co/kibana/kibana:5.4.0

USER root

ENV KIBANA_VERSION=5.4.0

RUN curl -sL https://rpm.nodesource.com/setup_6.x | bash - \
    && yum install -y git nodejs freetype fontconfig \
    # Install metrics calculator
    && cd /usr/share/kibana/plugins && git clone --depth=1 https://github.com/ommsolutions/kibana_ext_metrics_vis.git metriccalc \
    && cd metriccalc && rm -rf .git \
    && sed -Ei "s/(\"version\":).*$/\1 \"$KIBANA_VERSION\"/" package.json \
    # Install line sg
     # cd /usr/share/kibana/plugins && git clone --depth=1 https://github.com/mstoyano/kbn_c3js_vis.git c3_charts \
     # && cd c3_charts && rm -rf .git \
     # && sed -Ei "s/(\"version\":).*,$/\1 \"$KIBANA_VERSION\",/" package.json \
     # && npm install \
    # Install line sg
     # && cd /usr/share/kibana/plugins && git clone --depth=1 https://github.com/sbeyn/kibana-plugin-line-sg.git line_sg \
     # && cd line_sg && rm -rf .git \
     # && sed -Ei "s/(\"version\":).*$/\1 \"$KIBANA_VERSION\"/" package.json \
    # yum cleanup
    && yum clean all

USER kibana
