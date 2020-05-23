ARG ELK_VERSION
FROM docker.elastic.co/elasticsearch/elasticsearch:${ELK_VERSION}




# 在from之前定义的arg不能用于构建
ARG ELK_VERSION
ARG INSTALL_IK_PLUGIN=false
RUN if [ ${INSTALL_IK_PLUGIN} = true ]; then \
    echo "ELK_VERSION is  ${ELK_VERSION} " \
    && cd /usr/share/elasticsearch \
    # 会提示【y/n】echo y| 
    && echo y|./bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v${ELK_VERSION}/elasticsearch-analysis-ik-${ELK_VERSION}.zip \
;fi



EXPOSE 9200 9300