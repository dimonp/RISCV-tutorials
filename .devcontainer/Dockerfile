# Ubuntu based image
FROM ubuntu:22.04

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME && \ 
    useradd --uid $USER_UID --gid $USER_GID -m $USERNAME && \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    apt-get update && \
    apt-get install -y sudo && \
    echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME

# Install core dependencies
RUN apt-get update && \
    apt-get install -y \
    autoconf \
    automake \
    autotools-dev \
    curl \
    python3 \
    python3-pip \
    python3-tomli \
    libmpc-dev \
    libmpfr-dev \
    libgmp-dev \
    gawk \
    build-essential \
    bison \
    flex \
    texinfo \
    gperf \
    libtool \
    patchutils \
    bc \
    zlib1g-dev \
    libexpat-dev \
    ninja-build \
    git \
    cmake \
    libglib2.0-dev \
    libslirp-dev \
    wget \
    xz-utils

# Installing RISC-V Toolchain
RUN wget https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2025.07.03/riscv64-elf-ubuntu-22.04-gcc-nightly-2025.07.03-nightly.tar.xz && \
 tar -xpJf riscv64-elf-ubuntu-22.04-gcc-nightly-2025.07.03-nightly.tar.xz -C /opt && \
 rm riscv64-elf-ubuntu-22.04-gcc-nightly-2025.07.03-nightly.tar.xz

# Setting up the toolchain environment
ENV PATH="/opt/riscv/bin:${PATH}"

# Installing QEMU
RUN apt-get install -y qemu-system qemu-user-static qemu-utils 

# Installing additional utilities
RUN apt-get install -y \
    vim \
    nano \
    gdb \
    gdb-multiarch\
    gdbserver \
    binutils \
    file

COPY *.sh /opt/scripts/
RUN chmod +x /opt/scripts/*.sh
ENV PATH="/opt/scripts:${PATH}"
RUN ln -s /opt/scripts/qkill.sh /usr/bin/qk

# Create a working directory
WORKDIR /workspaces

# Set access rights
RUN chmod 755 /workspaces

# Exposing ports for debugging
EXPOSE 1234
EXPOSE 5005

USER $USERNAME
