# Use a base image with Ubuntu, as it's common and has good package support
FROM ubuntu:24.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages: pandoc, python3, pip, nodejs, npm, clang-format, default-jdk
RUN apt-get update && \
    apt-get install -y \
    pandoc \
    python3 \
    python3-pip \
    nodejs \
    npm \
    git \
    clang-format \
    default-jdk \
    python3-pygments \
    wget \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Install google-java-format
RUN wget https://github.com/google/google-java-format/releases/download/v1.22.0/google-java-format-1.22.0-all-deps.jar -O /usr/local/bin/google-java-format.jar && \
    echo '#!/bin/bash\njava -jar /usr/local/bin/google-java-format.jar "$@"' > /usr/local/bin/google-java-format && \
    chmod +x /usr/local/bin/google-java-format

# Install prettier globally
RUN npm install -g prettier

# Set the working directory inside the container
WORKDIR /app

# Copy the entire book_template directory into the container
COPY . /app

# Set the default command to build the book
# This assumes the Makefile is in my-ebook/
CMD ["make", "-C", "my-ebook"]
