FROM nvcr.io/nvidia/tensorrt:20.03-py3

RUN pip install -U pip \
    && pip install \
    torch \
    torchvision \
    termcolor \
    && rm -rf ~/.cache/pip

WORKDIR /opt
RUN git clone https://github.com/NVIDIA-AI-IOT/torch2trt.git \
    && cd torch2trt \
    && python setup.py install \
    && ./test.sh TEST_OUTPUT.md \
    && cd .. \
    && rm -rf torch2trt
