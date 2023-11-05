FROM ubuntu:22.04
RUN apt update -y 
RUN apt upgrade -y 
RUN apt dist-upgrade
RUN apt-get update
RUN apt-get install git-all -y 
RUN sudo apt-get install git cmake build-essential liblua5.2-dev libgmp3-dev libmysqlclient-dev libboost-system-dev libboost-iostreams-dev libboost-filesystem-dev libpugixml-dev libcrypto++-dev libfmt-dev
RUN cd /
RUN git clone --recursive https://github.com/eliseupedro/TFS.git
RUN cd TFS
RUN mkdir build && cd build
RUN cmake ..
RUN make
COPY /TFS/build/tfs /TFS/tfs
ENTRYPOINT ["/TFS/tfs"]
