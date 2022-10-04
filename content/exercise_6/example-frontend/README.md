# example-frontend

This project is created to help learn docker configurations for frontend projects. The README starting from "Prerequisites" is written without Docker in mind so student has to figure out how to construct their configuration based on the README. However, there are some additional helpers added in the README and in the exercise description.

> Notice, that all the information are not needed in all the exercises. Don't just copypaste.

# Prerequisites

Install [node](https://nodejs.org/en/download/). 

Example node install instructions for LTS node 14.x:
```
curl -sL https://deb.nodesource.com/setup_14.x | bash
sudo apt install -y nodejs
```

Check your install with `node -v && npm -v`

Install all packages with:
```
npm install && npm install -g serve
```

# Starting in production mode

## How to run the project

Once the `npm` dependencies installed, you can run the project with:
```
./start.sh
```

This entrypoint script takes care of passing the following environment variables to the React application:
* `BACKEND_URL`: defines at which URL the frontend will try to reach the backend (default is `http://localhost:5000`).

The server will run on port 3000 by default.
Test that the project is running by going to `http://localhost:3000`
