# Data Minded Academy - Containerization with Docker
## Exercise 8 - Your first CICD pipeline

In the previous exercise, we deployed our application to Heroku closing the cycle from development to production deployment. As you've experienced it, deploying to Heroku took quite a bunch of manual steps. This, added to all the previous requirements we've seen through the course (things like building and testing the image for example) make the whole process quite full of manual steps and, hence, error-prone for humans.

Our goal is this final exercise is to implement a simple yet powerful CICD pipeline with Github Actions. We'll use the code of a simple Python FastAPI application contained in the `project-api` folder. The app code and the Dockerfile are already written for you. Your mission in this exercise will only be to implement the CICD pipeline. We will separate the whole CICD pipeline into two distinct sub-pipelines triggered by various Git events: 
* the PR (pull request) pipeline
* the master pipeline.

**The role of the PR pipeline** will be to make sure our code is passing the suite of unit tests. To do so, we'll also need to build the Docker image. We won't publish the Docker image at this point in time because we are still in a feature branch. It's not definitive before we merge to master.

**The role of the master pipeline** will be to build the image and deploy it to Heroku. This way, everytime a pull request will be approved with some changes in the codebase, the CICD pipeline will take care of deploying the new version of master to Heroku (hence to production directly).

The files defining the Github Actions pipelines are in the `.github` folder at the root of the `project-api` project. The simple existence of this folder enable Github Actions in your repository.

Sounds exciting no ? Let's get started 🛠 !

1. Go to you Github account and create a new repository.

2. Create an SSH key in your Gitpod environment with `ssh-keygen` and link it with your Github account.

2. Push the content of the `project-api` folder to the newly created repository. You can do it following one of these two ways. Make sure you use the SSH URLS from Github:
    * Initialize a repository in the `project-api` folder, create a first commit then link with the remote repository and push (see Github's instructions)
    * Clone the newly-created repository, copy/paste content from the `project-api` folder to your repository folder, commit and push

3. Once pushed for the first time, head to you Github repository and check that a master pipeline has been triggered in the `Actions` panel. You just pushed to master directly so it's expected. Look at what this pipeline is doing (spoiler: it's useless). Find the code defining those actions in the `.github` folder of your repository.

4. As you may know, pushing to `main` directly is evil and chaotic, so head to your Github repository `Settings > Branches > Branch protection rules > Add rule` and create a rule with the following information:
    * Branch name pattern: `main`
    * Require a pull request before merging: `Ticked`
    * Untick the `Require approvals` field 
    * Include administrators: `Ticked`

5. Modify the file `.github/pr-pipeline.yml` (that defines the PR pipeline, you got it) to do the following steps:
    * Build the Docker image with:
    ```
    git_hash=$(git rev-parse --short HEAD)
    docker build . -t project-api:$git_hash
    ```

    * Test the Docker image built before with:
    ```
    git_hash=$(git rev-parse --short HEAD)
    docker run \
    --entrypoint=/bin/bash \
    project-api:$git_hash \
    ./script/test
    ```

6. Create a Pull Request and check everything is working as expected. The Actions panel should display a Pull Request pipeline running/completed recently and a status should be updated in the Pull Request itself. Once everything is okay, merge the PR. See in the Actions panel that you again triggered a master pipeline (still useless tho)

7. Now we want to make the master pipeline useful. First, we need to create an app to Heroku. We will release that app in the master pipeline. As it's a one-off let's do it manually for now: 
```
heroku login -i
heroku create <your-heroku-app-name>
```

8. As you will need to authenticate against Heroku in the CICD pipeline, you will need to store your credentials somewhere (obviosuly not in your code for security reasons). So head to your Github repository and `Settings > Secrets > New repository secret`. Create secrets for the following values:
    *  `HEROKU_API_KEY`: The API key of your account that you can find [on your account page `API Key section`](https://dashboard.heroku.com/account)

Using the `HEROKU_API_KEY` as an environment variable, you don't need to run `heroku login` before performing actions. Note that, in order to be able to use that newly-defined secret in Github Actions workflows, you will need to add the `env` close to your pipeline steps like so:

```
steps:
  - name: Push to Heroku
    env:
      HEROKU_API_KEY: ${{ secrets.HEROKU_API_KEY }}
    run: |
        heroku container:push --app <your-heroku-app-name> web
```


9. Modify the file `.github/master-pipeline.yml` to do the following steps:
    * Install Heroku CLI with: 
    ```
    curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
    ```
    * Build and push the API image to the Heroku registry:
    ```
    heroku container:login
    heroku container:push --app <your-heroku-app-name> web
    ```
    * Release the app: 
    ```
    heroku container:release --app <your-heroku-app-name> web
    ```

10. Create a pull request to merge your changes. Once green at the PR-level, merge it to main. Once done, head to the Actions panel and see if your master pipeline is running as expected. If yes, you should be able to see your changes landing to `https//<your-heroku-app-name> .herokuapp.com`.

Congratulations ! You just created your first CICD pipeline 🥳 🚀 !