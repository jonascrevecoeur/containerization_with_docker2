FROM node:14.18-slim

#Create and move to app folder
WORKDIR /app

# Copy the deps file inside the container image
COPY package-lock.json /app
COPY package.json /app

# Install requirements
RUN npm install && npm install -g serve

# Copy the static files
COPY src /app/src
COPY public /app/public
COPY start.sh /app

# Define environment variables to use with the image
ENV BACKEND_URL=""
ENV PORT=""

# Define port exposed by the app
EXPOSE 3000

ENTRYPOINT [ "/bin/bash" ]
CMD ["start.sh"]
