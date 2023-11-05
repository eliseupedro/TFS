FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y 
RUN apt upgrade -y 
RUN apt dist-upgrade
RUN apt-get update
RUN apt-get install git-all -y --fix-missing
RUN apt-get install git cmake build-essential liblua5.2-dev libgmp3-dev libmysqlclient-dev libboost-system-dev libboost-iostreams-dev libboost-filesystem-dev libpugixml-dev libcrypto++-dev libfmt-dev -y
RUN git clone --recursive https://github.com/eliseupedro/TFS.git
WORKDIR /TFS
RUN mkdir build
WORKDIR /TFS/build
RUN cmake ..
RUN make
RUN cp /TFS/build/tfs /TFS/tfs
WORKDIR /TFS
ENTRYPOINT ["/TFS/tfs"]
