FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

# Install requirements
# build-essential is required by npm `indy-sdk` to build the bindings
RUN apt-get update && \
	apt-get install -y \
	apt-utils \
	build-essential \
	software-properties-common \
	sqlite3 \
	curl

# Install Node from NodeSource
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
	apt-get install -y nodejs

# Install libindy
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88 && \
	add-apt-repository "deb https://repo.sovrin.org/sdk/deb bionic stable" && \
	apt-get update && \
	apt-get install -y libindy

WORKDIR /app
