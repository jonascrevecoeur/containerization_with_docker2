# example-frontend

This is a simple frontend in `nodejs` calling a simple backend.

# Prerequisites

Install [node](https://nodejs.org/en/download/). 

Example node installation instructions for LTS node 14.x:
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

Once the `npm` dependencies are installed, you can run the project with:
```
./start.sh
```
The server will run on port 3000.
Test that the project is running by going to `http://localhost:3000`

This application can leverage the following environment variables:

* `BACKEND_URL`: defines at which URL the frontend will try to reach the backend (default is `http://localhost:5000`).
