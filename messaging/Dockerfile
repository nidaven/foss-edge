FROM eclipse-mosquitto
ARG ENVMQTTUSER
ARG ENVMQTTPASS
ENV ENVMQTTUSER=${ENVMQTTUSER}
ENV ENVMQTTPASS=${ENVMQTTPASS}
RUN echo ${ENVMQTTUSER} ${ENVMQTTPASS}
COPY ./mosquitto.conf /mosquitto/config/
COPY ./passwd /mosquitto/
RUN echo $ENVMQTTUSER
RUN mosquitto_passwd -b /mosquitto/passwd $ENVMQTTUSER $ENVMQTTPASS
# RUN mosquitto_passwd -b /mosquitto/passwd 'testuser' 'testpass'