[![Docker Pulls](https://img.shields.io/docker/pulls/halotroop2288/vitasdk-ubuntu.svg)](https://hub.docker.com/r/halotroop2288/vitasdk-ubuntu)
![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/halotroop2288/vitasdk-ubuntu/docker-publish.yml)



# ♡ Vita SDK in a Docker Image ♡

Daily fresh Vita SDK Docker images.

## Features

* Image based on Ubuntu 20.04
* Always with latest stable CMake
* Docker images are built every night at 4:20AM and 4:20PM
* Versioned Nightlies
* Made for GitHub Actions

## Why should I use PSVita SDK Docker images?

Building PS Vita apps in a docker container have several advantages:

 - More reliable - Consistent building environment.
 - Faster - Installing the VitaSDK for every build it's really time consuming
 - Hassle free - Do not spend time in setting up a working environment. All you need to build your PS Vita app is this image.
 
Quick start
---------------
1. **Build a local project with Docker**
    ```bash
    cd your-vita-project
    docker run -v "$PWD:/build/git" -it --rm halotroop2288/vitasdk-ubuntu
    ```
    It will downlaoad the latest PSVita SDK docker image, and mount your local dir where your project is and from there you can build it.
- **GitHub Actions**
  In your GHA workflow, set `runs-on: "ubuntu-20.04"` and `container: halotroop2288/vitasdk-ubuntu`

Versioned Nightlies
----------------------
Every day at 4:20AM and 4:20PM CI scripts craft a new juicy docker image with the latest snapshot of VitaSDK.

If you wanna build your code always against the latest cutting-edge VitaSDK code, please get halotroop2288/vitasdk-ubuntu:<b>latest</b> images.

The list of available image versions can be found [here](https://hub.docker.com/repository/docker/halotroop2288/vitasdk-ubuntu/tags).

Build the image
--------------------
In case you REALLY REALLY wanna make changes to the Docker file itself and build it, please run:
```bash
    docker build -t vitasdk-ubuntu .
``` 
