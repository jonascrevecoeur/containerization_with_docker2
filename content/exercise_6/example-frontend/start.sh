#!/bin/bash

# Retrieve environment variables or set defaults
BACKEND_URL=${BACKEND_URL:-http://localhost:5000}

# Generate a .env file
echo "REACT_APP_BACKEND_URL=$BACKEND_URL" > .env

# Start the server in production mode
npm run build
serve -l 3000 -s build