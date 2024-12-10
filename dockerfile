FROM continuumio/miniconda3

RUN apt-get update
RUN apt-get install -y git libpq-dev gcc

RUN useradd -ms /bin/bash qcarchive
USER qcarchive

ADD ./qcfractal-dev.yaml /tmp/requirements.yaml

RUN conda env create -f /tmp/requirements.yaml

# Pull the environment name out of the test_env.yaml
RUN echo "source activate $(head -1 /tmp/requirements.yaml | cut -d' ' -f2)" > ~/.bashrc
ENV PATH /opt/conda/envs/$(head -1 /tmp/requirements.yaml | cut -d' ' -f2)/bin:$PATH

RUN python -m pip install --user --upgrade pip
RUN pip --version
RUN which pip
RUN which python