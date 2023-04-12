FROM node:18-alpine

RUN mkdir /app

COPY CM-memory-seller/* /app

WORKDIR /app

RUN npm install 

CMD ["npm", "start"]



# ______________
# FROM amd64/eclipse-temurin:11
# RUN mkdir /opt/app
# COPY target/japp-1.jar /opt/app

# CMD ["java", "-jar", "/opt/app/japp-1.jar"]

# EXPOSE 8080