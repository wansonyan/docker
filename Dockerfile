FROM pytorch/pytorch:1.9.1-cuda11.1-cudnn8-devel

RUN conda install -y faiss-gpu scikit-learn pandas flake8 yapf isort yacs gdown future -c conda-forge

RUN pip install opencv-python tb-nightly

RUN apt-get update && apt-get install -y libgl1-mesa-glx libpci-dev curl nano psmisc

FROM python:3.8-slim-buster

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        git \
        curl \
        ca-certificates \
        libjpeg-dev \
        libpng-dev &&\
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
    
