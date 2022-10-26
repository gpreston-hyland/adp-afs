FROM 047614345379.dkr.ecr.us-east-1.amazonaws.com/adp/afs:7.2.1
ENV TOMCAT_DIR=/usr/local/tomcat/webapps 
ENV TSEARCH=tsearch.war
ENV FEDERATION=federation.war

COPY ${FEDERATION} ${TOMCAT_DIR}
COPY ${TSEARCH} ${TOMCAT_DIR}

RUN set -eux; \
  rm -rf ${TOMCAT_DIR}/federation; \
  mkdir -p ${TOMCAT_DIR}/federation; \
  rm -rf ${TOMCAT_DIR}/tsearch; \
  mkdir -p ${TOMCAT_DIR}/tsearch; \
  cd ${TOMCAT_DIR}/federation; \
  unzip -qq ${TOMCAT_DIR}/${FEDERATION}; \
  rm ${TOMCAT_DIR}/${FEDERATION}; \
  cd ${TOMCAT_DIR}/tsearch; \
  unzip -qq ${TOMCAT_DIR}/${TSEARCH}; \
  rm ${TOMCAT_DIR}/${TSEARCH}

WORKDIR /usr/local/tomcat/
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]

