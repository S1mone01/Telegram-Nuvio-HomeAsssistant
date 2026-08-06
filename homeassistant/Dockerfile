FROM ghcr.io/astral-sh/uv:debian-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV LANG=en_US.UTF-8
ENV PATH="/app/.venv/bin:$PATH"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        bash \
        git \
        curl \
        ca-certificates \
        locales \
        jq && \
    locale-gen en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the main repository to get the code
# This allows the Home Assistant add-on to build without restructuring the main repo
ARG CACHE_BUST=1.0.5
RUN git clone https://github.com/S1mone01/Telegram-Nuvio-HomeAsssistant.git .

# Install dependencies
RUN uv lock
RUN uv sync --locked

# Copy the custom Home Assistant run script
COPY run.sh /app/run_ha.sh
RUN chmod +x /app/run_ha.sh

CMD ["bash", "/app/run_ha.sh"]
