FROM eclipse-mosquitto
ARG LOCALMQTTUSER
ARG LOCALMQTTPASS
ENV LOCALMQTTUSER=${LOCALMQTTUSER}
ENV LOCALMQTTPASS=${LOCALMQTTPASS}
RUN echo ${LOCALMQTTUSER} ${LOCALMQTTPASS}
COPY ./mosquitto.conf /mosquitto/config/
COPY ./passwd /mosquitto/
RUN echo $LOCALMQTTUSER
RUN mosquitto_passwd -b /mosquitto/passwd $LOCALMQTTUSER $LOCALMQTTPASS
# RUN mosquitto_passwd -b /mosquitto/passwd 'testuser' 'testpass'