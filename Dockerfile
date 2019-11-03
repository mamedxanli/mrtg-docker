# Use an official Ubuntu runtime as a parent image
FROM ubuntu:18.04

# Set the working directory to /app
WORKDIR /app

# Copy the script directory contents into the container at /app
#COPY ./scripts /app

RUN apt-get update && apt-get install -y apt-utils apache2 snmpd snmp vim net-tools

# Make port 8060 available to the world outside this container
EXPOSE 80

#CMD [ "/bin/bash", "/apt/setup.sh" ]

# Run when the container launches
#ENTRYPOINT ["./setup.sh"]

