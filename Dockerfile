FROM ubuntu:16.04

# Install
RUN apt-get -qq update
RUN apt-get install -y cmake g++
RUN apt-get install -y libboost-all-dev libopenblas-dev opencl-headers ocl-icd-libopencl1 ocl-icd-opencl-dev zlib1g-dev
RUN apt-get install -y qt5-default qt5-qmake
RUN CXX=g++ CC=gcc cmake ..
RUN cmake --build . --target leelaz --config Release -- -j2
RUN apt-get install -y python python-tk 
COPY example.sgf .
COPY best-network .
COPY goreviewpartner .
COPY config.ini .
RUN cmake --build . --target leelaz --config Release -- -j2
ENTRYPOINT ["/bin/bash"]
# ENTRYPOINT ["python2", "leela_zero_analysis.py", "--no-gui"]
# CMD ["example.sgf"]