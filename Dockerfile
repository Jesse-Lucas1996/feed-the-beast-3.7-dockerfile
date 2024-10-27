# Use the official itzg/minecraft-server image as the base
FROM itzg/minecraft-server

# Set environment variables for the FTB modpack
ENV TYPE=FTBA \
    FTB_MODPACK_ID=35 \
    FTB_MODPACK_VERSION_ID=12180 \
    EULA=TRUE \
    JAVA_VERSION=8 \
    MEMORY=4G \
    JVM_OPTS="-XX:+UseG1GC -XX:MaxGCPauseMillis=50"

# Expose the Minecraft server port
EXPOSE 25565
