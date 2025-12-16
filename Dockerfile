#created using AI as an example of what our Dockerfile needs to look like
# Use the official itzg Minecraft Server image as the base
FROM itzg/minecraft-server:latest

# Optional: Set environment variables here (can also be overridden at runtime)
ENV EULA=TRUE \
    TYPE=PAPER \
    MEMORY=2G

# Copy your server configuration files into the container if they exist.
# These will override defaults inside the image.
# Note: Files are only copied if they exist in the build context
RUN mkdir -p /data /startup

# Copy configuration files 
# Uncomment these when we have added these files to the project
# COPY server.properties /data/server.properties
# COPY whitelist.json /data/whitelist.json
# COPY ops.json /data/ops.json

# Copy plugins or mods if they exist
# COPY plugins/ /data/plugins/
# COPY mods/ /data/mods/

# Copy startup scripts if they exist
# COPY scripts/ /startup/
# RUN if [ -f /startup/startup.sh ]; then chmod +x /startup/startup.sh; fi

# Expose Minecraft default port
EXPOSE 25565

# Let the base image entrypoint handle everything,
# unless you want to override it (not needed normally).

# This IS A TEST FOR THE WORKFLOW


