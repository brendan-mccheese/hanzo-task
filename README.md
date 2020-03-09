[![CircleCI](https://circleci.com/gh/brendan-mccheese/hanzo-task/tree/master.svg?style=svg)](https://circleci.com/gh/brendan-mccheese/hanzo-task/tree/master)

# Hanzo SRE Task Code

This repo contains the code required by Hanzo, for their SRE take-home task.

The repo consists of the following:
- A simple flask app
- A simple react frontend that calls API defined in the flask app
- Cypress e2e tests that cover the full stack
- CircleCI config
- Build and deploy bash scripts
- Compose files required for local dev and the e2e test run

As there was no code to go along with the task, I've built out some simple apps
to be used as part of the CI/CD process. It's much easier to show I know what
I'm doing with actual deployable code.

The task defined that it required a flask app and implied a frontend through the mention of e2e tests using cypress. 
As I'm no python expert and cannot build a UI using flask (yet), a react frontend seemed like a more modern thing to add to the stack.

Cypress was mentioned in the task, so I've also added that in, to show I can wire
that into the CI steps.

# Build Steps

The stack is built using circleci as the CI/CD provider. As this is a monorepo, all parts of the stack are built for every commit. For an in-company configuration, the
builds could be limited to require an open PR first to save build credits. As this is
an OS repo, builds are free :).

The standard (CI) build steps are:
 - Build the flask app
 - Build the react app
 - Test the flask app
 - Test the react app
 - Run full stack e2e tests using cypress

The above steps will run for every build and the GitHub repo has been configured to
require these steps to have passed before a PR can be accepted into master.

For master builds there are additional steps:
 - Push new docker images (to docker hub)
 - Approve dev deployment
 - Fake deploy to dev
 - Approve UAT deployment
 - Fake deploy to UAT
 - Approve staging deployment
 - Fake deploy to staging
 - Approve production deployment
 - Fake deploy to production

The deployment order is as defined in the SRE task definition. All deployments are fake as there is no target environments set up.

 # Assumputions

The task states that the flask app has the following dependencies:
- Postgres SQL
- Redis

I've assumed that the required connection secrets for these dependencies are specified as environmental configuration 
(env vars) at the target environments. If that wasn't the case, I could
add them into the CircleCI config and pass through during deployment.

I've assumed that docker images and deployment steps will only occur for **master** builds. Better to not litter the repo with undeployable images.

I've assumed that build-speed is important, so I've implemented docker image
caching throughout the CI process. Caching the images also means that e2e tests are executed against the images that _could_ make it to deployment.

I've assumed the flask app doesn't actually require redis or postgres to run (it doesn't). 
For real world testing, I could wire those into the stack.

The code contained in this repo goes beyond some simple CI config and a few bash
scripts. I'm assuming you'll appreciate the effort ;).
