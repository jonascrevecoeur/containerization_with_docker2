FROM node:14.18-slim

# Change directory to /app
WORKDIR /app

# Copy the deps file for installation
COPY package.json /app
COPY package-lock.json /app

# Install dependencies
RUN npm install && npm install -g serve

# Copy the static files
COPY src /app/src
COPY public /app/public
COPY start.sh /app

# Define environment variables
ENV BACKEND_URL=""

# Define ports
EXPOSE 3000

ENTRYPOINT ["/bin/bash"]
CMD ["start.sh"]

