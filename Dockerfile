

## 1. SETUP ####################################################

# FROM <image>[:<tag>] [AS <name>]
# COPY [--chown=<user>:<group>] <src>... <dest>
# WORKDIR <path/to/workdir>

FROM library/ubuntu:16.04
COPY . /usr/src/aion
WORKDIR /usr/src/aion

## 2. BUILD ####################################################

# RUN <command>
# ENV <key> <value>
# EXPOSE <port> [<port>/<protocol>...]

RUN apt-get update && apt-get install -y \
	git \
	g++ \
	wget \
	cmake \
	llvm-4.0 \
	libjsoncpp1 \
	libboost1.58-all-dev \
&& rm -rf /var/lib/apt/lists/*

RUN wget "http://download.oracle.com/otn-pub/java/jdk/10.0.2+13/19aef61b38124481863b1413dce1855f/jdk-10.0.2_linux-x64_bin.tar.gz"
RUN wget http://www.us.apache.org/dist/ant/binaries/apache-ant-1.10.5-bin.tar.gz
RUN tar -xvf jdk-10.0.2_linux-x64_bin.tar.gz
RUN tar -xvf apache-ant-1.10.5-bin.tar.gz

ENV JAVA_HOME=/usr/src/aion/jdk-10.0.2
ENV JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8
ENV ANT_HOME=/usr/src/aion/apache-ant-1.10.5
ENV PATH="$ANT_HOME/bin:$JAVA_HOME/bin:$PATH"

RUN git clone --recursive https://github.com/aionnetwork/aion 

WORKDIR /usr/src/aion/aion
RUN git fetch
RUN git checkout master-pre-merge
WORKDIR /usr/src/aion/aion/aion_fastvm
RUN git checkout master
WORKDIR /usr/src/aion/aion/aion_api
RUN git checkout master
WORKDIR /usr/src/aion/aion

RUN ant
RUN cp -r pack/config .
RUN cp -r pack/rt .

## 3. EXECUTE ##################################################

# CMD <command> <param1> <param2>
CMD ./aion.sh
