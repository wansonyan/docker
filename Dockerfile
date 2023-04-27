FROM pytorch/pytorch:1.9.1-cuda11.1-cudnn8-devel

RUN conda install -y faiss-gpu scikit-learn pandas flake8 yapf isort yacs gdown future -c conda-forge

RUN pip install opencv-python tb-nightly

RUN apt-get update && apt-get install -y libgl1-mesa-glx libpci-dev curl nano psmisc

# 安装基础包
RUN apt update && \
    apt install -y \
        wget build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev \
        libreadline-dev libffi-dev libsqlite3-dev libbz2-dev liblzma-dev && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /temp

# 下载python
RUN wget https://www.python.org/ftp/python/3.9.10/Python-3.9.10.tgz && \
    tar -xvf Python-3.9.10.tgz

# 编译&安装python
RUN cd Python-3.9.10 && \
    ./configure --enable-optimizations && \
    make && \
    make install

WORKDIR /workspace

RUN rm -r /temp && \
    ln -s /usr/local/bin/python3 /usr/local/bin/python && \
    ln -s /usr/local/bin/pip3 /usr/local/bin/pip

    
