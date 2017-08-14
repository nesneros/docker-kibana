FROM docker.elastic.co/kibana/kibana:6.0.0-beta1

USER root

ENV KIBANA_VERSION=6.0.0-beta1

RUN curl -sL https://rpm.nodesource.com/setup_6.x | bash - \
    && yum install -y git nodejs patch freetype fontconfig \
    # Install metrics calculator
    && cd /usr/share/kibana/plugins && git clone --depth=1 https://github.com/ommsolutions/kibana_ext_metrics_vis.git extended_metric_vis \
    && cd extended_metric_vis && rm -rf .git \
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
    && yum remove -y -C git nodejs \
    && yum clean all

COPY formatting.patch /usr/share/kibana/
RUN cd /usr/share/kibana && patch -p1 < formatting.patch

USER kibana
