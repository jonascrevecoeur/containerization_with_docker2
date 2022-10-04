# Data Minded Academy - Containerization with Docker
## Exercise 7 - Deploy the Streamlit app to Heroku

As you already discovered it, what is super nice with Docker is that you build a Docker image once and, then, run it everywhere. In this exercise, we will demonstrate that by deploying our Streamlit application of exercise 4 directly to the Web by using Heroku. [Heroku](https://www.heroku.com/) is a platform as a service (PaaS) that enables developers to build, run, and operate applications entirely in the cloud.

In our case, we will use Heroku to directly run our Streamlit Docker image without the need of managing any kind of infrastructure (in a serverless fashion). To do so, follow the instructions below:

1. Create an account on [Heroku](https://www.heroku.com/)

2. Back to the terminal, login to Heroku: 
```
heroku login -i
```

3. Create an Heroku app:
```
heroku create <your-heroku-app-name>
```

4. Login to Heroku's Container Registry. This is where we will push our image:
```
heroku container:login
```

5. Build and push the Streamlit image to the Heroku registry:
```
cd /workspace/exercise_7/app
heroku container:push --app <your-heroku-app-name> web 
```

6. Release the app: 
```
heroku container:release --app <your-heroku-app-name> web
```

7. You can browse your app at the URL: `https://<your-heroku-app-name>.herokuapp.com`. Congrats, you just deployed to the Web 🚀 ! 
