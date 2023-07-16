# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.2/containers/ruby/.devcontainer/base.Dockerfile

# [Choice] Ruby version (use -bullseye variants on local arm64/Apple Silicon): 3, 3.1, 3.0, 2, 2.7, 3-bullseye, 3.1-bullseye, 3.0-bullseye, 2-bullseye, 2.7-bullseye, 3-buster, 3.1-buster, 3.0-buster, 2-buster, 2.7-buster
ARG VARIANT="3.2-bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/ruby:${VARIANT}

# Install Rails
RUN gem install rails webdrivers

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="none"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends \
     fzf fontconfig ripgrep \
     manpages-ja manpages-ja-dev mariadb-client curl

# Install gh
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
     && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
     && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
     && sudo apt update \
     && sudo apt install gh -y

RUN echo "ja_JP.UTF-8 UTF-8" | tee -a /etc/locale.gen; locale-gen

# Set timezone to JST
RUN ln -sf /usr/share/zoneinfo/Japan /etc/localtime

# [Optional] Uncomment this line to install additional gems.
RUN gem install foreman rubocop htmlbeautifier rubocop-rails rubocop-rspec

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1