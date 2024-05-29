# Data Minded Academy - Containerization with Docker
## Exercise 5 - Run a frontend-backend stack

In this exercise, you are asked to reproduce the frontend-backend example shown in the video content 
of the course. You will the source code of the frontend and the backend in, respectively, the 
`example-fronted` and `example-backend` subfolders of this exercise. The apps' `README.md` will guide 
you on how to set them up.

1. Write the Dockerfile of the frontend app. Build it, run it and check if you can access the frontend UI.

2. Write the Dockerfile of the backend app. Build it, run it and check if the server starts successfully.

3. Make the `Test connection to the backend` button of the frontend UI work successfully. To do so, you 
will need to set correctly the environment variables of the backend and frontend apps respectively 
(tips: refer to the note below about `localhost`).

4. Write a `docker-compose.yml` file to run your frontend and backend together instead of running 
them in different terminals. Make sure everything works as expected when you run `docker-compose up`. 

A few notes to consider:

* `localhost` isn't accessible in the Gitpod environments. Instead, you will need to use the `gp` 
(for `gitpod`) CLI tool that will prompt you what is your current GitPod sandbox URL for a given port. 
For example, you can get the URL to your sandbox for port 8080 by running `gp url 8080`. That will 
return you something like `https://8080-amaranth-perch-k21ygfry.ws-eu25.gitpod.io`. You will need to 
use that address instead of `localhost:8080` in your Docker environment variables.

* Make sure you made the Gitpod DNS URL public by releasing the small lock linked to it in the dedicated side panel.