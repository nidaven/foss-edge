FROM eclipse-mosquitto
ARG ENVMQTTUSER
ARG ENVMQTTPASS
ENV ENVMQTTUSER=${ENVMQTTUSER}
ENV ENVMQTTPASS=${ENVMQTTPASS}
COPY ./mosquitto.conf /mosquitto/config/
COPY ./passwd /mosquitto/
RUN mosquitto_passwd -b /mosquitto/passwd $ENVMQTTUSER $ENVMQTTPASS
