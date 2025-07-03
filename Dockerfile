# Use official lightweight Ubuntu base image
FROM ubuntu:22.04

# Disable interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Install wget and bash
RUN apt-get update && apt-get install -y \
    wget \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Download and install GoTTY binary
RUN wget https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz && \
    tar -xzf gotty_linux_amd64.tar.gz && \
    mv gotty /usr/local/bin/gotty && \
    rm gotty_linux_amd64.tar.gz

# Expose port 8080 (Railway maps this to public URL)
EXPOSE 8080

# Run GoTTY, share bash shell with write access on port 8080
CMD ["gotty", "-w", "-p", "8080", "bash"]
