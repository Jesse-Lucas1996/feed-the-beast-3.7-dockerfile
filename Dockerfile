FROM openjdk:8-jre

WORKDIR /opt/minecraft

RUN apt-get update && apt-get install -y wget && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    wget -t 5 --retry-connrefused --waitretry=5 -O serverinstall_35_12180 "https://api.feed-the-beast.com/v1/modpacks/public/modpack/35/12180/server/linux" && \
    chmod +x serverinstall_35_12180 && \
    ./serverinstall_35_12180 && \
    rm serverinstall_35_12180

EXPOSE 25565

RUN echo "eula=true" > eula.txt

CMD ["java", "-Xmx4G", "-Xms2G", "-jar", "FTBserver-1.12.2-3.7.0.jar", "nogui"]
