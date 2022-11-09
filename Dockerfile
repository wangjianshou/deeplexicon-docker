from ubuntu:18.04
##from nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04
#from nvidia/cuda:11.1-cudnn8-devel-ubuntu18.04
RUN apt-get update && \
    apt-get install -y wget git &&\
    wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
ENV PATH /opt/miniconda/bin:$PATH
RUN mkdir -p /opt/miniconda && \
    sh miniconda.sh -bfp /opt/miniconda && \
    rm miniconda.sh && \
    rm -r /opt/miniconda/pkgs && \
    /bin/bash -c "source /opt/miniconda/bin/activate" && conda init &&\
    conda install python=3.7 && \
    pip install Keras==2.2.4 Pandas PyTs==0.8.0 Scikit-learn numba==0.45.0 TensorFlow==1.13.1 -i https://pypi.doubanio.com/simple &&\
    pip install -U llvmlite==0.32.1 -i https://pypi.doubanio.com/simple
RUN pip install -U h5py==2.10.0 -i https://pypi.doubanio.com/simple
WORKDIR /work
COPY deeplexicon /work/deeplexicon
