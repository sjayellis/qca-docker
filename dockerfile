FROM continuumio/miniconda3
ADD ./qcfractal-dev.yaml /tmp/requirements.yaml

RUN conda env create -f /tmp/requirements.yaml

# Pull the environment name out of the test_env.yaml
RUN echo "source activate $(head -1 /tmp/requirements.yaml | cut -d' ' -f2)" > ~/.bashrc
ENV PATH /opt/conda/envs/$(head -1 /tmp/requirements.yaml | cut -d' ' -f2)/bin:$PATH