FROM nidaven/nodered-influx
COPY ./nodered_configs/settings.js /data/
COPY ./nodered_configs/package.json /data/
ARG LOCALMQTTUSER
ARG LOCALMQTTPASS
ARG MQTTHOSTNAME
ARG CLOUDMQTTIP
ARG CLOUDMQTTPORT
ARG CLOUDMQTTUSER
ARG CLOUDMQTTPASS
ARG DOCKER_INFLUXDB_INIT_ORG
ARG DOCKER_INFLUXDB_INIT_BUCKET
ARG DOCKER_INFLUXDB_INIT_ADMIN_TOKEN
ENV LOCALMQTTUSER=${LOCALMQTTUSER}
ENV LOCALMQTTPASS=${LOCALMQTTPASS}
ENV MQTTHOSTNAME=${MQTTHOSTNAME}
ENV CLOUDMQTTIP=${CLOUDMQTTIP}
ENV CLOUDMQTTPORT=${CLOUDMQTTPORT}
ENV CLOUDMQTTPASS=${CLOUDMQTTPASS}
ENV CLOUDMQTTUSER=${CLOUDMQTTUSER}
ENV DOCKER_INFLUXDB_INIT_ADMIN_TOKEN=${DOCKER_INFLUXDB_INIT_ADMIN_TOKEN}
ENV DOCKER_INFLUXDB_INIT_BUCKET=${DOCKER_INFLUXDB_INIT_BUCKET}
ENV DOCKER_INFLUXDB_INIT_ORG=${DOCKER_INFLUXDB_INIT_ORG}
COPY ./nodered_configs/flows.json /data/
COPY ./nodered_configs/flows_cred.json /data/
RUN sed -i "s/DOCKER_INFLUXDB_INIT_ADMIN_TOKEN/${DOCKER_INFLUXDB_INIT_ADMIN_TOKEN}/" /data/flows_cred.json
RUN sed -i -e "s/CLOUDMQTTUSER/${CLOUDMQTTUSER}/" -e "s/CLOUDMQTTPASS/${CLOUDMQTTPASS}/" /data/flows_cred.json
RUN sed -i -e "s/LOCALMQTTUSER/${LOCALMQTTUSER}/" -e "s/LOCALMQTTPASS/${LOCALMQTTPASS}/" /data/flows_cred.json
RUN sed -i "s/MQTTHOSTNAME/${MQTTHOSTNAME}/" /data/flows.json
RUN sed -i -e "s/CLOUDMQTTIP/${CLOUDMQTTIP}/" -e "s/CLOUDMQTTPORT/${CLOUDMQTTPORT}/" /data/flows.json
RUN sed -i -e "s/DOCKER_INFLUXDB_INIT_ORG/${DOCKER_INFLUXDB_INIT_ORG}/" -e "s/DOCKER_INFLUXDB_INIT_BUCKET/${DOCKER_INFLUXDB_INIT_BUCKET}/" /data/flows.json

