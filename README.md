# COVID-19 SIR Model for Chicago

This Jupyter notebook is a simple example of how to build a SIR model for Cook County, Illinois. The infected case count data is pulled from the NYTimes GitHub repository. The population estimate from Cook County comes from Wikipedia for 2018.

Right now this uses [Google Jax](https://github.com/google/jax) for running the ODE model. The optimized `beta` and `gamma` parameters are found using SciPy `optimize.minimize`.

## Working with this notebook using Docker

This repository contains a Dockerfile for reproducing the environment for the Jupyter notebook.

Build the Docker image:

```
docker build -t covid19 .
```

Run the Docker container pointing to a local volume to save notebook changes:

```
docker run -p 8888:8888 -v `pwd`/notebooks:/notebooks --rm -ti covid19
```


