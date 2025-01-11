FROM ubuntu:22.04

# Prevent interactive prompts during packages installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install needed packages
RUN apt-get update && apt-get install -y \
  build-essential \
  curl \
  git \
  gh \
  npm \
  nano \
  vim \
  # Add any more packages you like here
  && rm -rf /var/lib/apt/lists/*

# install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# install n globally
RUN npm install -g n && n stable

# (Optional) Install Yarn globally
RUN npm install -g pnpm@latest-10

# Create a directory for your app and move into it
WORKDIR /app

# Clone the architect repo into the app directory
RUN git clone https://github.com/codingbutter/architect.git .

# Install the dependencies
RUN pnpm install

# Expose the port the app runs on
EXPOSE 
