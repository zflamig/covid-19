FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && ln -s /usr/bin/python3 /usr/local/bin/python \
  && pip3 install --upgrade pip \
  && pip install --upgrade jupyter scipy matplotlib pandas jax jaxlib \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN jupyter notebook --generate-config

RUN echo "" > ~/.jupyter/jupyter_notebook_config.py  \
  && echo "c.NotebookApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_notebook_config.py \ 
  && echo "c.NotebookApp.open_browser = False" >> ~/.jupyter/jupyter_notebook_config.py \
  && echo "c.NotebookApp.allow_root = True" >> ~/.jupyter/jupyter_notebook_config.py \
  && echo "c.NotebookApp.port = 8888" >> ~/.jupyter/jupyter_notebook_config.py \
  && echo "c.NotebookApp.notebook_dir = '/notebooks'" >> ~/.jupyter/jupyter_notebook_config.py \
  && echo "c.NotebookApp.password = ''" >> ~/.jupyter/jupyter_notebook_config.py \
  && echo "c.NotebookApp.token = ''" >> ~/.jupyter/jupyter_notebook_config.py

CMD jupyter notebook
