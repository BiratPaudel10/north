FROM ubuntu:22.04

# Set non-interactive to skip prompts
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    tmate \
    openssh-client \
    curl \
    git \
    procps

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
