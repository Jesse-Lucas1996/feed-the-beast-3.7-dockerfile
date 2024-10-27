# Use a base image with Java installed
FROM openjdk:8-jre

# Set the working directory
WORKDIR /opt/minecraft

# Install wget and any other necessary packages
RUN apt-get update && apt-get install -y wget && apt-get clean && rm -rf /var/lib/apt/lists/*

# Download the server installation script and set up the server
RUN set -eux; \
    wget -t 5 --retry-connrefused --waitretry=5 -O serverinstall_35_12180 "https://api.feed-the-beast.com/v1/modpacks/public/modpack/35/12180/server/linux" && \
    chmod +x serverinstall_35_12180 && \
    ./serverinstall_35_12180 && \
    rm serverinstall_35_12180 && \
    ls -la /opt/minecraft

# Copy the server.properties file into the image
COPY server.properties /opt/minecraft/server.properties

# Accept the EULA
RUN echo "eula=true" > eula.txt

# Expose the Minecraft server port
EXPOSE 25565

# Ensure start.sh is executable and use it to start the server
RUN chmod +x start.sh

# Use CMD to run the start script
CMD ["./start.sh"]
